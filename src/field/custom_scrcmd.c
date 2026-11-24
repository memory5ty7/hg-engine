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
    int foundId = 0;

    char inputStringMsg[12];
    u16 inputStringArray[11];
    CopyStringToU16Array(inputString, inputStringArray, 11);
    LoadNameToCharArray(inputStringArray, inputStringMsg);

    for (int i = 1; i <= MAX_CANONICAL_MON_NUM; i++) {
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

    return foundId;
}

int GetNumberFromInput(String *inputString) {
    //u8 buf[64];
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

        // prompt_number (kind 7): parse species name or number into the result var
        if (args->kind == 7 && retVar != NULL) {
            int foundVar = GetSpeciesIdFromInput(args->nameInputString);
            if (foundVar != 0) {
                *retVar = foundVar;
            }

            foundVar = GetNumberFromInput(args->nameInputString);
            if (foundVar != 0) {
                *retVar = foundVar;
            }
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
