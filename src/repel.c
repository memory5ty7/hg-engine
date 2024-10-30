#include "../include/repel.h"
#include "../include/item.h"
#include "../include/constants/item.h"
#include "../include/bag.h"
#include "../include/constants/file.h"


void Repel_SetCurrentType();

#ifdef IMPLEMENT_REUSABLE_REPELS
u16 ALIGN4 CurrentRepelType = 0;

bool32 PlayerStepEvent_RepelCounterDecrement(SaveData *saveData, FieldSystem *fieldSystem) {
    // Never decrement, allows for the use of the Repellent
    return FALSE;
}

u16 Repel_GetMostRecent() {
    Repel_SetCurrentType();
    return CurrentRepelType;
}

BOOL Repel_Use() {
    SaveData *saveData = SaveBlock2_get();
    void *roamerSaveData = EncDataSave_GetSaveDataPtr(saveData);
    u8* repel_addr = SaveData_GetRepelPtr(roamerSaveData);

    // Change the Repel functionnality to a TRUE/FALSE scenario
    if(*repel_addr==1){
        *repel_addr = 0;
        return TRUE;
    } else {
        *repel_addr = 1;
        return TRUE;
    }

    return FALSE;
}

u8 Repel_GetSteps(u16 item_id, u32 heap_id) {
    return GetItemData(item_id, ITEM_PARAM_ATTACK, heap_id);
}
#endif

void Repel_SetCurrentType() {
#ifdef IMPLEMENT_REUSABLE_REPELS
    u16 item_id = 0;
    BAG_DATA *bag = Sav2_Bag_get(SaveBlock2_get());
    if (Bag_HasItem(bag, ITEM_MAX_REPEL, 1, HEAPID_MAIN_HEAP))
        item_id = ITEM_MAX_REPEL;
    else if (Bag_HasItem(bag, ITEM_SUPER_REPEL, 1, HEAPID_MAIN_HEAP))
        item_id = ITEM_SUPER_REPEL;
    else
        item_id = ITEM_REPEL;

    CurrentRepelType = item_id;
#endif
}
