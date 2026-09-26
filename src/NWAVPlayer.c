/*============================================================\
|  This file was made by TheGameratorT.                       |
|                                                             |
|  This code is meant to work with the following template:    |
|  https://github.com/Overblade/NSMB-ASMReference             |
|                                                             |
|  You may modify this file and use it for whatever you want  |
|  just be sure to credit me (TheGameratorT).                 |
|                                                             |
|  Hope you like it just as much as I had fun coding this!    |
|                                                             |
|  ---------------------------------------------------------  |
|                                                             |
|  NWAV player core.                                          |
|  This is main code that allows for music playback on DS.    |
\============================================================*/

#include "NWAVPlayer.h"

#define CHANNEL_NUM        4
// The same buffer plays on several channels at once, as a single channel is quiet next to the sequences.
#define CHANNEL_MASK       (((1 << NWAV_CHANNEL_COUNT) - 1) << CHANNEL_NUM)
#define CHANNEL_PAN_CENTER 64
#define STREAM_THREAD_PRIO 1
#define THREAD_STACK_SIZE  0x800
#define STRM_BUF_PAGESIZE  (64 * 32)
#define STRM_BUF_PAGES     4
#define STRM_BUF_SIZE      (STRM_BUF_PAGESIZE * STRM_BUF_PAGES)
#define CACHE_LINE_SIZE    32
#define SND_TIMER_CLOCK    (33513982 / 2)
#define SND_ALARM_SHIFT    5
#define PLAY_RATE_MIN      (SND_TIMER_CLOCK / 0xFFFF + 1)
#define PLAY_RATE_MAX      (SND_TIMER_CLOCK / 16)

typedef struct NWAVHeader {
    u32 magic;
    u32 fileSize;
    u32 sampleRate;
    u32 loopStart;
    u32 loopEnd;
    u8 format;
    u8 stereo;
    u8 numEvents;
    u8 padding;
} NWAVHeader;

// Allocated on the heap, as the code region has no room for the buffers.
typedef struct NWAVWork {
    BOOL isPlaying;
    BOOL isPaused;
    int alarmNo;
    int volume;
    u32 dataStart;
    u32 musicEnd;
    u32 cursor;
    BOOL loops;
    int bytesPerSample;
    int bufPage;
    u32 pagesFilled;
    volatile u32 pagesPlayed; // Incremented by the alarm, each time a page was played
    BOOL dataEnded;
    int silentPages; // Pages filled with silence since the end of the data
    NWAVHeader header;
    FSFileID firstFileID;
    FSFile file;
    OSMutex mutex;
    OSMessageQueue msgQueue;
    OSMessage msgBuf;
    OSThread thread;
    u32 threadStack[THREAD_STACK_SIZE / sizeof(u32)];
    u8 streamBuf[STRM_BUF_SIZE] __attribute__((aligned(CACHE_LINE_SIZE)));
} NWAVWork;

static NWAVWork *sWork;

static void NWAV_ApplyVolume(void) {
    if (sWork->isPlaying) {
        SND_SetChannelVolume(CHANNEL_MASK, sWork->volume, SND_CHANNEL_DATASHIFT_NONE);
    }
}

// Mono data is stored contiguously, so a sample's position is directly its offset.
static void NWAV_ReadSamples(u8 *dst, u32 sample, u32 count) {
    NWAVWork *work = sWork;

    FS_SeekFile(&work->file, work->dataStart + sample * work->bytesPerSample, FS_SEEK_SET);
    FS_ReadFile(&work->file, dst, count * work->bytesPerSample);
}

static void NWAV_FillPage(void) {
    NWAVWork *work = sWork;
    u8 *page = &work->streamBuf[work->bufPage * STRM_BUF_PAGESIZE];
    u32 pos = 0;

    work->bufPage = (work->bufPage + 1) % STRM_BUF_PAGES;

    if (!work->dataEnded) {
        while (pos < STRM_BUF_PAGESIZE) {
            u32 limit = work->loops ? work->header.loopEnd : work->musicEnd;
            u32 n;

            if (work->cursor >= limit) {
                if (work->loops) {
                    work->cursor = work->header.loopStart;
                    continue;
                }
                work->dataEnded = TRUE;
                break;
            }

            n = (STRM_BUF_PAGESIZE - pos) / work->bytesPerSample;
            if (n > limit - work->cursor) {
                n = limit - work->cursor;
            }
            NWAV_ReadSamples(page + pos, work->cursor, n);
            work->cursor += n;
            pos += n * work->bytesPerSample;
        }
    } else if (work->silentPages < STRM_BUF_PAGES) {
        // Every page must play the silence before the stream is over.
        work->silentPages++;
    }

    MI_CpuClear8(page + pos, STRM_BUF_PAGESIZE - pos);
    DC_FlushRange(page, STRM_BUF_PAGESIZE);
}

static BOOL NWAV_IsFinished(void) {
    return sWork->dataEnded && sWork->silentPages >= STRM_BUF_PAGES;
}

static void NWAV_AlarmHandler(void *arg) {
    sWork->pagesPlayed++;
    OS_SendMessage(&sWork->msgQueue, arg, OS_MESSAGE_NOBLOCK);
}

static void NWAV_StreamThread(void *arg) {
    NWAVWork *work = sWork;
    OSMessage msg;

    (void)arg;
    while (TRUE) {
        OS_ReceiveMessage(&work->msgQueue, &msg, OS_MESSAGE_BLOCK);
        OS_LockMutex(&work->mutex);
        // Refill every page played since the last wake up, so a late thread (e.g. while the game loads files)
        // doesn't leave the buffer out of phase with the hardware, which would buzz until the stream is restarted.
        while (work->isPlaying && !work->isPaused && work->pagesFilled != work->pagesPlayed) {
            NWAV_FillPage();
            work->pagesFilled++;
        }
        OS_UnlockMutex(&work->mutex);
    }
}

static void NWAV_StartHw(void) {
    NWAVWork *work = sWork;
    int timer = SND_TIMER_CLOCK / work->header.sampleRate;
    u32 alarmPeriod = (u32)timer * (STRM_BUF_PAGESIZE / work->bytesPerSample) >> SND_ALARM_SHIFT;
    int loopStart = 0;
    u32 noCapture = 0;
    u32 flags = 0;
    int i;

    if (work->dataEnded) {
        work->silentPages = STRM_BUF_PAGES;
        return;
    }

    work->bufPage = 0;
    work->pagesFilled = 0;
    work->pagesPlayed = 0;
    for (i = 0; i < STRM_BUF_PAGES; i++) {
        NWAV_FillPage();
    }

    // The channels start together with the timer, so they stay in sync.
    for (i = CHANNEL_NUM; i < CHANNEL_NUM + NWAV_CHANNEL_COUNT; i++) {
        SND_SetupChannelPcm(i, work->header.format, work->streamBuf, SND_CHANNEL_LOOP_REPEAT, loopStart, STRM_BUF_SIZE / sizeof(u32), work->volume, SND_CHANNEL_DATASHIFT_NONE, timer, CHANNEL_PAN_CENTER);
    }
    SND_SetupAlarm(work->alarmNo, alarmPeriod, alarmPeriod, NWAV_AlarmHandler, NULL);
    SND_StartTimer(CHANNEL_MASK, noCapture, 1 << work->alarmNo, flags);
}

static void NWAV_StopHw(void) {
    u32 noCapture = 0;
    u32 flags = 0;

    SND_StopTimer(CHANNEL_MASK, noCapture, 1 << sWork->alarmNo, flags);
}

// Set up on the first stream rather than at boot, like the reference implementation which runs on hardware.
static BOOL NWAV_SetupWork(void) {
    u32 raw;
    NWAVWork *work;
    s32 msgCount = 1;

    if (sWork != NULL) {
        return TRUE;
    }
    raw = (u32)sys_AllocMemory(NWAV_HEAP_ID, sizeof(NWAVWork) + CACHE_LINE_SIZE - 1);
    if (raw == 0) {
        return FALSE;
    }
    work = (NWAVWork *)((raw + CACHE_LINE_SIZE - 1) & ~(CACHE_LINE_SIZE - 1));
    sWork = work;
    MI_CpuClear8(work, sizeof(NWAVWork));
    work->volume = NWAV_VOLUME_MAX;
    FS_ConvertPathToFileID(&work->firstFileID, NWAV_FIRST_FILE);

    OS_InitMutex(&work->mutex);
    OS_InitMessageQueue(&work->msgQueue, &work->msgBuf, msgCount);
    OS_CreateThread(&work->thread, NWAV_StreamThread, NULL, work->threadStack + NELEMS(work->threadStack), sizeof(work->threadStack), STREAM_THREAD_PRIO);
    OS_WakeUpThreadDirect(&work->thread);
    return TRUE;
}

static BOOL NWAV_ReserveHw(void) {
    NWAVWork *work = sWork;

    if (!NNS_SndLockChannel(CHANNEL_MASK)) {
        return FALSE;
    }
    work->alarmNo = NNS_SndAllocAlarm();
    if (work->alarmNo < 0) {
        NNS_SndUnlockChannel(CHANNEL_MASK);
        return FALSE;
    }
    return TRUE;
}

static BOOL NWAV_ReadHeader(void) {
    NWAVWork *work = sWork;
    NWAVHeader *header = &work->header;
    u32 numEvents;

    if (FS_ReadFile(&work->file, header, sizeof(NWAVHeader)) != sizeof(NWAVHeader)
        || header->magic != NWAV_MAGIC
        || header->stereo // Only mono streams are supported
        || header->sampleRate < PLAY_RATE_MIN || header->sampleRate > PLAY_RATE_MAX
        || header->format > SND_WAVE_FORMAT_PCM16) {
        return FALSE;
    }

    work->bytesPerSample = header->format == SND_WAVE_FORMAT_PCM16 ? 2 : 1;

    // Events are not used, skip their IDs (padded to 4 bytes) and their sample positions.
    numEvents = header->numEvents;
    work->dataStart = sizeof(NWAVHeader);
    if (numEvents != 0) {
        work->dataStart += numEvents + (4 - numEvents % 4) + numEvents * sizeof(u32);
    }
    if (header->fileSize <= work->dataStart) {
        return FALSE;
    }

    work->musicEnd = (header->fileSize - work->dataStart) / work->bytesPerSample;
    if (header->loopEnd > work->musicEnd) {
        header->loopEnd = work->musicEnd;
    }
    work->loops = header->loopEnd != 0 && header->loopStart < header->loopEnd;
    return TRUE;
}

BOOL NWAV_PlayTrack(int track, u32 startSample) {
    NWAVWork *work;
    FSFileID fileID;

    if (!NWAV_SetupWork()) {
        return FALSE;
    }
    work = sWork;
    fileID = work->firstFileID;
    NWAV_Stop();

    if (fileID.arc == NULL) {
        return FALSE;
    }
    fileID.file_id += track;
    FS_InitFile(&work->file);
    if (!FS_OpenFileFast(&work->file, fileID)) {
        return FALSE;
    }
    if (!NWAV_ReadHeader() || !NWAV_ReserveHw()) {
        FS_CloseFile(&work->file);
        return FALSE;
    }

    OS_LockMutex(&work->mutex);
    work->cursor = startSample < work->musicEnd ? startSample : 0;
    work->dataEnded = FALSE;
    work->silentPages = 0;
    work->isPlaying = TRUE;
    work->isPaused = FALSE;
    NWAV_StartHw();
    OS_UnlockMutex(&work->mutex);
    return TRUE;
}

void NWAV_Stop(void) {
    NWAVWork *work = sWork;

    OS_LockMutex(&work->mutex);
    if (work->isPlaying) {
        NWAV_StopHw();
        NNS_SndFreeAlarm(work->alarmNo);
        NNS_SndUnlockChannel(CHANNEL_MASK);
        FS_CloseFile(&work->file);
        work->isPlaying = FALSE;
    }
    OS_UnlockMutex(&work->mutex);
}

// Position of the next sample to be buffered.
u32 NWAV_GetPosition(void) {
    return sWork->cursor;
}

void NWAV_SetVolume(int volume) {
    sWork->volume = volume;
    NWAV_ApplyVolume();
}

void NWAV_SetPaused(BOOL paused) {
    NWAVWork *work = sWork;

    OS_LockMutex(&work->mutex);
    if (work->isPlaying && work->isPaused != paused) {
        if (paused) {
            NWAV_StopHw();
        } else {
            NWAV_StartHw();
        }
        work->isPaused = paused;
    }
    OS_UnlockMutex(&work->mutex);
}

void NWAV_Main(void) {
    // The last page of silence was played, release the stream.
    if (sWork != NULL && sWork->isPlaying && NWAV_IsFinished()) {
        NWAV_Stop();
    }
}
