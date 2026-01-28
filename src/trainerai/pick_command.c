#include "../../include/types.h"
#include "../../include/config.h"
#include "../../include/battle.h"
#include "../../include/mega.h"
#include "../../include/pokemon.h"
#include "../../include/trainer_ai.h"
#include "../../include/constants/ability.h"
#include "../../include/constants/species.h"
#include "../../include/constants/battle_script_constants.h"
#include "../../include/constants/battle_message_constants.h"
#include "../../include/constants/item.h"
#include "../../include/constants/hold_item_effects.h"
#include "../../include/constants/move_effects.h"
#include "../../include/constants/moves.h"
#include "../../include/constants/file.h"

BOOL TrainerAI_ShouldSwitch(struct BattleSystem *bsys, int attacker);
/*Helper Functions (ported from Pokeplatinum)*/
BOOL AI_PerishSongKO(struct BattleStruct *battleCtx, int battler);
BOOL AI_CannotDamageWonderGuard(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler);
BOOL AI_OnlyIneffectiveMoves(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler);
BOOL AI_HasSuperEffectiveMove(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler, BOOL alwaysSwitch);
BOOL AI_HasAbsorbAbilityInParty(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler);
BOOL AI_HasPartyMemberWithSuperEffectiveMove(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler, u32 checkEffectiveness, u8 rand);
BOOL AI_IsAsleepWithNaturalCure(struct BattleSystem *battleSys,struct BattleStruct *battleCtx, int battler);
BOOL AI_IsHeavilyStatBoosted(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler);
BOOL TrainerAI_ShouldUseItem(struct BattleSystem *battleSys, int battler);

int LONG_CALL BattleAI_PostKOSwitchIn(struct BattleSystem *battleSys, int battler); //defined in src/battle/ai.c
int TypeMatchupMultiplier(u8 attackingType, u8 defendingType1, u8 defendingType2);

int TrainerAI_PickCommand(struct BattleSystem *battleSys, int battler)
{
    if (TrainerAI_ShouldSwitch(battleSys, battler))
        return PLAYER_INPUT_PARTY;
    return PLAYER_INPUT_FIGHT;
}

BOOL TrainerAI_ShouldSwitch(struct BattleSystem *battleSys UNUSED, int battler UNUSED)
{
    return FALSE;
}

BOOL AI_CannotDamageWonderGuard(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler)
{
    int i, j;
    u16 move;
    int moveType;
    u32 effectiveness;
    struct PartyPokemon *mon;
    int battleType = BattleTypeGet(battleSys);


    if (battleType & (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI | BATTLE_TYPE_TAG)) {
        return FALSE;
    }

    if (battleCtx->battlemon[BATTLER_OPPONENT(battler)].ability == ABILITY_WONDER_GUARD) {
        // Check if we have a super-effective move against the opponent
        for (i = 0; i < GetBattlerLearnedMoveCount(battleSys, battleCtx, battler); i++) {
            move = battleCtx->battlemon[battler].move[i];
            moveType = battleCtx->moveTbl[move].type;

            if (move) {
                effectiveness = 0;
                AITypeCalc(battleCtx,
                     move, 
                     moveType,
                      battleCtx->battlemon[battler].ability,
                       battleCtx->battlemon[BATTLER_OPPONENT(battler)].ability,
                        BattleItemDataGet(battleCtx,battleCtx->battlemon[BATTLER_OPPONENT(battler)].item, 1),
                         battleCtx->battlemon[BATTLER_OPPONENT(battler)].type1,
                          battleCtx->battlemon[BATTLER_OPPONENT(battler)].type2, 
                          &effectiveness);

                if (effectiveness & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) {
                    return FALSE;
                }
            }
        }

        // If we don't, check if any of our party members have a super-effective move
        for (i = 0; i < Battle_GetClientPartySize(battleSys, battler); i++) {
            mon = Battle_GetClientPartyMon(battleSys, battler, i);

            if (GetMonData(mon, MON_DATA_HP, 0) != 0 &&
            GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 0 &&
            GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 494
                && i != battleCtx->sel_mons_no[battler]) {
                for (j = 0; j < CLIENT_MAX; j++) {
                    move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL); 
                    moveType = battleCtx->moveTbl[move].effect; 

                    if (move) {
                        effectiveness = 0;

                        AITypeCalc(battleCtx,
                            move, 
                            moveType,
                            GetMonData(mon, MON_DATA_ABILITY, 0),
                              battleCtx->battlemon[BATTLER_OPPONENT(battler)].ability,
                               BattleItemDataGet(battleCtx,battleCtx->battlemon[BATTLER_OPPONENT(battler)].item, 1),
                                battleCtx->battlemon[BATTLER_OPPONENT(battler)].type1,
                                 battleCtx->battlemon[BATTLER_OPPONENT(battler)].type2, 
                                 &effectiveness);

                        // If this party member has a super-effective move, switch 2/3 of the time
                        if ((effectiveness & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) && BattleRand(battleSys) % 3 < 2) {
                            battleCtx->aiSwitchedPartySlot[battler] = i;
                            return TRUE;
                        }
                    }
                }
            }
        }
    }

    return FALSE;
}
