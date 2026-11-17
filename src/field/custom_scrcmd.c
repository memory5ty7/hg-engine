#include "../../include/pokeheartgold.h"
#include "../../include/script.h"
#include "../../include/pokemon.h"
#include "../../include/constants/file.h"

// repurpose DummyCheckBag
BOOL ScrCmd_NamePlayer(SCRIPTCONTEXT *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    CallTask_NamingScreenCustom(ctx->taskman, 7, 0, 10, 0, NULL, p_var);
    return TRUE;
}

void CallTask_NamingScreenCustom(TaskManager *taskman, int type, int species, int maxLen, int partyIdx, const u16 *defaultStr, u16 *retVar) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    NamingScreenData *data = sys_AllocMemoryLo(HEAPID_WORLD, sizeof(NamingScreenData));
    data->state = 0;
    data->partyIdx = partyIdx;
    data->retVar = retVar;
    data->args = NamingScreen_CreateArgs(HEAPID_WORLD, type, species, maxLen, Save_PlayerData_GetOptionsAddr(fieldSystem->savedata), &fieldSystem->menuInputState);
    data->unk10 = String_New(12, HEAPID_WORLD);

    switch (type) {
    case 1:
        struct PartyPokemon *mon;
        if (partyIdx == 0xff) {
            BugContest *contest = FieldSystem_BugContest_Get(fieldSystem);
            mon = contest->mon;
        } else {
            mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->savedata), data->partyIdx);
        }
        data->args->monGender = GetMonData(mon, MON_DATA_GENDER, NULL);
        data->args->monForm = GetMonData(mon, MON_DATA_FORM, NULL);
        if (defaultStr != NULL) {
            CopyU16ArrayToString(data->unk10, defaultStr);
        }
        break;
    case 5:
        CopyU16ArrayToString(data->unk10, defaultStr);
        break;
    default:
        if (defaultStr != NULL) {
            CopyU16ArrayToString(data->args->nameInputString, defaultStr);
        }
        break;
    }
    TaskManager_Call(taskman, Task_NamingScreenCustom, data);
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

BOOL Task_NamingScreenCustom(TaskManager *taskman) {
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