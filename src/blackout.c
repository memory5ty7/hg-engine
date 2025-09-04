#include "../include/battle.h"
#include "../include/constants/vars_flags.h"
#include "../include/use_item_on_mon.h"
#include "../include/battle.h"
#include "../include/map_events_internal.h"

typedef struct BattleSetup BattleSetup;

typedef struct Encounter {
    u32 *winFlag;
    s32 effect;
    s32 bgm;
    s32 unkC;
    BattleSetup *setup;
} Encounter;

struct BattleSetup {
    u32 battleType;
    u8 padding[0x1D0-0x4];
};

void LONG_CALL MapObjectManager_PauseAllMovement(void *manager);
void LONG_CALL sub_02055218(TaskManager *man, int effect, int bgm);
void LONG_CALL sub_02050724(BattleSetup *setup, FieldSystem *fieldSystem);
BOOL LONG_CALL sub_02093070(FieldSystem *sys);
BOOL LONG_CALL sub_020930C4(FieldSystem *sys);
void LONG_CALL sub_02051660(FieldSystem *fieldSystem, BattleSetup *setup);

void LONG_CALL CallTask_LeaveOverworld(TaskManager *taskManager);
void LONG_CALL CallTask_StartBattle(TaskManager *taskManager, BattleSetup *setup);
BOOL LONG_CALL Encounter_GetResult(Encounter *encounter, FieldSystem *fieldSystem);
void LONG_CALL Encounter_Delete(Encounter *encounter);
BOOL LONG_CALL Save_VarsFlags_CheckHaveFollower(void *state);
void LONG_CALL CallTask_RestoreOverworld(TaskManager *taskManager);
void LONG_CALL CallTask_FadeFromBlack(TaskManager *taskManager);

void LONG_CALL CallTask_Blackout(TaskManager *taskManager);

BOOL ScrCmd_WhiteOut(SCRIPTCONTEXT *ctx) {
    CallTask_Blackout(ctx->taskman);
    return TRUE;
}

BOOL Task_StartEncounter(TaskManager *taskManager) {
    FieldSystem *fieldSystem = taskManager->fieldSystem;
    Encounter *encounter = taskManager->env;
    u32 *state = &taskManager->state;

    switch (*state) {
    case 0:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectMan);
        sub_02055218(taskManager, encounter->effect, encounter->bgm);
        (*state)++;
        break;
    case 1:
        CallTask_LeaveOverworld(taskManager);
        (*state)++;
        break;
    case 2:
        CallTask_StartBattle(taskManager, encounter->setup);
        (*state)++;
        break;
    case 3:
        sub_02050724(encounter->setup, fieldSystem);
        if (encounter->setup->battleType == BATTLE_TYPE_SINGLE || encounter->setup->battleType == BATTLE_TYPE_ROAMER || encounter->setup->battleType == (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI | BATTLE_TYPE_SAFARI)) {
            sub_02093070(fieldSystem);
            sub_020930C4(fieldSystem);
        }

        fieldSystem->unk7E = 0;
        fieldSystem->unk7C = 0;

        if (Encounter_GetResult(encounter, fieldSystem) == FALSE) {
            if (encounter->setup->battleType & BATTLE_TYPE_11) {
                ClearScriptFlag(FLAG_NUZLOCKE_MODE);
                HealParty(SaveData_GetPlayerPartyPtr(fieldSystem->savedata));
            } else {
                Encounter_Delete(encounter);
                return TRUE;
            }
        }

        if (Save_VarsFlags_CheckHaveFollower(SavArray_Flags_get(fieldSystem->savedata))) {
            HealParty(SaveData_GetPlayerPartyPtr(fieldSystem->savedata));
        }

        sub_02051660(fieldSystem, encounter->setup);
        CallTask_RestoreOverworld(taskManager);
        (*state)++;
        break;
    case 4:
        MapObjectMan_UnpauseAllMovement(fieldSystem->mapObjectMan);
        CallTask_FadeFromBlack(taskManager);
        (*state)++;
        break;
    case 5:
        Encounter_Delete(encounter);
        return TRUE;
    }

    return FALSE;
}