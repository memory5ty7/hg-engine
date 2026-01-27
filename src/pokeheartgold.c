#include "../include/types.h"
#include "../include/pokemon.h"
#include "../include/save.h"
#include "../include/constants/file.h"
#include "../include/pokeheartgold.h"
#include "../include/constants/map_sections.h"
#include "../include/constants/vars_flags.h"
#include "../include/npc_trade.h"
#include "../include/map_events_internal.h"
#include "../include/task.h"
#include "../include/nitro.h"
#include "../include/constants/species.h"

void CopyBoxPokemonToPokemon(const struct BoxPokemon *src, struct PartyPokemon *dest)
{
    u32 sp0 = 0;
    CAPSULE sp4;
    struct Mail *mail;
    dest->box = *src;
    if (dest->box.box_lock) {
        dest->box.party_lock = TRUE;
    }

    u32 curHP = GetBoxMonData(src, MON_DATA_RESERVED_114, NULL);

    SetMonData(dest, MON_DATA_STATUS, &sp0);
    SetMonData(dest, MON_DATA_HP, &sp0);
    SetMonData(dest, MON_DATA_MAXHP, &sp0);
    mail = Mail_New(HEAPID_DEFAULT);
    SetMonData(dest, MON_DATA_MAIL_STRUCT, mail);
    sys_FreeMemoryEz(mail);
    SetMonData(dest, MON_DATA_CAPSULE, &sp0);
    MI_CpuClearFast(&sp4, sizeof(sp4));
    SetMonData(dest, MON_DATA_SEAL_COORDS, &sp4);
    RecalcPartyPokemonStats(dest);

    //SetMonData(dest, MON_DATA_HP, &curHP);
}

void setAreaCaughtFlag(int mapSec)
{
    u8 buf[64];
    sprintf(buf,"SetAreaCaughtFlag %d\n",mapSec);
    //debugsyscall(buf);
    u16 varID = VAR_MAPSEC_1 + (int)((int)mapSec / 16);
    SetScriptVar(varID , GetScriptVar(varID) | (1 << (mapSec % 16)));
}

BOOL checkAreaCaughtFlag(int mapSec)
{
    u16 varID = VAR_MAPSEC_1 + (int)(mapSec / 16);
    u16 varValue = GetScriptVar(varID);
    return varValue & (1 << mapSec % 16);
}

BOOL HandleDaycareStep(Daycare *dayCare, struct Party *party, FieldSystem *fieldSystem) {
    u32 friendship;
    struct BoxPokemon *parents[2];
    int cycle_ctr;
    u32 i, n;
    u8 steps;
    u8 compat;
    u8 to_sub;
    struct PartyPokemon *mon;

    u32 mapsec = MapHeader_GetMapSec(fieldSystem->location->mapId);

    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    n = 0;
    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(parents[i], MON_DATA_SPECIES_EXISTS, NULL)) {
            DaycareMon_AddSteps(Save_Daycare_GetMonX(dayCare, i), 1);
            n++;
        }
    }
    if (!Save_Daycare_HasEgg(dayCare) && n == 2) {
        steps = DaycareMon_GetSteps(Save_Daycare_GetMonX(dayCare, 1));
        if (steps == 255) {
            compat = Save_Daycare_CalcCompatibilityInternal(dayCare);
            if (compat > (gf_rand() * 100u / 0xFFFFu)) {
                GenerateEggPID(dayCare);
                sub_0209316C(fieldSystem);
            }
        }
    }
    cycle_ctr = Save_Daycare_GetEggCycleCounter(dayCare);

    if (!CheckScriptFlag(FLAG_NUZLOCKE_MODE) || (!checkAreaCaughtFlag(mapsec) && (mapsec == MAPSEC_POKEMON_DAY_CARE)))
    {
        Save_Daycare_SetEggCycleCounter(dayCare, cycle_ctr + 1);
    }

    if (cycle_ctr + 1 == sub_0206CCD8(fieldSystem)) {
        Save_Daycare_SetEggCycleCounter(dayCare, 0);
        to_sub = GetEggCyclesToSubtract(party);
        for (i = 0; i < party->count; i++) {
            mon = Party_GetMonByIndex(party, i);
            if (GetMonData(mon, MON_DATA_IS_EGG, NULL) && !GetMonData(mon, MON_DATA_CHECKSUM_FAILED, NULL)) {
                friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
                if (friendship != 0) {
                    if (friendship >= to_sub) {
                        friendship -= to_sub;
                    } else {
                        friendship -= 1;
                    }
                    SetMonData(mon, MON_DATA_FRIENDSHIP, &friendship);
                } else {
                    setAreaCaughtFlag(mapsec);
                    return TRUE;
                }
            }
        }
    }
    return FALSE;
}

// repurpose DummyCheckBag
BOOL ScrCmd_NamePlayer(SCRIPTCONTEXT *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    CallTask_NamingScreen(ctx->taskman, 7, 0, 10, 0, NULL, p_var);
    return TRUE;
}

typedef struct Options {
    u16 textSpeed : 4;
    u16 soundMethod : 2;
    u16 battleStyle : 1;
    u16 battleScene : 1;
    u16 buttonMode : 2;
    u16 frame : 5;
    u16 dummy : 1;
} Options;

typedef struct NamingScreenArgs {
    int kind;
    int playerGenderOrMonSpecies; // monSpecies
    int monForm;
    int maxLen;
    int monGender;
    BOOL noInput;
    String *nameInputString;
    u16 nameInputFlat[20];
    int battleMsgId;
    int *pcStorage;
    Options *options;
    int *pMenuInputState;
} NamingScreenArgs;

typedef struct NamingScreenData {
    int state;
    int partyIdx;
    u16 *retVar;
    NamingScreenArgs *args;
    String *unk10;
} NamingScreenData;

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
    u8 buf[64];

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
        sprintf(buf,"Digit %d\n",c1);
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
    u8 buf[64];
    sprintf(buf, "Var id : %d\n", flag_id);
    debugsyscall(buf);
    if (CheckScriptFlag(flag_id))
    {
        ClearScriptFlag(flag_id);
    } else {
        SetScriptFlag(flag_id);
    }
    return TRUE;
}

// repurpose DummyGameCompleted
BOOL ScrCmd_SetWeather(SCRIPTCONTEXT *ctx) {
    u16 *var = ScriptGetVarPointer(ctx);
    u16 weather = *var;
    return TRUE;
}