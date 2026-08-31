#include "../../include/pokeheartgold.h"
#include "../../include/script.h"
#include "../../include/pokemon.h"
#include "../../include/constants/file.h"

// repurpose DummyCheckBag
BOOL ScrCmd_NamePlayer(SCRIPTCONTEXT *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    CallTask_NamingScreen(ctx->taskman, 7, 0, 10, 0, NULL, p_var);
    return TRUE;
}

void LoadNameToCharArray(u16 name[], char buf[]) {
    for (int j = 0; j < 11; j++) {
        if (name[j] == 0xFFFF) {
            buf[j] = '\0';
            break;
        }
        if (name[j] == 0x01BE) {
            buf[j] = '-';
            continue;
        }
        if (name[j] == 0x01DE) {
            buf[j] = ' ';
            continue;
        }
        if (name[j] < 324) {
            buf[j] = name[j] - 234;
            continue;
        } else {
            buf[j] = name[j] - 228;
            continue;
        }
    }
}

int GetSpeciesIdFromInput(String *inputString) {
    //u8 buf[64];

    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, 27, 297, 0);
    
    String *speciesName = String_New(32, 0);
    int foundId = 0;

    char inputStringMsg[12];
    u16 inputStringArray[11];
    CopyStringToU16Array(inputString, inputStringArray, 11);
    LoadNameToCharArray(inputStringArray, inputStringMsg);

    for (int i = 1; i <= MAX_CANONICAL_MON_NUM; i++) {    
        ReadMsgDataIntoString(msgData, i, speciesName);

        char speciesName[12];
        u16 speciesArray[11];
        GetSpeciesNameIntoArray(i, 0, speciesArray);
        LoadNameToCharArray(speciesArray, speciesName);

        BOOL sameArray = TRUE;

        for (int j = 0; j < 12; j++) {
            char c1 = inputStringMsg[j];
            char c2 = speciesName[j];

            if (c1 == '\0' || c1 == (char)0xFF || c2 == '\0' || c2 == (char)0xFF) {
                if (c1 != c2) {
                    sameArray = FALSE;
                }
                break; 
            }

            if (c1 != c2) {             
                sameArray = FALSE;
                break;
            }
        }

        if (sameArray == TRUE)
        {
            foundId = i;
            break;
        }
    }

    String_Delete(speciesName);
    DestroyMsgData(msgData);

    return foundId;
}

int GetNumberFromInput(String *inputString) {
    u8 buf[64];
    char inputStringMsg[12];
    u16 inputStringArray[11];
    
    CopyStringToU16Array(inputString, inputStringArray, 11);
    LoadNameToCharArray(inputStringArray, inputStringMsg);

    int result = 0;
    int i = 0;

    for (int i = 0; i < 12; i++) {
        char c1 = inputStringMsg[i];
        //sprintf(buf,"Digit %d\n",c1);
        //debugsyscall(buf);

        if (c1 >= 55 && c1 <= 55 + 9) {
            result = (result * 10) + (inputStringMsg[i] - 55);
        } else {
            break; 
        }
    }

    return result;
}

BOOL Task_NamingScreen(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    NamingScreenData *data = TaskManager_GetEnvironment(taskman);
    switch (data->state) {
    case 0:
        CallTask_LeaveOverworld(taskman);
        data->state++;
        break;
    case 1:
        CallApplicationAsTask(taskman, 0x02102610, data->args);
        data->state++;
        break;
    case 2:
        CallTask_RestoreOverworld(taskman);
        data->state++;
        break;
    case 3:
        NamingScreenArgs *args = data->args;
        if (args->kind == 1) {
            if (String_Compare(args->nameInputString, data->unk10) == 0) {
                data->args->noInput = 1;
            }
        } else if (args->kind == 5) {
            u16 *var2 = String_cstr(args->nameInputString);
            void *friendGroup = Save_FriendGroup_Get(fieldSystem->savedata);
            if (sub_0202C88C(friendGroup, var2)) {
                data->args->noInput = 2;
            }
        }
        if (data->args->noInput == 0) {
            SetName(taskman);
        }
        u16 *retVar = data->retVar;
        if (data->retVar != NULL) {
            *retVar = data->args->noInput;
        }

        int foundVar = GetSpeciesIdFromInput(args->nameInputString);
        if(foundVar != 0)
        {
            *retVar = foundVar;
        }

        foundVar = GetNumberFromInput(args->nameInputString);
        if(foundVar != 0)
        {
            *retVar = foundVar;
        }

        NamingScreen_DeleteArgs(data->args);
        String_Delete(data->unk10);
        sys_FreeMemoryEz(data);
        return TRUE;
    }
    return FALSE;
}

// repurpose DummyCheckGameCompleted
BOOL ScrCmd_SetClearFlag(SCRIPTCONTEXT *ctx) {
    u16 *flag_var = ScriptGetVarPointer(ctx);
    u16 flag_id = *flag_var;
    //u8 buf[64];
    //sprintf(buf, "Var id : %d\n", flag_id);
    //debugsyscall(buf);

    if (CheckScriptFlag(flag_id))
    {
        ClearScriptFlag(flag_id);
    } else {
        SetScriptFlag(flag_id);
    }
    return TRUE;
}

// repurpose DummyGameCompleted
BOOL ScrCmd_DebugSetVar(SCRIPTCONTEXT *ctx) {
    u16 *var_1 = ScriptGetVarPointer(ctx);
    u16 *var_2 = ScriptGetVarPointer(ctx);

    u16 var_id = *var_1;
    u16 value = GetScriptVar(*var_2);

    //u8 buf[64];
    //sprintf(buf, "Var ID : %d, Value : %d\n", var_id, value);
    //debugsyscall(buf);

    SetScriptVar(var_id, value);

    return TRUE;
}


const u16 hmTable[] = {
    MOVE_CUT, // HM01
    MOVE_FLY, // HM02
    MOVE_SURF, // HM03
    MOVE_STRENGTH, // HM04
    MOVE_WHIRLPOOL, // HM05
    MOVE_ROCK_SMASH, // HM06
    MOVE_WATERFALL, // HM07
    MOVE_ROCK_CLIMB, // HM08
};

BOOL isHMMove(u16 move) {
    for (u8 i = 0; i < 8; i++) {
        if (move == hmTable[i]) {
            return TRUE;
        }
    }
    return FALSE;
}

BOOL PartySlotCanLearnMove(FieldSystem *fieldSystem, u16 move, u16 *slot)
{
    //u8 buf[64];
    //sprintf(buf, "PartySlotCanLearnMove\n");
    //debugsyscall(buf);

    u8 i;
    u16 itemID = 0xFFFF;

    for (i = 0; i < NELEMS(hmTable); i++)
    {
        if (move == hmTable[i])
        {
            itemID = i + ITEM_HM01;
        }
    }

    //sprintf(buf, "ItemID : %d\n", itemID);
    //debugsyscall(buf);

    if (itemID == 0xFFFF)
    {
        *slot = 6;
        return FALSE;
    }

    BAG_DATA *bag = Sav2_Bag_get(fieldSystem->savedata);
    if (!Bag_HasItem(bag, itemID, 1, HEAPID_WORLD))
    {
        *slot = 6;
        return FALSE;
    }

    /*u16 machineMoveIndex = ItemToMachineMoveIndex(itemID);
    //sprintf(buf, "machineMoveIndex : %d\n", machineMoveIndex);
    //debugsyscall(buf);

    u8 partyCount = PokeParty_GetPokeCount(SaveData_GetPlayerPartyPtr(fieldSystem->savedata));

    for (i = 0, *slot = 6; i < partyCount; i++) {
        struct PartyPokemon *mon = Party_GetMonByIndex(SaveData_GetPlayerPartyPtr(fieldSystem->savedata), i);
        if (GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
            continue;
        }

        if (GetMonMachineMoveCompat(mon, machineMoveIndex)) {
            *slot = i;
            break;
       }
    }*/

    // Any mon as long as you have the badge and the HM in the bag.
    //if (*slot == 6)
    //{
        *slot = 0;
    //}

    //sprintf(buf, "slot : %d\n", *slot);
    //debugsyscall(buf);

    return FALSE;
}



int GetIdxOfFirstPartyMonThatCanLearnMove(struct Party *party, u16 move)
{
    //u8 buf[64];
    //sprintf(buf, "GetIdxOfFirstPartyMonThatCanLearnMove\n");
    //debugsyscall(buf);

    u8 i;
    u16 itemID = 0xFFFF;

    for (i = 0; i < NELEMS(hmTable); i++)
    {
        if (move == hmTable[i])
        {
            itemID = i + ITEM_HM01;
        }
    }

    //sprintf(buf, "ItemID : %d\n", itemID);
    //debugsyscall(buf);

    if (itemID == 0xFFFF)
    {
        return 0xFF;
    }

    void *saveData = SaveBlock2_get();
    BAG_DATA *bag = Sav2_Bag_get(saveData);
    if (!Bag_HasItem(bag, itemID, 1, HEAPID_WORLD))
    {
        return 0xFF;
    }

    //u16 machineMoveIndex = ItemToMachineMoveIndex(itemID);
    //sprintf(buf, "machineMoveIndex : %d\n", machineMoveIndex);
    //debugsyscall(buf);

    //u8 partyCount = PokeParty_GetPokeCount(SaveData_GetPlayerPartyPtr(saveData));

    /*for (i = 0; i < partyCount; i++) {
        struct PartyPokemon *mon = Party_GetMonByIndex(SaveData_GetPlayerPartyPtr(saveData), i);
        if (GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
            continue;
        }

        if (GetMonMachineMoveCompat(mon, machineMoveIndex)) {
            return i;
        }
    }*/

    // Any mon as long as you have the badge and the HM in the bag.
    return 0;

    //return 0xFF;
}

int GetIdxOfFirstPartyMonWithMove(struct Party *party, u16 move) {
    int i;
    int n;
    struct PartyPokemon *mon;

    if(isHMMove(move))
    {
        return GetIdxOfFirstPartyMonThatCanLearnMove(party, move);
    }

    n = PokeParty_GetPokeCount(party);
    for (i = 0; i < n; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
            continue;
        }
        if (GetMonData(mon, MON_DATA_MOVE1, NULL) == move
            || GetMonData(mon, MON_DATA_MOVE2, NULL) == move
            || GetMonData(mon, MON_DATA_MOVE3, NULL) == move
            || GetMonData(mon, MON_DATA_MOVE4, NULL) == move) {
            return i;
        }
    }
    return 0xFF;
}

BOOL ScrCmd_GetPartySlotWithMove(SCRIPTCONTEXT *ctx) {
    //u8 buf[64];
    //sprintf(buf, "ScrCmd_GetPartySlotWithMove\n");
    //debugsyscall(buf);

    FieldSystem *fieldSystem = ctx->fsys;
    u16 *slot = ScriptGetVarPointer(ctx);
    u16 move = ScriptGetVar(ctx);
    u8 i;

    if(isHMMove(move))
    {
        return PartySlotCanLearnMove(fieldSystem, move, slot);
    }

    u8 partyCount = PokeParty_GetPokeCount(SaveData_GetPlayerPartyPtr(fieldSystem->savedata));
    for (i = 0, *slot = 6; i < partyCount; i++) {
        struct PartyPokemon *mon = Party_GetMonByIndex(SaveData_GetPlayerPartyPtr(fieldSystem->savedata), i);
        if (GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
            continue;
        }

        if (GetMonData(mon, MON_DATA_MOVE1, NULL) == move || GetMonData(mon, MON_DATA_MOVE2, NULL) == move || GetMonData(mon, MON_DATA_MOVE3, NULL) == move || GetMonData(mon, MON_DATA_MOVE4, NULL) == move) {
            *slot = i;
            break;
        }
    }

    return FALSE;
}


BOOL Task_TryHeadbuttEncounter(TaskManager *taskManager) {
    return TRUE;
}

u8 LONG_CALL Daycare_GetEggCycleLength(FieldSystem *fieldSystem) {
    return 10;
}