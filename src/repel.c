#include "../include/repel.h"

#include "../include/bag.h"
#include "../include/constants/file.h"
#include "../include/constants/item.h"
#include "../include/item.h"

void Repel_SetCurrentType();

u16 ALIGN4 CurrentRepelType = 0;

bool32 PlayerStepEvent_RepelCounterDecrement(SaveData *saveData, FieldSystem *fieldSystem)
{
    return FALSE;
}

u16 Repel_GetMostRecent()
{
    Repel_SetCurrentType();
    return CurrentRepelType;
}

BOOL Repel_Use(u16 item_id, u32 heap_id)
{
    SaveData *saveData = SaveBlock2_get();
    void *roamerSaveData = EncDataSave_GetSaveDataPtr(saveData);
    u8 *repel_addr = SaveData_GetRepelPtr(roamerSaveData);

    u8 repel_steps = *repel_addr;
    *repel_addr = 1 - repel_steps;
    return TRUE;
}

u8 Repel_GetSteps(u16 item_id, u32 heap_id)
{
    return 1;
}

void Repel_SetCurrentType()
{
    CurrentRepelType = ITEM_REPELLENT;
}
