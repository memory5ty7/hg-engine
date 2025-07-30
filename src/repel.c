#include "../include/repel.h"
#include "../include/item.h"
#include "../include/constants/item.h"
#include "../include/bag.h"
#include "../include/constants/file.h"
#include "../include/save.h"


void Repel_SetCurrentType();

u16 ALIGN4 CurrentRepelType = 0;

bool32 PlayerStepEvent_RepelCounterDecrement(SaveData *saveData, FieldSystem *fieldSystem) {
    return FALSE;
}

u16 Repel_GetMostRecent() {
    return ITEM_REPELLENT;
}

BOOL Repel_Use(u16 item_id, u32 heap_id) {

    if(CheckScriptFlag(FLAG_REPELLENT_ON))
    {
        ClearScriptFlag(FLAG_REPELLENT_ON);
    } else {
        SetScriptFlag(FLAG_REPELLENT_ON);
    }
    
    return TRUE;
}

u8 Repel_GetSteps(u16 item_id, u32 heap_id) {
    return CheckScriptFlag(FLAG_REPELLENT_ON) ? 1 : 0;
}

void Repel_SetCurrentType() {

    CurrentRepelType = ITEM_REPELLENT;
}
