#include "../include/repel.h"
#include "../include/item.h"
#include "../include/constants/item.h"
#include "../include/bag.h"
#include "../include/constants/file.h"


void Repel_SetCurrentType();

u16 ALIGN4 CurrentRepelType = 0;

bool32 PlayerStepEvent_RepelCounterDecrement(SaveData *saveData, FieldSystem *fieldSystem) {
    return FALSE;
}


u16 Repel_GetMostRecent() {
    Repel_SetCurrentType();
    return CurrentRepelType;
}

BOOL Repel_Use(u16 item_id, u32 heap_id) {
    SaveData *saveData = SaveBlock2_get();
    void *roamerSaveData = EncDataSave_GetSaveDataPtr(saveData);
    u8* repel_addr = SaveData_GetRepelPtr(roamerSaveData);

    /*
    BAG_DATA *bag = Sav2_Bag_get(saveData);

    item_id = Repel_GetMostRecent();

    if (Bag_TakeItem(bag, item_id, 1, heap_id)) {
        *repel_addr = Repel_GetSteps(item_id, heap_id);
        return TRUE;
    }

    return FALSE;
    */

    u8 repel_steps = *repel_addr;
    *repel_addr = 1 - repel_steps;
    return TRUE;
}

u8 Repel_GetSteps(u16 item_id, u32 heap_id) {
    return 1;
}

void Repel_SetCurrentType() {
    /*
    u16 item_id = 0;
    BAG_DATA *bag = Sav2_Bag_get(SaveBlock2_get());
    if (Bag_HasItem(bag, ITEM_MAX_REPEL, 1, HEAPID_MAIN_HEAP))
        item_id = ITEM_MAX_REPEL;
    else if (Bag_HasItem(bag, ITEM_SUPER_REPEL, 1, HEAPID_MAIN_HEAP))
        item_id = ITEM_SUPER_REPEL;
    else
        item_id = ITEM_REPEL;
    */
    CurrentRepelType = ITEM_REPELLENT;
}