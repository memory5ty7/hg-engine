#include "../include/roamer.h"
#include "../include/script.h"
#include "../include/types.h"
#include "../include/battle.h"
#include "../include/constants/flags.h"
#include "../include/pokeheartgold.h"

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
            condition = STATUS_BURN;
            break;
        case 2:
            condition = STATUS_FREEZE;
            break;
        case 3:
            condition = STATUS_PARALYSIS;
            break;
        case 4:
            condition = STATUS_POISON;
            break;
        case 5:
            condition = STATUS_BAD_POISON;
            break;
        case 6:
            condition = STATUS_SLEEP_0;
            break;
        default:
            condition = GetMonData(partyMon, MON_DATA_STATUS, NULL);
            break;
        }
        SetMonData(partyMon, MON_DATA_STATUS, &condition);
    }

    return FALSE;
}

BOOL LONG_CALL ScrCmd_CreateRoamer(SCRIPTCONTEXT *ctx)
{
    u8 roamerNo = ScriptReadByte(ctx);
    Save_CreateRoamerByID(ctx->fsys->savedata, roamerNo);
    return FALSE;
}

BOOL ScriptUpdateRepellent(SCRIPTCONTEXT *ctx)
{
    u16 unused = ScriptReadByte(ctx);
    u16 *destVar = ScriptGetVarPointer(ctx);

    SaveData *saveData = ctx->fsys->savedata;
    void *roamerSaveData = EncDataSave_GetSaveDataPtr(saveData);
    u8* repel_addr = SaveData_GetRepelPtr(roamerSaveData);

    BOOL ret = *repel_addr;
    
    *repel_addr = 1 - *repel_addr;
    *destVar = ret;

    return FALSE;
}

BOOL ScrCmd_WhiteOut(SCRIPTCONTEXT *ctx) {
    ClearScriptFlag(FLAG_NUZLOCKE_MODE);
    CallTask_Blackout(ctx->taskman);
    return TRUE;
}