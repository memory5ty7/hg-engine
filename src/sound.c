#include "types.h"
#include "config.h"
#include "debug.h"
#include "sound.h"
#include "NWAVPlayer.h"
#include "constants/sndseq.h"

#define NNS_VOLUME_MAX 127

// Streamed audio (base/root/waves)
// A sequence replaced by a stream keeps playing without any channels, so all of the
// game's BGM logic (fades, pausing for fanfares, stopping, save states...) keeps working
// unchanged, and its state is mirrored onto the stream every frame.
// Sequences NWAV_RAIMON1 to LAST_NWAV are replaced by the matching wave file.

typedef struct NWAV_Override {
    u16 seqNo;
    u16 nwav;
} NWAV_Override;

// Use this array to override specific sequences that cannot be reassigned via music_tables.c or DSPRE's header editor
static const NWAV_Override sNwavOverrides[] = {
    { SEQ_GS_POKEMON_THEME, NWAV_TITLE_SCREEN }, // Title screen
    { SEQ_GS_R_1_29, NWAV_RAIMON1},
    { SEQ_GS_R_1_30, NWAV_RAIMON2},
    { SEQ_GS_R_2_30, NWAV_RAIMON2},
};

// Player handles that can be replaced by a stream.
static const u8 sStreamableSndHandles[] = {
    SND_HANDLE_BGM,
    SND_HANDLE_FIELD,
};

// A replaced sequence on each streamable handle.
// Only one is streamed at a time: the others are suspended, e.g. the field music paused during a battle,
// and resume where they were once their sequence is unpaused.
typedef struct StreamedSeq {
    NNSSndSeqPlayer *seqPlayer; // NULL if the handle's sequence isn't replaced
    u16 seqNo;
    u16 track;
    u32 position; // Where the stream resumes
} StreamedSeq;

typedef struct StreamedBGM {
    StreamedSeq seqs[NELEMS(sStreamableSndHandles)];
    StreamedSeq *active; // NULL if no sequence is streamed
    int channelVolume;
} StreamedBGM;

static StreamedBGM sStreamedBGM;

static void Sound_UpdateStreamedBGM(void);

void LONG_CALL NNS_SndInit_Hook(void) {
    NNS_SndInit_Original();
    NWAV_Init();
}

void LONG_CALL NNS_SndMain_Hook(void) {
    // Must run before NNS_SndMain, which starts the sequences prepared this frame.
    Sound_UpdateStreamedBGM();
    NWAV_Main();
    NNS_SndMain_Original();
}

// Returns the wave file replacing the sequence, or -1 if it isn't streamed.
static int Sound_GetStreamTrack(u16 seqNo) {
    int i;

    for (i = 0; i < (int)NELEMS(sNwavOverrides); i++) {
        if (sNwavOverrides[i].seqNo == seqNo) {
            return NWAV_FILE(sNwavOverrides[i].nwav);
        }
    }
    if (IS_NWAV(seqNo)) {
        return NWAV_FILE(seqNo);
    }
    return -1;
}

static void Sound_SilenceSeqPlayer(NNSSndHandle *handle) {
    // No track can allocate a channel, so the sequence doesn't take channels from the other sounds.
    // This only applies to the tracks already opened, and is reset by the game after any sequence starts (GB Sounds).
    u32 allTracks = 0xFFFF;
    u32 noChannels = 0;

    NNS_SndPlayerSetTrackAllocatableChannel(handle, allTracks, noChannels);
    // A null initial volume mutes the whole player on the ARM7, so the sequence stays silent in any case.
    // It's written before NNS_SndMain computes the player volume, and it's left out of the stream volume.
    handle->player->initVolume = 0;
}

static void Sound_SuspendStreamedBGM(void) {
    StreamedSeq *active = sStreamedBGM.active;

    if (active != NULL) {
        active->position = NWAV_GetPosition();
        NWAV_Stop();
        sStreamedBGM.active = NULL;
    }
}

static BOOL Sound_PlayStreamedSeq(StreamedSeq *seq) {
    Sound_SuspendStreamedBGM();
    if (!NWAV_PlayTrack(seq->track, seq->position)) {
        return FALSE;
    }
    sStreamedBGM.active = seq;
    sStreamedBGM.channelVolume = -1;
    return TRUE;
}

static void Sound_ReleaseStreamedSeq(StreamedSeq *seq) {
    if (sStreamedBGM.active == seq) {
        NWAV_Stop();
        sStreamedBGM.active = NULL;
    }
    seq->seqPlayer = NULL;
}

static int Sound_GetFaderVolume(const NNSSndFader *fader) {
    if (fader->counter >= fader->frame) {
        return fader->target >> 8;
    }
    return (fader->origin + (fader->target - fader->origin) * fader->counter / fader->frame) >> 8;
}

// Equivalent of the sequence's output volume, as a linear channel volume.
static int Sound_GetStreamedBGMChannelVolume(const NNSSndSeqPlayer *seqPlayer) {
    // NNS volumes are on a squared curve: combine them as scales, then square the result.
    // The initial volume from the sound archive is left out, as it's specific to the sequence's mix.
    int scale = seqPlayer->player->volume;
    scale = scale * seqPlayer->volume / NNS_VOLUME_MAX;
    scale = scale * Sound_GetFaderVolume(&seqPlayer->fader) / NNS_VOLUME_MAX;
    return scale * scale / NNS_VOLUME_MAX;
}

static void Sound_UpdateStreamedBGM(void) {
    int i;
    int track;
    int volume;
    NNSSndHandle *handle;
    NNSSndSeqPlayer *seqPlayer;
    StreamedSeq *seq;
    StreamedSeq *active;

    for (i = 0; i < (int)NELEMS(sStreamableSndHandles); i++) {
        seq = &sStreamedBGM.seqs[i];
        handle = GF_GetSoundHandle(sStreamableSndHandles[i]);
        seqPlayer = handle->player;

        // Sequences started this frame are still only prepared, so a replaced one is silenced before it plays a note.
        if (seqPlayer != NULL && seqPlayer->prepareFlag && seqPlayer->seqType == NNS_SND_SEQ_TYPE_SEQ) {
            Sound_ReleaseStreamedSeq(seq);
            track = Sound_GetStreamTrack(seqPlayer->seqNo);
            if (track >= 0) {
                seq->track = track;
                seq->position = 0;
                // If the stream is missing or invalid, the sequence plays normally.
                if (Sound_PlayStreamedSeq(seq)) {
                    seq->seqPlayer = seqPlayer;
                    seq->seqNo = seqPlayer->seqNo;
                }
            }
        }

        if (seq->seqPlayer == NULL) {
            continue;
        }
        // The sequence was stopped, finished, or replaced by another one.
        if (seqPlayer != seq->seqPlayer || seqPlayer->status == NNS_SND_SEQ_PLAYER_STATUS_FREE || seqPlayer->seqNo != seq->seqNo) {
            Sound_ReleaseStreamedSeq(seq);
            continue;
        }
        // The GB Sounds code resets the tracks' channels, keep the sequence silent.
        Sound_SilenceSeqPlayer(handle);
    }

    // The streamed sequence was paused for another one, stream the one that plays instead.
    active = sStreamedBGM.active;
    if (active == NULL || active->seqPlayer->pauseFlag) {
        for (i = 0; i < (int)NELEMS(sStreamableSndHandles); i++) {
            seq = &sStreamedBGM.seqs[i];
            if (seq != active && seq->seqPlayer != NULL && !seq->seqPlayer->pauseFlag) {
                if (!Sound_PlayStreamedSeq(seq)) {
                    Sound_ReleaseStreamedSeq(seq);
                }
                break;
            }
        }
    }

    active = sStreamedBGM.active;
    if (active == NULL) {
        return;
    }
    seqPlayer = active->seqPlayer;
    NWAV_SetPaused(seqPlayer->pauseFlag);
    volume = Sound_GetStreamedBGMChannelVolume(seqPlayer);
    if (volume != sStreamedBGM.channelVolume) {
        NWAV_SetVolume(volume);
        sStreamedBGM.channelVolume = volume;
    }
}

static void Sound_StopPlayer(int handleNo, int playerNo) {
    NNSSndHandle *handle = GF_GetSoundHandle(handleNo);
    int fadeFrame = 0;
    int i;

    for (i = 0; i < (int)NELEMS(sStreamableSndHandles); i++) {
        if (sStreamableSndHandles[i] == handleNo) {
            Sound_ReleaseStreamedSeq(&sStreamedBGM.seqs[i]);
        }
    }
    NNS_SndPlayerStopSeqByPlayerNo(playerNo, fadeFrame);
    NNS_SndHandleReleaseSeq(handle);
}

void LONG_CALL GF_SndStopPlayerBgm(void) {
    Sound_StopPlayer(SND_HANDLE_BGM, PLAYER_BGM);
}

void LONG_CALL GF_SndStopPlayerField(void) {
    Sound_StopPlayer(SND_HANDLE_FIELD, PLAYER_FIELD);
}

BOOL LONG_CALL GF_Snd_LoadSeq(int seqNo)
{
    BOOL ret;
    struct SND_WORK *work;

    work = GetSoundDataPointer();
    ret = NNS_SndArcLoadSeq(seqNo, work->heap);
    GF_SndHeapGetFreeSize();

#ifdef DEBUG_SOUND_SSEQ_LOADS
    if (!ret) {
        u8 buf[200];
        sprintf(buf, "[GF_Snd_LoadSeq] Failed to load song %d.  There are 0x%x bytes left in the sound heap.\n", seqNo, SoundHeapFreeSize);
        debugsyscall(buf);
    } else {
        u8 buf[200];
        sprintf(buf, "[GF_Snd_LoadSeq] Loaded song %d.  There are 0x%x bytes left in the sound heap.\n", seqNo, SoundHeapFreeSize);
        debugsyscall(buf);
    }
#endif // DEBUG_SOUND_SSEQ_LOADS

    return ret;
}

BOOL GF_Snd_LoadSeqEx(int seqNo, u32 loadFlag)
{
    BOOL ret;
    struct SND_WORK *work;

    work = GetSoundDataPointer();
    ret = NNS_SndArcLoadSeqEx(seqNo, loadFlag, work->heap);
    GF_SndHeapGetFreeSize();

#ifdef DEBUG_SOUND_SSEQ_LOADS
    if (!ret) {
        u8 buf[200];
        sprintf(buf, "[GF_Snd_LoadSeqEx] Failed to load song %d.  There are 0x%x bytes left in the sound heap.\n", seqNo, SoundHeapFreeSize);
        debugsyscall(buf);
    } else {
        u8 buf[200];
        sprintf(buf, "[GF_Snd_LoadSeqEx] Loaded song %d.  There are 0x%x bytes left in the sound heap (EX).\n", seqNo, SoundHeapFreeSize);
        debugsyscall(buf);
    }
#endif // DEBUG_SOUND_SSEQ_LOADS

    return ret;
}

#ifdef DEBUG_SOUND_SBNK_LOADS

const u8 *NNS_SND_ARC_LOAD_ERROR_STRINGS[] = {
    "NNS_SND_ARC_LOAD_SUCCESS",
    "NNS_SND_ARC_LOAD_ERROR_INVALID_GROUP_NO",
    "NNS_SND_ARC_LOAD_ERROR_INVALID_SEQ_NO",
    "NNS_SND_ARC_LOAD_ERROR_INVALID_SEQARC_NO",
    "NNS_SND_ARC_LOAD_ERROR_INVALID_BANK_NO",
    "NNS_SND_ARC_LOAD_ERROR_INVALID_WAVEARC_NO",
    "NNS_SND_ARC_LOAD_ERROR_FAILED_LOAD_SEQ",
    "NNS_SND_ARC_LOAD_ERROR_FAILED_LOAD_SEQARC",
    "NNS_SND_ARC_LOAD_ERROR_FAILED_LOAD_BANK",
    "NNS_SND_ARC_LOAD_ERROR_FAILED_LOAD_WAVE"
};

#endif // DEBUG_SOUND_SBNK_LOADS

int LONG_CALL NNSi_SndArcLoadBank(int bankNo, u32 loadFlag, void *heap, BOOL bSetAddr, struct SNDBankData **pData)
{
    const NNSSndArcBankInfo *bankInfo;
    const NNSSndArcWaveArcInfo *waveArcInfo;
    SNDBankData *bank = NULL;
    SNDWaveArc *waveArc = NULL;
    int result;
    int i;
    BOOL loadingNewCry = 0, hasLoadedCry = 0;

    // Get bank information
    if (bankNo >= CRY_PSEUDOBANK_START || (bankNo < 495 && bankNo > 1)) // assume all cry banks are loading cries
    {
        bankInfo = NNS_SndArcGetBankInfo(1);
        loadingNewCry = 1;
#ifdef DEBUG_SOUND_SBNK_LOADS
        u8 buf[200];
        sprintf(buf, "[NNSi_SndArcLoadBank] Cry load detected for bank %d (Index %d).\n", bankNo, (bankNo >= CRY_PSEUDOBANK_START) ? (bankNo - (CRY_PSEUDOBANK_START - 544)) : bankNo);
        debugsyscall(buf);
#endif // DEBUG_SOUND_SBNK_LOADS
    } else {
        bankInfo = NNS_SndArcGetBankInfo(bankNo);
    }

#ifdef DEBUG_SOUND_SBNK_LOADS
    if (bankInfo == NULL) {
        u8 buf[200];
        GF_SndHeapGetFreeSize();
        sprintf(buf, "[NNSi_SndArcLoadBank] Failed to load bank %d.  There are 0x%x bytes left in the sound heap.\n", bankNo, SoundHeapFreeSize);
        debugsyscall(buf);
    }
#endif // DEBUG_SOUND_SBNK_LOADS

    if (bankInfo == NULL) {
        return NNS_SND_ARC_LOAD_ERROR_INVALID_BANK_NO;
    }

    // If necessary to load
    if (loadFlag & NNS_SND_ARC_LOAD_BANK) {
        bank = LoadBank(bankInfo->fileId, heap, bSetAddr);
        if (bank == NULL) {
            return NNS_SND_ARC_LOAD_ERROR_FAILED_LOAD_BANK;
        }
    } else {
        bank = (SNDBankData *)NNS_SndArcGetFileAddress(bankInfo->fileId);
    }

    // Load waveform data
    for (i = 0; i < NNS_SND_ARC_BANK_TO_WAVEARC_NUM; i++) {
        u32 waveArcIndex = bankInfo->waveArcNo[i];
        if (loadingNewCry && !hasLoadedCry) {
            waveArcIndex = bankNo;
            hasLoadedCry = 1;
        }

        if (waveArcIndex == NNS_SND_ARC_INVALID_WAVEARC_NO) {
            continue;
        }

        // Get waveform archive information
        waveArcInfo = NNS_SndArcGetWaveArcInfo(waveArcIndex);

        if (waveArcInfo == NULL) {
#ifdef DEBUG_SOUND_SBNK_LOADS
            u8 buf[200];
            GF_SndHeapGetFreeSize();
            sprintf(buf, "[NNSi_SndArcLoadBank] Failed to load waveArc %d using NNS_SndArcGetWaveArcInfo.  There are 0x%x bytes left in the sound heap.\n", waveArcIndex, SoundHeapFreeSize);
            debugsyscall(buf);
#endif // DEBUG_SOUND_SBNK_LOADS

            return NNS_SND_ARC_LOAD_ERROR_INVALID_WAVEARC_NO;
        }

        // Loading waveform archives
        result = NNSi_SndArcLoadWaveArc(waveArcIndex, loadFlag, heap, bSetAddr, &waveArc);

#ifdef DEBUG_SOUND_SBNK_LOADS

        if (result != NNS_SND_ARC_LOAD_SUCCESS) {
            u8 buf[200];
            GF_SndHeapGetFreeSize();
            if (loadingNewCry) {
                sprintf(buf, "[NNSi_SndArcLoadBank] Failure to load waveArc %d using NNSi_SndArcLoadWaveArc (%s) ignored because cry detected and debugging is on.  There are 0x%x bytes left in the sound heap.\n", waveArcIndex, NNS_SND_ARC_LOAD_ERROR_STRINGS[result], SoundHeapFreeSize);
                debugsyscall(buf);
            } else {
                sprintf(buf, "[NNSi_SndArcLoadBank] Failed to load waveArc %d using NNSi_SndArcLoadWaveArc (%s).  There are 0x%x bytes left in the sound heap.\n", waveArcIndex, NNS_SND_ARC_LOAD_ERROR_STRINGS[result], SoundHeapFreeSize);
                debugsyscall(buf);
                return result;
            }
        }

#else

        if (result != NNS_SND_ARC_LOAD_SUCCESS) {
            return result;
        }

#endif // DEBUG_SOUND_SBNK_LOADS

        if (waveArcInfo->flags & NNS_SND_ARC_WAVEARC_SINGLE_LOAD) {
            // Individual waveform loading
            if (loadFlag & NNS_SND_ARC_LOAD_WAVE) {
                if (!LoadSingleWaves(waveArc, bank, i, waveArcInfo->fileId, heap)) {
#ifdef DEBUG_SOUND_SBNK_LOADS
                    {
                        u8 buf[200];
                        GF_SndHeapGetFreeSize();
                        sprintf(buf, "[NNSi_SndArcLoadBank] Failed to load waves for waveArc id %d using LoadSingleWaves.  There are 0x%x bytes left in the sound heap.\n", waveArcIndex, SoundHeapFreeSize);
                        debugsyscall(buf);
                    }
#endif // DEBUG_SOUND_SBNK_LOADS

                    return NNS_SND_ARC_LOAD_ERROR_FAILED_LOAD_WAVE;
                }
            }
        }

        // Associate waveforms with banks
        if (bank != NULL && waveArc != NULL) {
            SND_AssignWaveArc(bank, i, waveArc);

#ifdef DEBUG_SOUND_SBNK_LOADS
            {
                u8 buf[200];
                GF_SndHeapGetFreeSize();
                sprintf(buf, "[NNSi_SndArcLoadBank] Loaded waveArc id %d fully and assigned it to in-progress loaded bank %d.  There are 0x%x bytes left in the sound heap.\n", waveArcIndex, bankNo, SoundHeapFreeSize);
                debugsyscall(buf);
            }
#endif // DEBUG_SOUND_SBNK_LOADS
        }
    }

    if (pData != NULL) {
        *pData = bank;
    }

#ifdef DEBUG_SOUND_SBNK_LOADS
    {
        u8 buf[200];
        GF_SndHeapGetFreeSize();
        sprintf(buf, "[NNSi_SndArcLoadBank] Loaded bank %d.  There are 0x%x bytes left in the sound heap.\n", bankNo, SoundHeapFreeSize);
        debugsyscall(buf);
    }
#endif // DEBUG_SOUND_SBNK_LOADS

    return NNS_SND_ARC_LOAD_SUCCESS;
}

