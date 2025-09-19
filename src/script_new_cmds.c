#include "../include/types.h"
#include "../include/script.h"
#include "../include/battle.h"

#define SCRIPT_NEW_CMD_MAX          256

BOOL Script_RunNewCmd(SCRIPTCONTEXT *ctx) {
    struct PartyPokemon *partyMon;
    FieldSystem *fieldSystem;
    void *party;

    u8 sw = ScriptReadByte(ctx);
    u16 arg0 = ScriptGetVar(ctx);

    fieldSystem = ctx->fsys;
    party = SaveData_GetPlayerPartyPtr(fieldSystem->savedata);
    partyMon = Party_GetMonByIndex(party, arg0);

    u32 condition;

    u8 isEgg = GetMonData(partyMon, MON_DATA_IS_EGG, NULL);

    if (!isEgg)
    {
        switch (sw) {
        case 1:
            condition = STATUS_PARALYSIS;
            break;
        case 2:
            condition = STATUS_BURN;
            break;
        case 3:
            condition = STATUS_FREEZE;
            break;
        case 4:
            condition = STATUS_POISON;
            break;
        default:
            condition = GetMonData(partyMon, MON_DATA_STATUS, NULL);
            break;
        }
        SetMonData(partyMon, MON_DATA_STATUS, &condition);
    }

    return FALSE;
}

BOOL ScriptUpdateRepellent(SCRIPTCONTEXT *ctx)
{
    u16 unused = ScriptReadByte(ctx);
    u16 *destVar = ScriptGetVarPointer(ctx);

    SaveData *saveData = ctx->fsys->savedata;
    void *roamerSaveData = EncDataSave_GetSaveDataPtr(saveData);
    u8* repel_addr = SaveData_GetRepelPtr(roamerSaveData);
    u8 buf[64];

    BOOL ret = *repel_addr;
    sprintf(buf,"ret: %d, value: %d\n",ret,*repel_addr);
    debugsyscall(buf);
    
    *repel_addr = 1 - *repel_addr;
    *destVar = ret;

    return FALSE;
}