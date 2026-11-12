#include "config.h"
#include "debug.h"
#include "types.h"

#include "constants/file.h"

#include "battle.h"
#include "overlay.h"


typedef struct FSOverlayInfoHeader {
    u32 id;
    void *ram_address;
    u32 ram_size;
    u32 bss_size;
    void *sinit_init;
    void *sinit_init_end;
    u32 file_id;
    u32 compressed;
} FSOverlayInfoHeader;

typedef struct FSOverlayInfo {
    FSOverlayInfoHeader header;
    u32 target;
    u32 file_pos[2];
} FSOverlayInfo;

BOOL LONG_CALL FS_LoadOverlayInfo(FSOverlayInfo *info, u32 target, u32 ovyId);
BOOL LONG_CALL FS_LoadOverlayImage(FSOverlayInfo *info);
void LONG_CALL DC_FlushRange(const void *start, u32 size);
void LONG_CALL IC_InvalidateRange(void *start, u32 size);

#define MI_PROCESSOR_ARM9 0
#define CACHE_LINE_SIZE   32
#define HEAP_ID_APP       3      // parent of the battle heap
#define HEAP_FREE_MARGIN  0x2000 // free space is not all one block, so ask for clearly more than needed

#define OVERLAY_NONE 0xFFFFFFFF

static const u32 sWifiSwapOverlays[] = {
    OVERLAY_BATTLECONTROLLER_BEFOREMOVE,
    OVERLAY_SERVERDOPOSTMOVEEFFECTS,
    OVERLAY_SERVERBEFOREACT,
};

static struct {
    u8 *raw;    // heap allocation, NULL if none yet this battle
    u32 *image; // cache line aligned buffer inside raw
    u32 capacity;
    u32 ovyId;  // overlay currently held in the buffer, OVERLAY_NONE if none
    u32 *dest;  // where that overlay is linked to run
    u32 size;   // its size rounded up to a cache line
} sWifiSwap = { NULL, NULL, 0, OVERLAY_NONE, NULL, 0 };

static u32 WifiOverlaySwap_GetSize(u32 ovyId, void **dest)
{
    FSOverlayInfo info;

    if (!FS_LoadOverlayInfo(&info, MI_PROCESSOR_ARM9, ovyId)) {
        return 0;
    }
    if (dest != NULL) {
        *dest = info.header.ram_address;
    }
    return (info.header.ram_size + info.header.bss_size + CACHE_LINE_SIZE - 1) & ~(CACHE_LINE_SIZE - 1);
}

static BOOL WifiOverlaySwap_AllocBuffer(void)
{
    static const u32 heaps[] = { HEAPID_BATTLE_HEAP, HEAP_ID_APP };
    u32 capacity = 0, size;

    for (u32 i = 0; i < NELEMS(sWifiSwapOverlays); i++) {
        size = WifiOverlaySwap_GetSize(sWifiSwapOverlays[i], NULL);
        if (size > capacity) {
            capacity = size;
        }
    }
    if (capacity == 0) {
        return FALSE;
    }

    for (u32 i = 0; i < NELEMS(heaps); i++) {
        // only try when the allocation is sure to fit, a failed allocation is a communication error
        if (GF_ExpHeap_FndGetTotalFreeSize(heaps[i]) >= capacity + CACHE_LINE_SIZE + HEAP_FREE_MARGIN) {
            // extra cache line so the image can be aligned--cache maintenance works on whole lines
            sWifiSwap.raw = sys_AllocMemory(heaps[i], capacity + CACHE_LINE_SIZE);
            break;
        }
    }
    if (sWifiSwap.raw == NULL) {
        return FALSE;
    }

    sWifiSwap.image = (u32 *)(((u32)sWifiSwap.raw + CACHE_LINE_SIZE - 1) & ~(CACHE_LINE_SIZE - 1));
    sWifiSwap.capacity = capacity;
    return TRUE;
}

static void WifiOverlaySwap_Exchange(void)
{
    u32 *a = sWifiSwap.dest, *b = sWifiSwap.image, tmp;

    for (u32 i = 0; i < sWifiSwap.size / 4; i++) {
        tmp = a[i];
        a[i] = b[i];
        b[i] = tmp;
    }

    DC_FlushRange(sWifiSwap.dest, sWifiSwap.size);
    IC_InvalidateRange(sWifiSwap.dest, sWifiSwap.size);
}

/**
 *  @brief forget the buffer.  called at the start of every battle, the previous battle heap is already gone
 */
void WifiOverlaySwap_Reset(void)
{
    memset(&sWifiSwap, 0, sizeof(sWifiSwap));
    sWifiSwap.ovyId = OVERLAY_NONE;
}

/**
 *  @brief TRUE if the overlay image is currently held in the buffer
 */
BOOL WifiOverlaySwap_IsLoaded(u32 ovyId)
{
    return sWifiSwap.ovyId == ovyId;
}

/**
 *  @brief read a fresh copy of the overlay into the buffer without touching the overlay's own ram
 *
 *  @return TRUE on success
 */
BOOL WifiOverlaySwap_Load(u32 ovyId)
{
    FSOverlayInfo info;
    u32 size;

    if (sWifiSwap.raw == NULL && !WifiOverlaySwap_AllocBuffer()) {
        return FALSE;
    }

    if (!FS_LoadOverlayInfo(&info, MI_PROCESSOR_ARM9, ovyId)) {
        return FALSE;
    }
    size = (info.header.ram_size + info.header.bss_size + CACHE_LINE_SIZE - 1) & ~(CACHE_LINE_SIZE - 1);
    if (size > sWifiSwap.capacity) {
        return FALSE;
    }

    sWifiSwap.ovyId = OVERLAY_NONE;
    sWifiSwap.dest = (u32 *)info.header.ram_address;
    sWifiSwap.size = size;

    // load the image into the buffer instead of its real address
    info.header.ram_address = sWifiSwap.image;
    if (!FS_LoadOverlayImage(&info)) {
        return FALSE;
    }

    sWifiSwap.ovyId = ovyId;
    return TRUE;
}

/**
 *  @brief put the overlay in place to be run.  must be followed by WifiOverlaySwap_SwapOut before returning to the main loop
 */
void WifiOverlaySwap_SwapIn(u32 ovyId)
{
    if (sWifiSwap.ovyId == ovyId) {
        WifiOverlaySwap_Exchange();
    }
}

/**
 *  @brief put overlay 0 back, keeping the overlay's state in the buffer
 */
void WifiOverlaySwap_SwapOut(u32 ovyId)
{
    WifiOverlaySwap_SwapIn(ovyId); // the exchange is its own inverse
}

/**
 *  @brief mark the overlay as no longer in use.  the buffer itself is kept for the rest of the battle
 */
void WifiOverlaySwap_Unload(u32 ovyId)
{
    if (sWifiSwap.ovyId == ovyId) {
        sWifiSwap.ovyId = OVERLAY_NONE;
    }
}
