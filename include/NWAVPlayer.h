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
|  NWAV player core declarations.                             |
|  This is the header that allows the engine code to be       |
|  implemented into the game and be accessed externally.      |
\============================================================*/

#ifndef _NWAVPLAYER_H
#define _NWAVPLAYER_H

#include "types.h"
#include "config.h"
#include "debug.h"
#include "sound.h"

#define NWAV_MAGIC 0x5641574E // 'NWAV'

// Streams are opened by file ID, relative to the first file of the waves directory (base/root/waves).
#define NWAV_FIRST_FILE "waves/00_raimon1.nwav"

// Heap used for the stream buffers and thread, allocated once on the first stream.
#define NWAV_HEAP_ID 0

#define NWAV_VOLUME_MAX 127

// Stream amplification: number of hardware channels (from channel 4) playing the stream together.
// Each doubling adds about 6 dB, but every channel is taken away from the sequences and sound effects.
#define NWAV_CHANNEL_COUNT 2

void NWAV_Main(void);

BOOL NWAV_PlayTrack(int track, u32 startSample);

u32 NWAV_GetPosition(void);

void NWAV_Stop(void);

void NWAV_SetVolume(int volume);

void NWAV_SetPaused(BOOL paused);

// Streamed Audio
void LONG_CALL NNS_SndMain_Original(void);

// NitroSDK types, only used through pointers
typedef struct { u32 data[0x48 / sizeof(u32)]; } FSFile;
typedef struct { u32 data[0xC8 / sizeof(u32)]; } OSThread;
typedef struct { u32 data[0x18 / sizeof(u32)]; } OSMutex;
typedef struct { u32 data[0x20 / sizeof(u32)]; } OSMessageQueue;

typedef struct FSFileID {
    void *arc;
    u32 file_id;
} FSFileID;

typedef void *OSMessage;
typedef void (*SNDAlarmHandler)(void *arg);

#define OS_MESSAGE_NOBLOCK 0
#define OS_MESSAGE_BLOCK   1

typedef enum
{
	SND_CHANNEL_DATASHIFT_NONE,
	SND_CHANNEL_DATASHIFT_1BIT,
	SND_CHANNEL_DATASHIFT_2BIT,
	SND_CHANNEL_DATASHIFT_4BIT
} SNDChannelDataShift;

typedef enum
{
	SND_WAVE_FORMAT_PCM8,
	SND_WAVE_FORMAT_PCM16,
	SND_WAVE_FORMAT_ADPCM,
	SND_WAVE_FORMAT_PSG,
	SND_WAVE_FORMAT_NOISE = SND_WAVE_FORMAT_PSG
} SNDWaveFormat;

typedef enum
{
	SND_CHANNEL_LOOP_MANUAL,
	SND_CHANNEL_LOOP_REPEAT,
	SND_CHANNEL_LOOP_1SHOT
} SNDChannelLoop;

typedef enum
{
	FS_SEEK_SET,
	FS_SEEK_CUR,
	FS_SEEK_END
} FSSeekFileMode;

void LONG_CALL OS_WakeUpThreadDirect(OSThread *thread);
void LONG_CALL OS_CreateThread(OSThread *thread, void (*func)(void *), void *arg, void *stack, u32 stackSize, u32 prio);
BOOL LONG_CALL OS_ReceiveMessage(OSMessageQueue *mq, OSMessage *msg, s32 flags);
BOOL LONG_CALL OS_SendMessage(OSMessageQueue *mq, OSMessage msg, s32 flags);
void LONG_CALL OS_InitMessageQueue(OSMessageQueue *mq, OSMessage *msgArray, s32 msgCount);
void LONG_CALL OS_InitMutex(OSMutex *mutex);
void LONG_CALL OS_LockMutex(OSMutex *mutex);
void LONG_CALL OS_UnlockMutex(OSMutex *mutex);

void LONG_CALL MI_CpuFill8(void *dest, u8 data, u32 size);
static inline void MI_CpuClear8(void *dest, u32 size) {
    MI_CpuFill8(dest, 0, size);
}

void LONG_CALL SND_SetupChannelPcm(int chNo, SNDWaveFormat format, const void *dataAddr, SNDChannelLoop loop, int loopStart, int dataLen, int volume, SNDChannelDataShift shift, int timer, int pan);
void LONG_CALL SND_SetChannelVolume(u32 chBitMask, int volume, SNDChannelDataShift shift);
void LONG_CALL SND_SetupAlarm(int alarmNo, u32 tick, u32 period, SNDAlarmHandler handler, void *arg);
void LONG_CALL SND_StopTimer(u32 chBitMask, u32 capBitMask, u32 alarmBitMask, u32 flags);
void LONG_CALL SND_StartTimer(u32 chBitMask, u32 capBitMask, u32 alarmBitMask, u32 flags);
BOOL LONG_CALL NNS_SndLockChannel(u32 chBitFlag);
void LONG_CALL NNS_SndUnlockChannel(u32 chBitFlag);
int LONG_CALL NNS_SndAllocAlarm(void);
void LONG_CALL NNS_SndFreeAlarm(int alarmNo);

BOOL LONG_CALL FS_ConvertPathToFileID(FSFileID *p_fileid, const char *path);
BOOL LONG_CALL FS_SeekFile(FSFile *p_file, s32 offset, FSSeekFileMode origin);
s32  LONG_CALL FS_ReadFile(FSFile *p_file, void *dst, s32 len);
BOOL LONG_CALL FS_CloseFile(FSFile *p_file);
BOOL LONG_CALL FS_OpenFileFast(FSFile *p_file, FSFileID fileID);
void LONG_CALL FS_InitFile(FSFile *p_file);

void LONG_CALL DC_FlushRange(const void *vAddr, u32 size);

#endif //!_NWAVPLAYER_H
