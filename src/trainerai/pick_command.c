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

int BattleAI_PostKOSwitchIn(struct BattleSystem *battleSys, int battler);
int TypeMatchupMultiplier(u8 attackingType, u8 defendingType1, u8 defendingType2);


int AI_CalcBaseDamage(void *bw, struct BattleStruct *sp, int moveno, u32 side_cond,
    u32 field_cond, u16 pow, u8 type UNUSED, u8 attacker, u8 defender, u8 critical, BOOL usePPForAttacker, BOOL usePPForDefender,struct PartyPokemon *pp);
u8 AI_CalcSpeed(void *bw, struct BattleStruct *sp, int client1, int client2, int flag, int client2IsPP, struct PartyPokemon *pp);
int AI_ServerDoTypeCalcMod(void *bw UNUSED, struct BattleStruct *sp, int move_no, int move_type, int attack_client, int defence_client, int damage, u32 *flag, BOOL usePPForAttacker, BOOL usePPForDefender, struct PartyPokemon *pp);


int TrainerAI_PickCommand(struct BattleSystem *bsys, int attacker)
{
    debug_printf("in pick command\n");
    // must declare C89-style to match
    int i;
    u8 battler1, battler2;
    u32 battleType;
    int end;
    struct PartyPokemon *mon;
    struct BattleStruct *ctx = bsys->sp;
    battleType = BattleTypeGet(bsys);

    
    if ((battleType & BATTLE_TYPE_TRAINER) || BATTLER_IS_ENEMY(attacker) == 0) { //w
        debug_printf("1\n");
        if (TrainerAI_ShouldSwitch(bsys, attacker)) {
            // If this is a switch which should use the post-KO switch logic, then do so.
            // If there is no valid battler, pick the first one in party order.
            debug_printf("2\n");
            //if (ctx->aiSwitchedPartySlot[attacker] == 6) {
                debug_printf("about to call postko switchin\n");
                if ((i = BattleAI_PostKOSwitchIn(bsys, attacker)) == 6) {
                    battler1 = attacker;
                    if (battleType & BATTLE_TYPE_TAG
                        || battleType & BATTLE_TYPE_MULTI) {
                        battler2 = battler1;
                    } else {
                        battler2 = BATTLER_ALLY(attacker);
                    }
                    end = Battle_GetClientPartySize(bsys, attacker);

                    for (i = 0; i < end; i++) {


                        mon = Battle_GetClientPartyMon(bsys, attacker, i);

                        if (GetMonData(mon, MON_DATA_HP, 0) != 0 &&
                            GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 0 &&
                            GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 494 
                            && i != ctx->sel_mons_no[battler1]
                            && i != ctx->sel_mons_no[battler2]
                            && i != ctx->aiSwitchedPartySlot[battler1]
                            && i != ctx->aiSwitchedPartySlot[battler2]) {
                            break;
                        }
                    }
                }

                ctx->aiSwitchedPartySlot[attacker] = i;
           // }

            return PLAYER_INPUT_PARTY;
        }
        debug_printf("not going to swap\n")
        // Check if the AI determines that it should use an item
        /*
        if (TrainerAI_ShouldUseItem(bsys, attacker)) {
            return PLAYER_INPUT_ITEM;
        }
        */
        
    }

    
    return PLAYER_INPUT_FIGHT;
}


/**
 * @brief Determine if the AI should use an item on its active battler.
 *
 * Several buffers will be filled, if an item should be used:
 * 1. The item type (e.g., Full Restore, Potion, etc.)
 * 2. Any parameters for the item, e.g. what status condition it heals
 * 3. What item number is used
 *
 * The trainer's pocket of items will also be updated appropriately.
 *
 * @param battleSys
 * @param battler   The AI's battler.
 * @return          TRUE if an item should be used, FALSE if not.
 */

 /*
 BOOL TrainerAI_ShouldUseItem(struct BattleSystem *battleSys, int battler)
 {
     int i;
     u8 aliveMons = 0;
     u16 item;
     u8 hpRestore;
     BOOL result;
     struct Party *party;
     struct PartyPokemon *mon;
     struct BattleStruct *battleCtx = battleSys->sp;
     int battleType = BattleTypeGet(battleSys);
     battleCtx->aiWorkTable.ai_item_condition[battler >> 1] = 0; //not sure if this is correct
     result = FALSE;

     if (battleType & (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI | BATTLE_TYPE_TAG)) {
         return FALSE;
     }

 
     // Don't let the AI partners ever use items in battle against trainers. 
     if (battleType & (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI | BATTLE_TYPE_TAG)
         && battler == BATTLER_PLAYER2) {
         return result;
     }
 
     // Don't try to use items if it's illegal to do so.
     if (battleCtx->battlemon[battler].effect_of_moves & MOVE_EFFECT_FLAG_EMBARGO) {
         return result;
     }
 
     party = BattleSystem_Party(battleSys, battler);
     for (i = 0; i < Party_GetCurrentCount(party); i++) {
         mon = Party_GetPokemonBySlotIndex(party, i);
 
         if (Pokemon_GetValue(mon, MON_DATA_CURRENT_HP, NULL) != 0
             && Pokemon_GetValue(mon, MON_DATA_SPECIES_EGG, NULL) != SPECIES_NONE
             && Pokemon_GetValue(mon, MON_DATA_SPECIES_EGG, NULL) != SPECIES_EGG) {
             aliveMons++;
         }
     }
 
     for (i = 0; i < MAX_TRAINER_ITEMS; i++) {
         if (i == 0 || aliveMons <= AI_CONTEXT.trainerItemCounts[battler >> 1] - i + 1) {
             item = AI_CONTEXT.trainerItems[battler >> 1][i];
 
             if (item == ITEM_NONE) {
                 continue;
             }
 
             if (item == ITEM_FULL_RESTORE) {
                 if (battleCtx->battleMons[battler].curHP < (battleCtx->battleMons[battler].maxHP / 4)
                     && battleCtx->battleMons[battler].curHP) {
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_FULL_RESTORE;
                     result = TRUE;
                 }
             } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_HP_RESTORE)) {
                 hpRestore = BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_HP_RESTORED);
 
                 // Use an HP restore item if the battler is at less than 1/4 HP or if the full HP restore
                 // value of the item would be used.
                 if (hpRestore) {
                     if (battleCtx->battleMons[battler].curHP
                         && (battleCtx->battleMons[battler].curHP < (battleCtx->battleMons[battler].maxHP / 4)
                             || (battleCtx->battleMons[battler].maxHP - battleCtx->battleMons[battler].curHP) > hpRestore)) {
                         AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_HP;
                         result = TRUE;
                     }
                 }
             } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_HEAL_SLEEP)) {
                 if (battleCtx->battleMons[battler].status & MON_CONDITION_SLEEP) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] |= No2Bit(5);
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                     result = TRUE;
                 }
             } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_HEAL_POISON)) {
                 if ((battleCtx->battleMons[battler].status & MON_CONDITION_POISON)
                     || (battleCtx->battleMons[battler].status & MON_CONDITION_TOXIC)) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] |= No2Bit(4);
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                     result = TRUE;
                 }
             } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_HEAL_BURN)) {
                 if (battleCtx->battleMons[battler].status & MON_CONDITION_BURN) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] |= No2Bit(3);
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                     result = TRUE;
                 }
             } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_HEAL_FREEZE)) {
                 if (battleCtx->battleMons[battler].status & MON_CONDITION_FREEZE) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] |= No2Bit(2);
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                     result = TRUE;
                 }
             } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_HEAL_PARALYSIS)) {
                 if (battleCtx->battleMons[battler].status & MON_CONDITION_PARALYSIS) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] |= No2Bit(1);
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                     result = TRUE;
                 }
             } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_HEAL_CONFUSION)) {
                 if (battleCtx->battleMons[battler].statusVolatile & VOLATILE_CONDITION_CONFUSION) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] |= No2Bit(0);
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_RECOVER_STATUS;
                     result = TRUE;
                 }
                 // Don't try to use any of these until after the first turn that a mon is in play.
             } else if ((battleCtx->battleMons[battler].moveEffectsData.fakeOutTurnNumber - battleCtx->totalTurns) >= 0) {
                 if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_ATK_STAGES)) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] = BATTLE_STAT_ATTACK;
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                     result = TRUE;
                 } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_DEF_STAGES)) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] = BATTLE_STAT_DEFENSE;
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                     result = TRUE;
                 } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_SPATK_STAGES)) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] = BATTLE_STAT_SP_ATTACK;
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                     result = TRUE;
                 } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_SPDEF_STAGES)) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] = BATTLE_STAT_SP_DEFENSE;
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                     result = TRUE;
                 } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_SPEED_STAGES)) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] = BATTLE_STAT_SPEED;
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                     result = TRUE;
                 } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_ACC_STAGES)) {
                     AI_CONTEXT.usedItemCondition[battler >> 1] = BATTLE_STAT_ACCURACY;
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_STAT_BOOSTER;
                     result = TRUE;
                 } else if (BattleSystem_GetItemData(battleCtx, item, ITEM_PARAM_GUARD_SPEC)
                     && (battleCtx->sideConditionsMask[1] & SIDE_CONDITION_MIST) == FALSE) {
                     AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_GUARD_SPEC;
                     result = TRUE;
                 }
             } else {
                 // Unrecognized item type
                 AI_CONTEXT.usedItemType[battler >> 1] = ITEM_AI_CATEGORY_MAX;
             }
 
             if (result == TRUE) {
                 AI_CONTEXT.usedItem[battler >> 1] = item;
                 AI_CONTEXT.trainerItems[battler >> 1][i] = 0;
             }
         }
     }
 
     return result;
 }
 */

BOOL TrainerAI_ShouldSwitch(struct BattleSystem *bsys, int attacker)
{
    int i, aliveMons;
    u32 battler1, battler2, maxHP = 0;
    u32 battleType;
    int start;
    int end;
    struct PartyPokemon *mon;
    struct BattleStruct *ctx = bsys->sp;
    battleType = BattleTypeGet(bsys);

    if ((battleType & BATTLE_TYPE_TRAINER) || IsClientEnemy(bsys, attacker) == 0) {

        /*Don't try to make illegal switches.
        This includes binding conditions, 
        ingrain, shadow tag, arena trap, and magnet pull*/
        MESSAGE_PARAM message = {0};
        MESSAGE_PARAM *msg = &message;
        
        if(CantEscape(bsys, ctx, attacker, msg)){ 
            return FALSE;
        }

        start = 0;
        end = Battle_GetClientPartySize(bsys, attacker);
        battler1 = attacker;
        if (battleType & BATTLE_TYPE_TAG
            || battleType & BATTLE_TYPE_MULTI)
        {
            battler2 = battler1;
        } else {
            battler2 = BATTLER_ALLY(battler1);
        }

        for (int i = start; i < end; i++)
        {
            u32 currHP = 0;
            mon = Battle_GetClientPartyMon(bsys, attacker, i);

            /* save this for later
            currHP = GetMonData(mon, MON_DATA_HP, NULL);
            maxHP = currHP;
            ctx->aiSwitchedPartySlot[attacker] = i;
            */
            if (GetMonData(mon, MON_DATA_HP, 0) != 0 &&
                GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 0 &&
                GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 494 
                && i != ctx->sel_mons_no[battler1]
                && i != ctx->sel_mons_no[battler2]
                && i != ctx->aiSwitchedPartySlot[battler1]
                && i != ctx->aiSwitchedPartySlot[battler2])
            {
                aliveMons++;
            }
        }
        /*If able to switch and the current state of battle is very bad: switch out!*/
        if(aliveMons){
            if (AI_PerishSongKO(ctx, attacker)) {
                return TRUE;
            }
    
            if (AI_CannotDamageWonderGuard(bsys, ctx, attacker)) {
                return TRUE;
            }
    
            if (AI_OnlyIneffectiveMoves(bsys, ctx, attacker)) {
                return TRUE;
            }
    
            if (AI_HasAbsorbAbilityInParty(bsys, ctx, attacker)) {
                return TRUE;
            }
    
            if (AI_IsAsleepWithNaturalCure(bsys, ctx, attacker)) {
                return TRUE;
            }
    
            // Do not switch if we have a super-effective move.
            // Note that this has a 10% chance of returning FALSE for each of our
            // moves that are super-effective against either opponent.
            if (AI_HasSuperEffectiveMove(bsys, ctx, attacker, FALSE)) {
                return FALSE;
            }
    
            // Never switch if the active battler has 4+ positive stat stages.
            if (AI_IsHeavilyStatBoosted(bsys, ctx, attacker)) {
                return FALSE;
            }
    
            // 33% of the time, switch to a party member with an immunity to the last move that hit
            // this battler which also has a super-effective move against an opposing Pokemon.
            if (AI_HasPartyMemberWithSuperEffectiveMove(bsys, ctx, attacker, MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE, 2)) {
                return TRUE;
            }
    
            // 25% of the time, switch to a party member with an immunity to the last move that hit
            // this battler which also has a super-effective move against an opposing Pokemon.
            if (AI_HasPartyMemberWithSuperEffectiveMove(bsys, ctx, attacker, MOVE_STATUS_FLAG_NOT_EFFECTIVE, 3)) {
                return TRUE;
            }
        
        }

        if (ctx->aiSwitchedPartySlot[attacker] != 6)
            return TRUE;
        
    }
    return FALSE;
}



/**
 * @brief Check if an AI's battler cannot damage the opponent's Pokemon due to
 * Wonder Guard. If so, check for any living party member that can deal damage
 * to that Pokemon, and switch to that mon 66% of the time.
 *
 * This routine does NOT apply to double-battles. (Thanks to Lhea for the Pokeplat code structure!)
 *
 * @param battleSys
 * @param battleCtx
 * @param battler   The AI's battler.
 * @return TRUE if the AI has a switch to make, FALSE otherwise.
 */
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

/**
 * @brief Check if Perish Song is active on a battler and the battler should
 * faint at the end of the turn. If so, treat the next switch as post-KO switch
 * AI.
 *
 * This routine is bugged; it functionally does nothing. The Perish Song turn
 * count decrements at the end of the turn, so the AI never sees that it WILL
 * die to Perish Song.
 *
 * @param battleCtx
 * @param battler   The AI's battler.
 * @return TRUE if the AI has a switch to make, FALSE otherwise.
 */
 BOOL AI_PerishSongKO(struct BattleStruct *battleCtx, int battler)
 {
     if ((battleCtx->battlemon[battler].effect_of_moves & MOVE_EFFECT_FLAG_PERISH_SONG_ACTIVE)
         && battleCtx->battlemon[battler].moveeffect.perishSongTurns == 1) { //adjusted to 1 so the above mentioned bug is fixed.
         battleCtx->aiSwitchedPartySlot[battler] = 6;
         return TRUE;
     }
 
     return FALSE;
 }


 
/**
 * @brief Check if an AI's battler only has moves which do not deal damage to either
 * of the opponent's Pokemon.
 *
 * @param battleSys
 * @param battleCtx
 * @param battler   The AI's battler.
 * @return TRUE if the AI has a switch to make, FALSE otherwise.
 */
BOOL AI_OnlyIneffectiveMoves(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler)
{
    int i, j;
    u8 defender1, defender2;
    u8 aiSlot1, aiSlot2;
    u16 move;
    int type;
    u32 effectiveness;
    int start, end;
    int numMoves;
    struct PartyPokemon *mon;



    int battleType = BattleTypeGet(battleSys);



    // "Player" consts here refer to the AI's perspective.
    if (battleType & (BATTLE_TYPE_DOUBLE)) {
        defender1 = BATTLER_PLAYER;
        defender2 = BATTLER_PLAYER2;
    } else {
        defender1 = BATTLER_PLAYER;
        defender2 = BATTLER_PLAYER;
    }

    // Check all of this mon's attacking moves for immunities. If any of our moves can deal damage to
    // either of the opponents' battlers, do not switch.
    numMoves = 0;
    for (i = 0; i < GetBattlerLearnedMoveCount(battleSys, battleCtx, battler); i++) {
        move = battleCtx->battlemon[battler].move[i];
        type = battleCtx->moveTbl[move].type;

        if (move && battleCtx->moveTbl[move].power) {
            numMoves++;

            effectiveness = 0;
            if (battleCtx->battlemon[defender1].hp) {
                AITypeCalc(battleCtx, move, type, battleCtx->battlemon[battler].ability, battleCtx->battlemon[defender1].ability, BattleItemDataGet(battleCtx,battleCtx->battlemon[defender1].item, 1), battleCtx->battlemon[defender1].type1, battleCtx->battlemon[defender1].type2, &effectiveness);
            }

            if ((effectiveness & MOVE_STATUS_FLAG_NOT_EFFECTIVE) == FALSE) {
                return FALSE;
            }

            effectiveness = 0;
            if (battleCtx->battlemon[defender2].hp) {
                AITypeCalc(battleCtx, move, type, battleCtx->battlemon[battler].ability, battleCtx->battlemon[defender2].ability, BattleItemDataGet(battleCtx,battleCtx->battlemon[defender2].item, 1), battleCtx->battlemon[defender2].type1, battleCtx->battlemon[defender2].type2, &effectiveness);

            }

            if ((effectiveness & MOVE_STATUS_FLAG_NOT_EFFECTIVE) == FALSE) {
                return FALSE;
            }
        }
    }

    // If we have more than 1 attacking move, do not switch.
    if (numMoves < 2) {
        return FALSE;
    }


    aiSlot1 = battler;
    if ( battleType & (BATTLE_TYPE_MULTI | BATTLE_TYPE_TAG)) {
        aiSlot2 = aiSlot1;
    } else {
        aiSlot2 = BATTLER_ALLY(battler);
    }

    

    start = 0;
    end = Battle_GetClientPartySize(battleSys, battler);

    // For each of the AI's active party Pokemon on the bench, check if any of them have a
    // damaging move which is super-effective against either of the player's active Pokemon
    // on the battlefield. If any such Pokemon on the bench exists, switch to it 66% of
    // the time.
    for (i = start; i < end; i++) {
        mon = Battle_GetClientPartyMon(battleSys, battler, i);

        if (GetMonData(mon, MON_DATA_HP, 0) != 0 &&
            GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 0 &&
            GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 494 
            && i != battleCtx->sel_mons_no[aiSlot1]
            && i != battleCtx->sel_mons_no[aiSlot2]
            && i != battleCtx->aiSwitchedPartySlot[aiSlot1]
            && i != battleCtx->aiSwitchedPartySlot[aiSlot2]) {
            for (j = 0; j < CLIENT_MAX; j++) {
                move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL); 
                type = battleCtx->moveTbl[move].effect; 

                if (move && battleCtx->moveTbl[move].power) {

                    effectiveness = 0;
                    if (battleCtx->battlemon[defender1].hp) {
                        AITypeCalc(battleCtx, 
                            move, 
                            type, 
                            GetMonData(mon, MON_DATA_ABILITY, NULL), 
                            battleCtx->battlemon[defender1].ability, 
                            BattleItemDataGet(battleCtx,battleCtx->battlemon[defender1].item, 1),
                             battleCtx->battlemon[defender1].type1, 
                             battleCtx->battlemon[defender1].type2, 
                             &effectiveness);

                    }
                    if ((effectiveness & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) && BattleRand(battleSys) % 3 < 2) {
                        //battleCtx->aiSwitchedPartySlot[battler] = i;
                        return TRUE;
                    }

                    effectiveness = 0;
                    if (battleCtx->battlemon[defender2].hp) {
                        AITypeCalc(battleCtx, 
                            move, 
                            type, 
                            GetMonData(mon, MON_DATA_ABILITY, NULL), 
                            battleCtx->battlemon[defender2].ability, 
                            BattleItemDataGet(battleCtx,battleCtx->battlemon[defender2].item, 1),
                             battleCtx->battlemon[defender2].type1, 
                             battleCtx->battlemon[defender2].type2, 
                             &effectiveness);
                    }
                    if ((effectiveness & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) && BattleRand(battleSys) % 3 < 2) {
                        //battleCtx->aiSwitchedPartySlot[battler] = i;
                        return TRUE;
                    }
                }
            }
        }
    }

    // For each of the AI's active party Pokemon on the bench, check if any of them have a
    // damaging move which is normally-effective against either of the player's active
    // Pokemon on the battlefield. If any such Pokemon on the bench exists, switch to it
    // 50% of the time.
    for (i = start; i < end; i++) {
        mon = Battle_GetClientPartyMon(battleSys, battler, i);

        if (GetMonData(mon, MON_DATA_HP, 0) != 0 &&
            GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 0 &&
            GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 494 
            && i != battleCtx->sel_mons_no[aiSlot1]
            && i != battleCtx->sel_mons_no[aiSlot2]
            && i != battleCtx->aiSwitchedPartySlot[aiSlot1]
            && i != battleCtx->aiSwitchedPartySlot[aiSlot2]) {
            for (j = 0; j < CLIENT_MAX; j++) {
                move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL); 
                type = battleCtx->moveTbl[move].effect; 

                if (move && battleCtx->moveTbl[move].power) {

                    effectiveness = 0;
                    if (battleCtx->battlemon[defender1].hp) {
                        AITypeCalc(battleCtx, 
                            move, 
                            type, 
                            GetMonData(mon, MON_DATA_ABILITY, NULL), 
                            battleCtx->battlemon[defender1].ability, 
                            BattleItemDataGet(battleCtx,battleCtx->battlemon[defender1].item, 1),
                             battleCtx->battlemon[defender1].type1, 
                             battleCtx->battlemon[defender1].type2, 
                             &effectiveness);

                    }
                    if ((effectiveness == 0) && BattleRand(battleSys) % 2 < 1) {
                        //battleCtx->aiSwitchedPartySlot[battler] = i;
                        return TRUE;
                    }

                    effectiveness = 0;
                    if (battleCtx->battlemon[defender2].hp) {
                        AITypeCalc(battleCtx, 
                            move, 
                            type, 
                            GetMonData(mon, MON_DATA_ABILITY, NULL), 
                            battleCtx->battlemon[defender2].ability, 
                            BattleItemDataGet(battleCtx,battleCtx->battlemon[defender2].item, 1),
                             battleCtx->battlemon[defender2].type1, 
                             battleCtx->battlemon[defender2].type2, 
                             &effectiveness);
                    }
                    if ((effectiveness == 0) && BattleRand(battleSys) % 2 < 1) {
                        //battleCtx->aiSwitchedPartySlot[battler] = i;
                        return TRUE;
                    }
                }
            }
        }
    }
    return FALSE;
}



/**
 * @brief Check if the AI's party has a Pokemon on the bench which has an "absorbing"
 * ability for the move which was last used on it (specifically, Volt Absorb, Water
 * Absorb, and Flash Fire).
 *
 * This routine will skip its checks roughly 33% of the time if the AI's battler has
 * a super-effective move. It will also skip its checks if the AI's active battler
 * is the one with the absorbing ability.
 *
 * @param battleSys
 * @param battleCtx
 * @param battler   The AI's battler.
 * @return BOOL
 */
 BOOL AI_HasAbsorbAbilityInParty(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler)
 {
     int i;
     u8 aiSlot1, aiSlot2;
     u8 moveType;
     u8 ability;
     u8 checkAbility;
     int start, end;
     struct PartyPokemon *mon;
 
     int battleType = BattleTypeGet(battleSys);

     // If we have a super-effective move against either opponent, do not switch ~33% of the time.
     if (AI_HasSuperEffectiveMove(battleSys, battleCtx, battler, TRUE) && BattleRand(battleSys) % 3 != 0) {
         return FALSE;
     }
 
     // If we have not been hit by a move by this battler, do not switch.
     if (battleCtx->waza_no_hit[battler] == MOVE_NONE) { //no idea if I am supposed to use waza_no_hit or waza_no_hit_client since they are both undocumented 
                                                         // (I think waza_no_hit stores the last move that a battler, and waza_no_hit_client is the one who did the hitting)
         return FALSE;
     }
 
     // If the last move that hit us does not deal damage, do not switch.
     if (battleCtx->moveTbl[battleCtx->waza_no_hit[battler]].power == 0) {
         return FALSE;
     }
 
     moveType = battleCtx->moveTbl[battleCtx->waza_no_hit[battler]].type;
     if (moveType == TYPE_FIRE) { 
         checkAbility = ABILITY_FLASH_FIRE;
     } else if (moveType == TYPE_WATER) {
         checkAbility = ABILITY_WATER_ABSORB;
     } else if (moveType == TYPE_ELECTRIC) {
         checkAbility = ABILITY_VOLT_ABSORB;
     } else {
         return ABILITY_NONE;
     } //Really should also check lightningrod, storm drain, earth eat, and dry skin -- TODO I guess.
 
     // If our ability absorbs the type of the last move that hit us, do not switch.
     if (battleCtx->battlemon[battler].ability == checkAbility) {
         return FALSE;
     }
 

 
     aiSlot1 = battler;
     if ( battleType & (BATTLE_TYPE_MULTI | BATTLE_TYPE_TAG)) {
         aiSlot2 = aiSlot1;
     } else {
         aiSlot2 = BATTLER_ALLY(battler);
     }      //the idea with this logic is that we double-check our own slot twice if multi battle, but for regular double battles with 1 trainer on either side, we need to check both slots


     start = 0;
     end = Battle_GetClientPartySize(battleSys, battler);
 
     // Check each Pokemon on the bench for one which has an ability that absorbs
     // the last move that was used.
     for (i = start; i < end; i++) {
         mon = Battle_GetClientPartyMon(battleSys, battler, i);
 
         if (GetMonData(mon, MON_DATA_HP, 0) != 0 &&
         GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 0 &&
         GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 494 
         && i != battleCtx->sel_mons_no[aiSlot1]
         && i != battleCtx->sel_mons_no[aiSlot2]
         && i != battleCtx->aiSwitchedPartySlot[aiSlot1]
         && i != battleCtx->aiSwitchedPartySlot[aiSlot2]) {
             ability = GetMonData(mon, MON_DATA_ABILITY, NULL);
 
             // Switch to a matching Pokemon 50% of the time.
             if (checkAbility == ability && (BattleRand(battleSys) & 1)) {
                 //battleCtx->aiSwitchedPartySlot[battler] = i;
                 return TRUE;
             }
         }
     }
 
     return FALSE;
 }


 
/**
 * @brief Check if an AI's battler has a super-effective move against either of the
 * opponent's Pokemon.
 *
 * @param battleSys
 * @param battleCtx
 * @param battler   The AI's battler.
 * @param flag      If TRUE, will always return TRUE if the AI's battler has a super-
 *                  effective move. If FALSE, returns TRUE 90% of the time for either
 *                  target against which the battler has a super-effective move.
 * @return TRUE if the AI's battler has a super-effective move.
 */
BOOL AI_HasSuperEffectiveMove(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler, BOOL flag)
{
    int i;
    u32 effectiveness;
    u8 defender;
    u8 oppositeSlot;
    u16 move;
    int type;
    int battleType = BattleTypeGet(battleSys);
    // Look at the slot directly across from us on the opposite side. i.e.,
    // AI slot 1 looks at player slot 1, AI slot 2 looks at player slot 2

    defender = BATTLER_OPPONENT(battler);
    

    // Check if the player's battler is weak to any of our moves
    for (i = 0; i < CLIENT_MAX; i++) {
        move = battleCtx->battlemon[battler].move[i];
        type = battleCtx->moveTbl[move].type;

        if (move) {
            effectiveness = 0;

            AITypeCalc(battleCtx, 
                move, 
                type, 
                battleCtx->battlemon[battler].ability, 
                battleCtx->battlemon[defender].ability, 
                BattleItemDataGet(battleCtx,battleCtx->battlemon[defender].item, 1),
                 battleCtx->battlemon[defender].type1, 
                 battleCtx->battlemon[defender].type2, 
                 &effectiveness);

            // If the defending mon is weak to our move, return TRUE 90-100% of the time.
            if (effectiveness & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) {
                if (flag) {
                    return TRUE;
                } else if (BattleRand(battleSys) % 10 != 0) {
                    return TRUE;
                }
            }
        }

    }


    // Check the defender's partner the same way as above.
    if ((battleType & BATTLE_TYPE_DOUBLE) == FALSE) {
        return FALSE;
    }
    defender = BATTLER_ALLY(defender);

    for (i = 0; i < CLIENT_MAX; i++) {
        move = battleCtx->battlemon[battler].move[i];
        type = battleCtx->moveTbl[move].type;

        if (move) {
            effectiveness = 0;

            AITypeCalc(battleCtx, 
                move, 
                type, 
                battleCtx->battlemon[battler].ability, 
                battleCtx->battlemon[defender].ability, 
                BattleItemDataGet(battleCtx,battleCtx->battlemon[defender].item, 1),
                 battleCtx->battlemon[defender].type1, 
                 battleCtx->battlemon[defender].type2, 
                 &effectiveness);

            // If the defending mon is weak to our move, return TRUE 90-100% of the time.
            if (effectiveness & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) {
                if (flag) {
                    return TRUE;
                } else if (BattleRand(battleSys) % 10 != 0) {
                    return TRUE;
                }
            }
        }
    }


    return FALSE;
}

/**
* @brief Check if the AI has a party member with a super-effective move, constrained
* to mons with a certain effectiveness matchup against the move that last hit us.
*
* @param battleSys
* @param battleCtx
* @param battler               The AI's battler.
* @param checkEffectiveness    The desired effectiveness mask against the last move.
* @param rand                  Random odds to switch, if conditions are met.
* @return TRUE if the AI should switch, FALSE if not.
*/
BOOL AI_HasPartyMemberWithSuperEffectiveMove(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler, u32 checkEffectiveness, u8 rand)
{
   int i, j;
   u8 aiSlot1, aiSlot2;
   u16 move;
   int moveType;
   u32 effectiveness;
   int start, end;
   struct PartyPokemon *mon;
   int battleType = BattleTypeGet(battleSys);

   if (battleCtx->waza_no_hit[battler] == MOVE_NONE || battleCtx->waza_no_hit_client[battler] == BATTLER_NONE) {
       return FALSE;
   }

   // If the last move that hit us is a status move, do not switch.
   if (battleCtx->moveTbl[battleCtx->waza_no_hit[battler]].power == 0) {
       return FALSE;
   }

   aiSlot1 = battler;
   if ( battleType & (BATTLE_TYPE_MULTI | BATTLE_TYPE_TAG)) {
       aiSlot2 = aiSlot1;
   } else {
       aiSlot2 = BATTLER_ALLY(battler);
   }      

   start = 0;
   end = Battle_GetClientPartySize(battleSys, battler);

   for (i = start; i < end; i++) {
        mon = Battle_GetClientPartyMon(battleSys, battler, i);

        if (GetMonData(mon, MON_DATA_HP, 0) != 0 &&
            GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 0 &&
            GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != 494 
            && i != battleCtx->sel_mons_no[aiSlot1]
            && i != battleCtx->sel_mons_no[aiSlot2]
            && i != battleCtx->aiSwitchedPartySlot[aiSlot1]
            && i != battleCtx->aiSwitchedPartySlot[aiSlot2]) {
           effectiveness = 0;
           moveType = battleCtx->moveTbl[battleCtx->waza_no_hit[battler]].type;



           AITypeCalc(battleCtx, 
            battleCtx->waza_no_hit[battler], 
            moveType, 
            GetMonData(mon, MON_DATA_ABILITY, 0), 
            battleCtx->battlemon[battleCtx->waza_no_hit_client[battler]].ability, 
            BattleItemDataGet(battleCtx,GetMonData(mon, MON_DATA_HELD_ITEM, 0), 1),
            GetMonData(mon, MON_DATA_TYPE_1, 0),
             GetMonData(mon, MON_DATA_TYPE_2, 0), 
             &effectiveness);



           if (effectiveness & checkEffectiveness) {
               for (j = 0; j < CLIENT_MAX; j++) {
                move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL); 
                moveType = battleCtx->moveTbl[move].effect; 

                   if (move) {
                       effectiveness = 0;

                           AITypeCalc(battleCtx, 
                            move, 
                            moveType, 
                            GetMonData(mon, MON_DATA_ABILITY, 0), 
                            battleCtx->battlemon[battleCtx->waza_no_hit_client[battler]].ability, 
                            BattleItemDataGet(battleCtx,GetMonData(mon, MON_DATA_HELD_ITEM, 0), 1),
                            GetMonData(mon, MON_DATA_TYPE_1, 0),
                             GetMonData(mon, MON_DATA_TYPE_2, 0), 
                             &effectiveness);


                       if ((effectiveness & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) && BattleRand(battleSys) % rand == 0) {
                           //battleCtx->aiSwitchedPartySlot[battler] = i;
                           return TRUE;
                       }
                   }
               }
           }
       }
   }

   return FALSE;
}


/**
 * @brief Check if the AI's battler is asleep and has Natural Cure + an eligible switch.
 *
 * @param battleSys
 * @param battleCtx
 * @param battler   The AI's battler.
 * @return TRUE if the AI should switch, FALSE otherwise.
 */
 BOOL AI_IsAsleepWithNaturalCure(struct BattleSystem *battleSys, struct BattleStruct *battleCtx, int battler)
 {
     // Don't switch if we aren't asleep, don't have Natural Cure, or are below 50% HP.
     if ((battleCtx->battlemon[battler].condition & STATUS_SLEEP) == FALSE
         || battleCtx->battlemon[battler].ability != ABILITY_NATURAL_CURE
         || battleCtx->battlemon[battler].hp < (battleCtx->battlemon[battler].maxhp / 2)) {
         return FALSE;
     }
 
     // Check for the move that last hit you; i.e., don't switch on your first turn.
     // Switch 50% of the time, and use post-KO switch logic.
     if (battleCtx->waza_no_hit[battler] == MOVE_NONE && (BattleRand(battleSys) & 1)) {
         battleCtx->aiSwitchedPartySlot[battler] = 6;
         return TRUE;
     }
 
     // If the last move that hit you is a status move, switch 50% of the time, following
     // post-KO switch logic.
     if (battleCtx->moveTbl[battleCtx->waza_no_hit[battler]].power == 0 && (BattleRand(battleSys) & 1)) {
         battleCtx->aiSwitchedPartySlot[battler] = 6;
         return TRUE;
     }
 
     // If we have a party member with an immunity to the last move that also has a super-effective
     // move, switch 50% of the time.
     if (AI_HasPartyMemberWithSuperEffectiveMove(battleSys, battleCtx, battler, MOVE_STATUS_FLAG_NOT_EFFECTIVE, 1)) {
         return TRUE;
     }
 
     // If we have a party member with a resistance to the last move that also has a super-effective
     // move, switch 50% of the time.
     if (AI_HasPartyMemberWithSuperEffectiveMove(battleSys, battleCtx, battler, MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE, 1)) {
         return TRUE;
     }
 
     // Randomly switch 50% of the time, following post-KO switch logic.
     if (BattleRand(battleSys) & 1) {
         battleCtx->aiSwitchedPartySlot[battler] = 6;
         return TRUE;
     }
 
     return FALSE;
 }

 
 
/**
 * @brief Check if the AI's current battler is heavily stat-boosted (that is,
 * if the sum of its total positive stat stage changes is greater than or
 * equal to 4.)
 *
 * @param battleSys
 * @param battleCtx
 * @param battler   The AI's current battler.
 * @return          TRUE if the AI has a high number of positive stat stages;
 *                  FALSE otherwise.
 */
BOOL AI_IsHeavilyStatBoosted(struct BattleSystem *battleSys, struct  BattleStruct *battleCtx, int battler)
{
    int stat;
    u8 numBoosts = 0;

    for (stat = STAT_HP; stat < STAT_MAX; stat++) {
        if (battleCtx->battlemon[battler].states[stat] > 6) {
            numBoosts += battleCtx->battlemon[battler].states[stat] - 6;
        }
    }

    return numBoosts >= 4;
}

int TypeMatchupMultiplier(u8 attackingType, u8 defendingType1, u8 defendingType2)
{
    int i = 0;
    int mul = 40;

    while (TypeEffectivenessTable[i][0] != 0xFF) {
        if (TypeEffectivenessTable[i][0] == attackingType) {
            if (TypeEffectivenessTable[i][1] == defendingType1) {
                mul = mul * TypeEffectivenessTable[i][2] / 10;
            }

            if (TypeEffectivenessTable[i][1] == defendingType2
                && defendingType1 != defendingType2) {
                mul = mul * TypeEffectivenessTable[i][2] / 10;
            }
        }

        i++;
    }

    return mul;
}

int BattleAI_PostKOSwitchIn(struct BattleSystem *battleSys, int battler)
{
    debug_printf("inpostko switchin\n");
    // Must keep C89-style declaration to match
    int i, j;
    u8 defender, defenderType1, defenderType2;
    u8 monType1, monType2;
    u16 monSpecies;
    u16 move;
    int moveType;
    u8 battlersDisregarded;

    u8 picked = 6;
    u8 slot1, slot2;
    u32 moveStatusFlags = 0;
    int partySize;

    BOOL monHasDamagingMove[6] = {0};
    BOOL monIsFaster[6] = {0};
    u32 monMoveDamagesDealt[4] = {0};
    u32 monMoveDamagesReceived[4] = {0};
    u32 minRollMaxDamageDealt[6] = {0};
    u32 minRollMaxDamageReceived[6] = {0};
    u32 monTieIndices[6] = {0};

    u32 monSwapScore[6] = {0};
    BOOL monCanOHKO[6] = {0};
    BOOL monIsOHKOd[6] = {0};
    u32 currentDamage = 0;
    u32 defenderMove = 0;
    u32 highestMonScore = 0;

    struct PartyPokemon *mon;
    struct BattleStruct *battleCtx = battleSys->sp;
    int battleType = BattleTypeGet(battleSys);

    slot1 = battler;
    if (battleType & (BATTLE_TYPE_TAG | BATTLE_TYPE_MULTI)) {
        slot2 = slot1;
    } else {
        slot2 = BATTLER_ALLY(battler);
    }

    defender = BATTLER_OPPONENT(battler); //BattleSystem_RandomOpponent(battleSys, battleCtx, battler); was random opponent in pokeplat
    partySize = Battle_GetClientPartySize(battleSys, battler);
    battlersDisregarded = 0;

    picked = 6;

    // Stage 2: Loop through all the party slots and score them by how much damage would be done
    // by the maximum non-critical roll of each of their moves if it were used by the battler
    // which just fainted. Choose the Pokemon with the highest such score, breaking ties by
    // party-order.


    for (i = 0; i < partySize; i++) {
        mon = Battle_GetClientPartyMon(battleSys, battler, i);
        monSpecies = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0);

        //debug_printf("checking index %d which is species %d\n",i,monSpecies);
        //debug_printf("info for i = %d: %d, %d, %d, %d\n",i,battleCtx->sel_mons_no[slot1],battleCtx->sel_mons_no[slot2], battleCtx->aiSwitchedPartySlot[slot1],battleCtx->aiSwitchedPartySlot[slot2]);
        if (monSpecies != SPECIES_NONE
            && monSpecies != SPECIES_EGG
            && GetMonData(mon, MON_DATA_HP, 0)
            //&& (battlersDisregarded & No2Bit(i)) == FALSE
            && i != battleCtx->sel_mons_no[slot1]
            && i != battleCtx->sel_mons_no[slot2]
            && i != battleCtx->aiSwitchedPartySlot[slot1]
            && i != battleCtx->aiSwitchedPartySlot[slot2]) {
            debug_printf("operating on %d which is species %d\n",i,monSpecies);
            monSwapScore[i] = 10; //initialize the valid swaps to 10, leaving invalid ones at zero so they are never chosen
            for (j = 0; j < CLIENT_MAX; j++) {
                currentDamage = 0;
                
                move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL); 
                moveType = battleCtx->moveTbl[move].effect; 

                //first see whether current mon is faster than defender
                monIsFaster[i] = AI_CalcSpeed(battleSys, battleCtx, defender, battler, 0, 1, mon); //1 if faster, 0 if slower, 2 if tied
                debug_printf("Mon is faster? %d\n",monIsFaster[i]);

                /*if the current move is a damaging move, compute the damage to be potentially dealt to the defender,
                then apply type chart modifiers.*/
                if(battleCtx->moveTbl[move].split != SPLIT_STATUS && battleCtx->moveTbl[move].power){
                    currentDamage = AI_CalcBaseDamage(battleSys, battleCtx, move, battleCtx->side_condition[BATTLER_IS_ENEMY(defender)],
                     battleCtx->field_condition, battleCtx->moveTbl[move].power, battleCtx->moveTbl[move].type, battler, defender, 0, 1, 0, mon);
                     debug_printf("BEFORE TYPE MOD: operating on %d which can deal  %d damage with move slot %d\n",i, currentDamage, j);
                    currentDamage = AI_ServerDoTypeCalcMod(battleSys, battleCtx, move, battleCtx->moveTbl[move].type, battler, defender, currentDamage, &moveStatusFlags, 1, 0, mon) * 85 / 100;
                    debug_printf("AFTER TYPE MOD: operating on %d which can deal  %d damage with move slot %d\n",i, currentDamage, j);

                }
                if(currentDamage > minRollMaxDamageDealt[i]){
                    minRollMaxDamageDealt[i] = currentDamage;
                }
                if(currentDamage){
                    monHasDamagingMove[i] = TRUE;
                    if(currentDamage > battleCtx->battlemon[defender].hp){
                        monCanOHKO[i] = TRUE;
                    }
                }
                debug_printf("operating on %d which can deal  %d damage with move slot %d\n",i, currentDamage, j);
                /*Now compute how much damage the ai would receive 
                (in other words, swap attacker and defender)*/
                defenderMove = battleCtx->battlemon[defender].move[j];
                if(battleCtx->moveTbl[defenderMove].split != SPLIT_STATUS && battleCtx->moveTbl[defenderMove].power){
                    currentDamage = AI_CalcBaseDamage(battleSys, battleCtx, defenderMove, battleCtx->side_condition[BATTLER_IS_ENEMY(battler)],
                     battleCtx->field_condition, battleCtx->moveTbl[defenderMove].power, battleCtx->moveTbl[defenderMove].type, defender, battler, 0, 0, 1, mon);
                     currentDamage = AI_ServerDoTypeCalcMod(battleSys, battleCtx, defenderMove, battleCtx->moveTbl[defenderMove].type, defender, battler, currentDamage, &moveStatusFlags, 0, 1, mon) * 85 / 100;
                }
                if(currentDamage > minRollMaxDamageReceived[i]){
                    minRollMaxDamageReceived[i] = currentDamage;
                }
                if(currentDamage){
                    if(currentDamage > GetMonData(mon, MON_DATA_HP, 0)){
                        monIsOHKOd[i] = TRUE;
                    }
                }
                debug_printf("operating on %d which can receive  %d damage with move slot %d\n",i, currentDamage, j);
            }
        } 
    }

    /*Now compute the score for each Pokemon in the party*/
    for (i = 0; i < partySize; i++){
        if(!(monSwapScore[i])){
            continue;
        }
        if(monHasDamagingMove[i]){
            if(monIsFaster[i]){
                if(monCanOHKO[i]){
                    monSwapScore[i] += 5;
                }
                else{
                    if(minRollMaxDamageDealt[i] * 100 / battleCtx->battlemon[defender].hp > minRollMaxDamageReceived[i] * 100 / GetMonData(mon, MON_DATA_HP, 0)){
                        monSwapScore[i] += 3;
                    }
                    else{
                        monSwapScore[i] += 1;
                    }
                }
            }
            else{
                if(monIsOHKOd[i]){
                    monSwapScore[i] -= 1;
                }
                else{
                    if(monCanOHKO[i]){
                        monSwapScore[i] += 4;
                    }
                    else{
                        if(minRollMaxDamageDealt[i] * 100 / battleCtx->battlemon[defender].hp > minRollMaxDamageReceived[i] * 100 / GetMonData(mon, MON_DATA_HP, 0)){
                            monSwapScore[i] += 2;
                        }
                        else{
                            monSwapScore[i] += 0;
                        }
                    }
                }
            }
        }
        else{
            if(GetMonData(Battle_GetClientPartyMon(battleSys, battler, i),MON_DATA_SPECIES,0) == SPECIES_DITTO){
                monSwapScore[i] += 2;
            }
            else{
                if((GetMonData(Battle_GetClientPartyMon(battleSys, battler, i),MON_DATA_SPECIES,0) == SPECIES_WOBBUFFET ||
                    GetMonData(Battle_GetClientPartyMon(battleSys, battler, i),MON_DATA_SPECIES,0) == SPECIES_WYNAUT) &&
                    !(monIsOHKOd[i])){
                    monSwapScore[i] += 2;
                }
                else{
                    monSwapScore[i] += 0;
                }
            }
        }
        if(monSwapScore[i] > highestMonScore){
            highestMonScore = monSwapScore[i];
        }
    }

    /*Now that all the scores have been computed, select the highest one (and if tie, select randomly)*/
    int j_tie_index = 0;
    int num_mon_score_ties = 0;

    for (int mon_no = 0; mon_no < partySize; mon_no++){   
        debug_printf("The swap index %d has score %d\n",mon_no,monSwapScore[mon_no]);       //check for ties
        if(monSwapScore[mon_no] == highestMonScore){
            num_mon_score_ties++;
            monTieIndices[j_tie_index] = mon_no;
            j_tie_index++;
        }
    }
    picked = monTieIndices[BattleRand(battleSys) % num_mon_score_ties];
    debug_printf("Picking index number %d\n\n",picked);
    return picked;
}


const u8 DecreaseSpeedHoldEffects[] =
{
    HOLD_EFFECT_EVS_UP_SPEED_DOWN,
    HOLD_EFFECT_SPEED_DOWN_GROUNDED,
    HOLD_EFFECT_LVLUP_HP_EV_UP,
    HOLD_EFFECT_LVLUP_ATK_EV_UP,
    HOLD_EFFECT_LVLUP_DEF_EV_UP,
    HOLD_EFFECT_LVLUP_SPEED_EV_UP,
    HOLD_EFFECT_LVLUP_SPATK_EV_UP,
    HOLD_EFFECT_LVLUP_SPDEF_EV_UP,
};

// return 0 if client1 moves first, 1 if client2 moves first, 2 if random roll between the two.
u8 AI_CalcSpeed(void *bw, struct BattleStruct *sp, int client1, int client2, int flag, int client2IsPP, struct PartyPokemon *pp)
{
    u8 ret = 0;
    u32 speed1, speed2;
    //u16 move1 = 0, move2 = 0;
    u8 hold_effect1;
    //u8 hold_atk1;
    u8 hold_effect2;
    //u8 hold_atk2;
    s8 priority1 = 0;
    s8 priority2 = 0;
    u8 quick_claw1 = 0;
    u8 quick_claw2 = 0;
    if(!client2IsPP){ 
        priority1 = sp->clientPriority[client1];
        priority2 = sp->clientPriority[client2];
        quick_claw1 = sp->battlemon[client1].moveeffect.quickClawFlag || sp->battlemon[client1].moveeffect.custapBerryFlag;
        quick_claw2 = sp->battlemon[client2].moveeffect.quickClawFlag || sp->battlemon[client2].moveeffect.custapBerryFlag;
    }
    //We do not care about quick claw or priority for post-ko switch ins here, those are handled separately
    
    
    u8 move_last1 = 0, move_last2 = 0;
    //int command1;
    //int command2;
    //int move_pos1;
    //int move_pos2;
    int ability1;
    int ability2;
    int stat_stage_spd1;
    int stat_stage_spd2;
    u32 i;

    // if one mon is fainted and the other isn't, then the alive one obviously goes first
    if(!client2IsPP){
        if ((sp->battlemon[client1].hp == 0) && (sp->battlemon[client2].hp))
        {
            return 1;
        }
        if ((sp->battlemon[client1].hp) && (sp->battlemon[client2].hp == 0))
        {
            return 0;
        }

        // Potential After You or Quash present
        if (sp->oneTurnFlag[client1].force_execution_order_flag != sp->oneTurnFlag[client2].force_execution_order_flag) {
            switch (sp->oneTurnFlag[client1].force_execution_order_flag) {
                case EXECUTION_ORDER_AFTER_YOU:
                    return 0;
                    break;
                case EXECUTION_ORDER_QUASH:
                    return 1;
                    break;
                default:
                    break;
            }
            switch (sp->oneTurnFlag[client2].force_execution_order_flag) {
                case EXECUTION_ORDER_AFTER_YOU:
                    return 1;
                    break;
                case EXECUTION_ORDER_QUASH:
                    return 0;
                    break;
                default:
                    break;
            }
        }
    }

    ability1 = GetBattlerAbility(sp, client1);
    hold_effect1 = HeldItemHoldEffectGet(sp, client1);
    stat_stage_spd1 = sp->battlemon[client1].states[STAT_SPEED];

    if(!client2IsPP){
        ability2 = GetBattlerAbility(sp, client2);
        hold_effect2 = HeldItemHoldEffectGet(sp, client2);
        stat_stage_spd2 = sp->battlemon[client2].states[STAT_SPEED];
    }
    else{
        ability2 = GetMonData(pp, MON_DATA_ABILITY, 0);
        hold_effect2 = BattleItemDataGet(sp, GetMonData(pp, MON_DATA_HELD_ITEM, 0), 1);
        stat_stage_spd2 = 6; //stage 0
    }

    speed1 = sp->battlemon[client1].speed * StatBoostModifiers[stat_stage_spd1][0] / StatBoostModifiers[stat_stage_spd1][1];
    if(client2IsPP){
        speed2 = GetMonData(pp, MON_DATA_SPEED, 0) * StatBoostModifiers[stat_stage_spd2][0] / StatBoostModifiers[stat_stage_spd2][1];
    }
    else{
        speed2 = sp->battlemon[client2].speed * StatBoostModifiers[stat_stage_spd2][0] / StatBoostModifiers[stat_stage_spd2][1];
    }
    

    if ((CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE)==0)
     && (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)==0))
    {
        if (((ability1 == ABILITY_SWIFT_SWIM) && (sp->field_condition & WEATHER_RAIN_ANY))
         || ((ability1 == ABILITY_CHLOROPHYLL) && (sp->field_condition & WEATHER_SUNNY_ANY))
         || ((ability1 == ABILITY_SAND_RUSH) && (sp->field_condition & WEATHER_SANDSTORM_ANY))
         || ((ability1 == ABILITY_SLUSH_RUSH) && (sp->field_condition & (WEATHER_HAIL_ANY | WEATHER_SNOW_ANY))))
        {
            speed1 *= 2;
        }
        if (((ability2 == ABILITY_SWIFT_SWIM) && (sp->field_condition & WEATHER_RAIN_ANY))
         || ((ability2 == ABILITY_CHLOROPHYLL) && (sp->field_condition & WEATHER_SUNNY_ANY))
         || ((ability2 == ABILITY_SAND_RUSH) && (sp->field_condition & WEATHER_SANDSTORM_ANY))
         || ((ability2 == ABILITY_SLUSH_RUSH) && (sp->field_condition & (WEATHER_HAIL_ANY | WEATHER_SNOW_ANY))))
        {
            speed2 *= 2;
        }
    }

    for (i = 0; i < NELEMS(DecreaseSpeedHoldEffects); i++)
    {
        if (BattleItemDataGet(sp, sp->battlemon[client1].item, 1) == DecreaseSpeedHoldEffects[i]) {
            if (!(GetBattlerAbility(sp, client1) == ABILITY_KLUTZ && DecreaseSpeedHoldEffects[i] == HOLD_EFFECT_SPEED_DOWN_GROUNDED)) {
            speed1 /= 2;
            break;
            }
        }
    }

    if ((ability1 == ABILITY_SURGE_SURFER) && (sp->terrainOverlay.type == ELECTRIC_TERRAIN && sp->terrainOverlay.numberOfTurnsLeft > 0))
    {
        speed1 *= 2;
    }

    if ((ability2 == ABILITY_SURGE_SURFER) && (sp->terrainOverlay.type == ELECTRIC_TERRAIN && sp->terrainOverlay.numberOfTurnsLeft > 0))
    {
        speed2 *= 2;
    }

    if (hold_effect1 == HOLD_EFFECT_CHOICE_SPEED)
    {
        speed1 = speed1 * 15 / 10;
    }

    if ((hold_effect1 == HOLD_EFFECT_DITTO_SPEED_UP) && (sp->battlemon[client1].species == SPECIES_DITTO))
    {
        speed1 *= 2;
    }

    if ((ability1 == ABILITY_QUICK_FEET) && (sp->battlemon[client1].condition & STATUS_ANY_PERSISTENT))
    {
        speed1 = speed1 * 15 / 10;
    }
    else
    {
        if (sp->battlemon[client1].condition & STATUS_PARALYSIS)
        {
            speed1 /= 2; // gen 7 on only halves speed for paralysis
        }
    }

    if ((ability1 == ABILITY_SLOW_START)
     && ((sp->total_turn - sp->battlemon[client1].moveeffect.slowStartTurns) < 5))
    {
        speed1 /= 2;
    }

    if ((ability1 == ABILITY_UNBURDEN)
     && (sp->battlemon[client1].moveeffect.knockOffFlag)
     && (sp->battlemon[client1].item == 0))
    {
        speed1 *= 2;
    }

    if (sp->tailwindCount[IsClientEnemy(bw, client1)]) // new tailwind handling
    {
        speed1 *= 2;
    }

    if (hold_effect1 == HOLD_EFFECT_PRIORITY_DOWN)
    {
        move_last1 = 1;
    }

    //now do the same for client2, which could be a PartyPokemon (for AI switch-in calcs)
    if(!client2IsPP){
        for (i = 0; i < NELEMS(DecreaseSpeedHoldEffects); i++)
        {
            if (BattleItemDataGet(sp, sp->battlemon[client2].item, 1) == DecreaseSpeedHoldEffects[i]) {
                if (!(GetBattlerAbility(sp, client2) == ABILITY_KLUTZ && DecreaseSpeedHoldEffects[i] == HOLD_EFFECT_SPEED_DOWN_GROUNDED)) {
                    speed2 /= 2;
                break;
                }
            }
        }
    
        if (hold_effect2 == HOLD_EFFECT_CHOICE_SPEED)
        {
            speed2 = speed2 * 15 / 10;
        }
    
        if ((hold_effect2 == HOLD_EFFECT_DITTO_SPEED_UP) && (sp->battlemon[client2].species == SPECIES_DITTO))
        {
            speed2 *= 2;
        }
    
        if ((ability2 == ABILITY_QUICK_FEET) && (sp->battlemon[client2].condition & STATUS_ANY_PERSISTENT))
        {
            speed2 = speed2 * 15 / 10;
        }
        else
        {
            if (sp->battlemon[client2].condition & STATUS_PARALYSIS)
            {
                speed2 /= 2; // gen 7 on only halves speed for paralysis
            }
        }
    
        if ((ability2 == ABILITY_SLOW_START)
         && ((sp->total_turn - sp->battlemon[client2].moveeffect.slowStartTurns) < 5))
        {
            speed2 /= 2;
        }
    
        if ((ability2 == ABILITY_UNBURDEN)
         && (sp->battlemon[client2].moveeffect.knockOffFlag)
         && (sp->battlemon[client2].item == 0))
        {
            speed2 *= 2;
        }
    
        if (sp->tailwindCount[IsClientEnemy(bw, client2)]) // new tailwind handling
        {
            speed2 *= 2;
        }
    
        if (hold_effect2 == HOLD_EFFECT_PRIORITY_DOWN)
        {
            move_last2 = 1;
        }    
    }
    else{ //if client2 is a PartyPokemon, access data structures differently
        for (i = 0; i < NELEMS(DecreaseSpeedHoldEffects); i++)
        {
            if (hold_effect2 == DecreaseSpeedHoldEffects[i]) {
                if (!(ability2 == ABILITY_KLUTZ && DecreaseSpeedHoldEffects[i] == HOLD_EFFECT_SPEED_DOWN_GROUNDED)) {
                    speed2 /= 2;
                break;
                }
            }
        }
    
        if (hold_effect2 == HOLD_EFFECT_CHOICE_SPEED)
        {
            speed2 = speed2 * 15 / 10;
        }
    
        if ((hold_effect2 == HOLD_EFFECT_DITTO_SPEED_UP) && (GetMonData(pp, MON_DATA_SPECIES, 0) == SPECIES_DITTO))
        {
            speed2 *= 2;
        }
    
        if ((ability2 == ABILITY_QUICK_FEET) && (GetMonData(pp, MON_DATA_STATUS, 0) & STATUS_ANY_PERSISTENT))
        {
            speed2 = speed2 * 15 / 10;
        }
        else
        {
            if (GetMonData(pp, MON_DATA_STATUS, 0) & STATUS_PARALYSIS)
            {
                speed2 /= 2; // gen 7 on only halves speed for paralysis
            }
        }
    
        if (ability2 == ABILITY_SLOW_START) //mon in the party will always have full slow start turns remaining
        {
            speed2 /= 2;
        }
    
        if (sp->tailwindCount[IsClientEnemy(bw, client2)]) // new tailwind handling
        {
            speed2 *= 2;
        }
    
        if (hold_effect2 == HOLD_EFFECT_PRIORITY_DOWN)
        {
            move_last2 = 1;
        }    
    }
    
    sp->effectiveSpeed[client1]=speed1;
    if(!client2IsPP){
        sp->effectiveSpeed[client2]=speed2;
    }
    

    if (sp->field_condition & FIELD_STATUS_TRICK_ROOM) {
        speed1 = (10000 - speed1) % 8192;
        speed2 = (10000 - speed2) % 8192;
    }

    if (flag & CALCSPEED_FLAG_NO_PRIORITY)
    {
        priority1 = 0;
        priority2 = 0;
    }

    if (priority1 == priority2)
    {
        if ((quick_claw1) && (quick_claw2)) // both mons quick claws activates/items that put them first
        {
            if (speed1 < speed2)
            {
                ret = 1; // client 2 goes
            }
            else if ((speed1 == speed2) && (BattleRand(bw) & 1))
            {
                ret = 2; // random roll
            }
        }
        else if ((quick_claw1 == 0) && (quick_claw2)) // client2 quick claw activate
        {
            ret = 1;
        }
        else if ((quick_claw1) && (quick_claw2 == 0)) // client1 quick claw activate
        {
            ret = 0;
        }
        else if ((move_last1) && (move_last2)) // both clients have lagging tail
        {
            if (speed1 > speed2) // if client1 is faster with lagging tail, it moves last
            {
                ret = 1; // client 2 moves first
            }
            else if ((speed1 == speed2) && (BattleRand(bw) & 1)) // random roll
            {
                ret = 2;
            }
        }
        else if ((move_last1) && (move_last2 == 0)) // client1 has lagging tail
        {
            ret = 1;
        }
        else if ((move_last1==0) && (move_last2)) // client2 has lagging tail
        {
            ret = 0;
        }
        else if ((ability1 == ABILITY_STALL) && (ability2 == ABILITY_STALL))
        {
            if (speed1 > speed2)
            {
                ret = 1;
            }
            else if ((speed1 == speed2) && (BattleRand(bw) & 1))
            {
                ret = 2;
            }
        }
        else if ((ability1 == ABILITY_STALL) && (ability2 != ABILITY_STALL))
        {
            ret = 1;
        }
        else if ((ability1 != ABILITY_STALL) && (ability2 == ABILITY_STALL))
        {
            ret = 0;
        }
        else
        {
            if (speed1 < speed2)
            {
                ret = 1;
            }
            if ((speed1 == speed2) && (BattleRand(bw) & 1))
            {
                ret = 2;
            }
        }
    }
    else if (priority1 < priority2)
    {
        ret = 1;
    }

    return ret;
}


/**
 *  @brief set move status effects for super effective and calculate modified damage
 *
 *  @param bw battle work structure
 *  @param sp global battle structure
 *  @param move_no move index
 *  @param move_type move type
 *  @param attack_client attacker
 *  @param defence_client defender
 *  @param damage current damage
 *  @param flag move status flags to mess around with
 *  @return modified damage
 */
 int AI_ServerDoTypeCalcMod(void *bw UNUSED, struct BattleStruct *sp, int move_no, int move_type, int attack_client, int defence_client, int damage, u32 *flag, BOOL usePPForAttacker, BOOL usePPForDefender, struct PartyPokemon *pp)
 {
     int i;
     int modifier;
     u32 base_power;
     u8  eqp_a;
     u8  eqp_d UNUSED;
     u8  atk_a;
     u8  atk_d UNUSED; // not currently used but will be

     u8 attacker_type_1;
    u8 attacker_type_2;
    u8 defender_type_1;
    u8 defender_type_2;
 
     modifier = 1;

     if (move_no == MOVE_STRUGGLE)
         return damage;
    if(usePPForAttacker){
        eqp_a = BattleItemDataGet(sp, GetMonData(pp, MON_DATA_HELD_ITEM, 0), 1);  
        atk_a = BattleItemDataGet(sp, GetMonData(pp, MON_DATA_HELD_ITEM, 0), 2);   
    }
    else{
        eqp_a = HeldItemHoldEffectGet(sp, attack_client);
        atk_a = HeldItemAtkGet(sp, attack_client, ATK_CHECK_NORMAL);
        eqp_d = HeldItemHoldEffectGet(sp, defence_client);
        atk_d = HeldItemAtkGet(sp, defence_client, ATK_CHECK_NORMAL);
    }

    if(usePPForAttacker){
        GetAdjustedMoveTypeBasics(sp, move_no, GetMonData(pp, MON_DATA_ABILITY, 0), 0);
    }
    else{
        move_type = GetAdjustedMoveType(sp, attack_client, move_no);
    }
 
     // new normalize checks
     base_power = sp->moveTbl[move_no].power;
 
     if(usePPForAttacker){
        attacker_type_1 = GetMonData(pp, MON_DATA_TYPE_1, 0);
        attacker_type_2 = GetMonData(pp, MON_DATA_TYPE_2, 0);
        defender_type_1 = BattlePokemonParamGet(sp, defence_client, BATTLE_MON_DATA_TYPE1, NULL);
        defender_type_2 = BattlePokemonParamGet(sp, defence_client, BATTLE_MON_DATA_TYPE2, NULL); 
     }
     else if(usePPForDefender){
        attacker_type_1 = BattlePokemonParamGet(sp, attack_client, BATTLE_MON_DATA_TYPE1, NULL);
        attacker_type_2 = BattlePokemonParamGet(sp, attack_client, BATTLE_MON_DATA_TYPE2, NULL);
        defender_type_1 = GetMonData(pp, MON_DATA_TYPE_1, 0);
        defender_type_2 = GetMonData(pp, MON_DATA_TYPE_2, 0);
     }
     else{
        attacker_type_1 = BattlePokemonParamGet(sp, attack_client, BATTLE_MON_DATA_TYPE1, NULL);
        attacker_type_2 = BattlePokemonParamGet(sp, attack_client, BATTLE_MON_DATA_TYPE2, NULL);
        defender_type_1 = BattlePokemonParamGet(sp, defence_client, BATTLE_MON_DATA_TYPE1, NULL);
        defender_type_2 = BattlePokemonParamGet(sp, defence_client, BATTLE_MON_DATA_TYPE2, NULL);   
     }
     
     if (((sp->server_status_flag & SERVER_STATUS_FLAG_TYPE_FLAT) == 0) && ((attacker_type_1 == move_type) || (attacker_type_2 == move_type)))
     {
        if(usePPForAttacker){
            if(GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_ADAPTABILITY){
                damage *= 2;
            }
            else{
                damage = damage * 15 / 10;
            }
        }
        else{
            if (GetBattlerAbility(sp,attack_client) == ABILITY_ADAPTABILITY)
            {
                damage *= 2;
            }
            else
            {
                damage = damage * 15 / 10;
            }
        }

     }
 
     {
         i = 0;
         while (TypeEffectivenessTable[i][0] != TYPE_ENDTABLE)
         {
             if (TypeEffectivenessTable[i][0] == TYPE_FORESIGHT) // handle foresight
             {
                if(usePPForAttacker){
                    if ((GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_SCRAPPY) || (GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_MINDS_EYE))
                    {
                        break;
                    }
                    else
                    {
                        i++;
                        continue;
                    }
                }
                else{
                    if ((sp->battlemon[defence_client].condition2 & STATUS2_FORESIGHT) || (GetBattlerAbility(sp, attack_client) == ABILITY_SCRAPPY) || (GetBattlerAbility(sp, attack_client) == ABILITY_MINDS_EYE))
                    {
                        break;
                    }
                    else
                    {
                        i++;
                        continue;
                    }
                }

             }
             if (TypeEffectivenessTable[i][0] == move_type)
             {
                 if (TypeEffectivenessTable[i][1] == defender_type_1)
                 {
                     if (ShouldUseNormalTypeEffCalc(sp, attack_client, defence_client, i) == TRUE
                     && !(!CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE)
                         && !CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)
                         && sp->field_condition & WEATHER_STRONG_WINDS
                         && (TypeEffectivenessTable[i][2] == 20)
                         && defender_type_1 == TYPE_FLYING))
                     {
                         damage = TypeCheckCalc(sp, attack_client, TypeEffectivenessTable[i][2], damage, base_power, flag);
                         if (TypeEffectivenessTable[i][2] == 20) // seems to be useless, modifier isn't used elsewhere
                         {
                             modifier *= 2;
                         }
                     }
                 }
                 if ((TypeEffectivenessTable[i][1] == defender_type_2) && (defender_type_1 != defender_type_2))
                 {
                     if (ShouldUseNormalTypeEffCalc(sp, attack_client, defence_client, i) == TRUE
                     && !(!CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE)
                         && !CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)
                         && sp->field_condition & WEATHER_STRONG_WINDS
                         && (TypeEffectivenessTable[i][2] == 20)
                         && defender_type_2 == TYPE_FLYING))
                     {
                         damage = TypeCheckCalc(sp, attack_client, TypeEffectivenessTable[i][2], damage, base_power, flag);
                         if (TypeEffectivenessTable[i][2] == 20) // seems to be useless, modifier isn't used elsewhere
                         {
                             modifier *= 2;
                         }
                     }
                 }
             }
             i++;
         }
     }
 
     if(usePPForAttacker){
        if ((GetMonData(pp, MON_DATA_ABILITY, 0) != ABILITY_MOLD_BREAKER && sp->battlemon[defence_client].ability == ABILITY_WONDER_GUARD)
        && (((flag[0] & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) == 0) || ((flag[0] & (MOVE_STATUS_FLAG_SUPER_EFFECTIVE | MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE)) == (MOVE_STATUS_FLAG_SUPER_EFFECTIVE | MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE)))
        && (base_power))
        {
            damage = 0;
        }
        else
        {

            if ((flag[0] & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) && (base_power))
            {
                if ((GetMonData(pp, MON_DATA_ABILITY, 0) != ABILITY_MOLD_BREAKER && sp->battlemon[defence_client].ability == ABILITY_FILTER) || (GetMonData(pp, MON_DATA_ABILITY, 0) != ABILITY_MOLD_BREAKER && sp->battlemon[defence_client].ability == ABILITY_SOLID_ROCK))
                {
                    damage = BattleDamageDivide(damage * 3, 4);
                }
                if (GetBattlerAbility(sp, defence_client) == ABILITY_PRISM_ARMOR)
                {
                    damage = BattleDamageDivide(damage * 3, 4);
                }
                if (GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_NEUROFORCE)
                {
                    damage = BattleDamageDivide(damage * 5, 4);
                }
                if (eqp_a == HOLD_EFFECT_POWER_UP_SE)
                {
                    damage = damage * (100 + atk_a) / 100;
                }
            }
            if ((flag[0] & MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE) && (base_power))
            {
                if (GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_TINTED_LENS)
                {
                    damage *= 2;
                }
            }
        }
     }

     else if(usePPForDefender){
        if ((sp->battlemon[attack_client].ability != ABILITY_MOLD_BREAKER && GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_WONDER_GUARD)
        && (ShouldDelayTurnEffectivenessChecking(sp, move_no)) // check supereffectiveness later, 2-turn move
        && (((flag[0] & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) == 0) || ((flag[0] & (MOVE_STATUS_FLAG_SUPER_EFFECTIVE | MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE)) == (MOVE_STATUS_FLAG_SUPER_EFFECTIVE | MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE)))
        && (base_power))
       {
            damage = 0;
       }
       else
       {
           if (((sp->server_status_flag & SERVER_STATUS_FLAG_TYPE_FLAT) == 0)
            && ((sp->server_status_flag & SERVER_STATUS_FLAG_TYPE_NONE) == 0))
           {
               if ((flag[0] & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) && (base_power))
               {
                   if ((GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_FILTER && sp->battlemon[attack_client].ability != ABILITY_MOLD_BREAKER) || (GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_FILTER && sp->battlemon[attack_client].ability != ABILITY_MOLD_BREAKER))
                   {
                       damage = BattleDamageDivide(damage * 3, 4);
                   }
                   if (GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_PRISM_ARMOR)
                   {
                       damage = BattleDamageDivide(damage * 3, 4);
                   }
                   if (GetBattlerAbility(sp, attack_client) == ABILITY_NEUROFORCE)
                   {
                       damage = BattleDamageDivide(damage * 5, 4);
                   }
                   if (eqp_a == HOLD_EFFECT_POWER_UP_SE)
                   {
                       damage = damage * (100 + atk_a) / 100;
                   }
               }
               if ((flag[0] & MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE) && (base_power))
               {
                   if (GetBattlerAbility(sp, attack_client) == ABILITY_TINTED_LENS)
                   {
                       damage *= 2;
                   }
               }
           }
           else
           {
               flag[0] &= ~(MOVE_STATUS_FLAG_SUPER_EFFECTIVE);
               flag[0] &= ~(MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE);
           }
       }
     }
     else{
        if ((MoldBreakerAbilityCheck(sp, attack_client, defence_client, ABILITY_WONDER_GUARD) == TRUE)
        && (ShouldDelayTurnEffectivenessChecking(sp, move_no)) // check supereffectiveness later, 2-turn move
        && (((flag[0] & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) == 0) || ((flag[0] & (MOVE_STATUS_FLAG_SUPER_EFFECTIVE | MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE)) == (MOVE_STATUS_FLAG_SUPER_EFFECTIVE | MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE)))
        && (base_power))
       {
           flag[0] |= MOVE_STATUS_FLAG_MISS_WONDER_GUARD;
           sp->oneTurnFlag[attack_client].parental_bond_flag = 0;
           sp->oneTurnFlag[attack_client].parental_bond_is_active = FALSE;
       }
       else
       {
           if (((sp->server_status_flag & SERVER_STATUS_FLAG_TYPE_FLAT) == 0)
            && ((sp->server_status_flag & SERVER_STATUS_FLAG_TYPE_NONE) == 0))
           {
               if ((flag[0] & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) && (base_power))
               {
                   if ((MoldBreakerAbilityCheck(sp, attack_client, defence_client, ABILITY_FILTER) == TRUE) || (MoldBreakerAbilityCheck(sp, attack_client, defence_client, ABILITY_SOLID_ROCK) == TRUE))
                   {
                       damage = BattleDamageDivide(damage * 3, 4);
                   }
                   if (GetBattlerAbility(sp, defence_client) == ABILITY_PRISM_ARMOR)
                   {
                       damage = BattleDamageDivide(damage * 3, 4);
                   }
                   if (GetBattlerAbility(sp, attack_client) == ABILITY_NEUROFORCE)
                   {
                       damage = BattleDamageDivide(damage * 5, 4);
                   }
                   if (eqp_a == HOLD_EFFECT_POWER_UP_SE)
                   {
                       damage = damage * (100 + atk_a) / 100;
                   }
               }
               if ((flag[0] & MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE) && (base_power))
               {
                   if (GetBattlerAbility(sp, attack_client) == ABILITY_TINTED_LENS)
                   {
                       damage *= 2;
                   }
               }
           }
           else
           {
               flag[0] &= ~(MOVE_STATUS_FLAG_SUPER_EFFECTIVE);
               flag[0] &= ~(MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE);
           }
       }
   
     }
     
     return damage;
 }

 struct PACKED sDamageCalc
 {
     u16 species;
     s16 hp;
     u16 maxhp;
     u16 dummy;
     int item_held_effect;
     int item_power;
 
     u32 condition;
 
     u16 ability;
     u8 sex;
     u8 type1;
     u8 type2;
 };

 

static const u8 HeldItemPowerUpTable[][2]={
    {HOLD_EFFECT_STRENGTHEN_BUG, TYPE_BUG},
    {HOLD_EFFECT_STRENGTHEN_STEEL, TYPE_STEEL},
    {HOLD_EFFECT_STRENGTHEN_GROUND, TYPE_GROUND},
    {HOLD_EFFECT_STRENGTHEN_ROCK, TYPE_ROCK},
    {HOLD_EFFECT_STRENGTHEN_GRASS, TYPE_GRASS},
    {HOLD_EFFECT_STRENGTHEN_DARK, TYPE_DARK},
    {HOLD_EFFECT_STRENGTHEN_FIGHT, TYPE_FIGHTING},
    {HOLD_EFFECT_STRENGTHEN_ELECTRIC, TYPE_ELECTRIC},
    {HOLD_EFFECT_STRENGTHEN_WATER, TYPE_WATER},
    {HOLD_EFFECT_STRENGTHEN_FLYING, TYPE_FLYING},
    {HOLD_EFFECT_STRENGTHEN_POISON, TYPE_POISON},
    {HOLD_EFFECT_STRENGTHEN_ICE, TYPE_ICE},
    {HOLD_EFFECT_STRENGTHEN_GHOST, TYPE_GHOST},
    {HOLD_EFFECT_STRENGTHEN_PSYCHIC, TYPE_PSYCHIC},
    {HOLD_EFFECT_STRENGTHEN_FIRE, TYPE_FIRE},
    {HOLD_EFFECT_STRENGTHEN_DRAGON, TYPE_DRAGON},
    {HOLD_EFFECT_STRENGTHEN_NORMAL, TYPE_NORMAL},
    {HOLD_EFFECT_ARCEUS_FIRE, TYPE_FIRE},
    {HOLD_EFFECT_ARCEUS_WATER, TYPE_WATER},
    {HOLD_EFFECT_ARCEUS_ELECTRIC, TYPE_ELECTRIC},
    {HOLD_EFFECT_ARCEUS_GRASS, TYPE_GRASS},
    {HOLD_EFFECT_ARCEUS_ICE, TYPE_ICE},
    {HOLD_EFFECT_ARCEUS_FIGHTING, TYPE_FIGHTING},
    {HOLD_EFFECT_ARCEUS_POISON, TYPE_POISON},
    {HOLD_EFFECT_ARCEUS_GROUND, TYPE_GROUND},
    {HOLD_EFFECT_ARCEUS_FLYING, TYPE_FLYING},
    {HOLD_EFFECT_ARCEUS_PSYCHIC, TYPE_PSYCHIC},
    {HOLD_EFFECT_ARCEUS_BUG, TYPE_BUG},
    {HOLD_EFFECT_ARCEUS_ROCK, TYPE_ROCK},
    {HOLD_EFFECT_ARCEUS_GHOST, TYPE_GHOST},
    {HOLD_EFFECT_ARCEUS_DRAGON, TYPE_DRAGON},
    {HOLD_EFFECT_ARCEUS_DARK, TYPE_DARK},
    {HOLD_EFFECT_ARCEUS_STEEL, TYPE_STEEL},
    {HOLD_EFFECT_ARCEUS_NORMAL, TYPE_NORMAL},
#if FAIRY_TYPE_IMPLEMENTED == 1
    {HOLD_EFFECT_STRENGTHEN_FAIRY, TYPE_FAIRY},
    {HOLD_EFFECT_ARCEUS_FAIRY, TYPE_FAIRY},
#endif
};

// this has been moved to src/battle/other_battle_calculators.c so it can be used in
extern const u16 PunchingMovesTable[24];

static const u16 StrongJawMovesTable[] = {
    MOVE_BITE,
    MOVE_CRUNCH,
    MOVE_FIRE_FANG,
    MOVE_FISHIOUS_REND,
    MOVE_HYPER_FANG,
    MOVE_ICE_FANG,
    MOVE_JAW_LOCK,
    MOVE_POISON_FANG,
    MOVE_PSYCHIC_FANGS,
    MOVE_THUNDER_FANG,
};

static const u16 MegaLauncherMovesTable[] = {
    MOVE_AURA_SPHERE,
    MOVE_DARK_PULSE,
    MOVE_DRAGON_PULSE,
    MOVE_HEAL_PULSE,
    MOVE_ORIGIN_PULSE,
    MOVE_TERRAIN_PULSE,
    MOVE_WATER_PULSE,
};

static const u16 SharpnessMovesTable[] = {
    MOVE_AERIAL_ACE,
    MOVE_AIR_CUTTER,
    MOVE_AIR_SLASH,
    MOVE_AQUA_CUTTER,
    MOVE_BEHEMOTH_BLADE,
    MOVE_BITTER_BLADE,
    MOVE_CEASELESS_EDGE,
    MOVE_CROSS_POISON,
    MOVE_CUT,
    MOVE_FURY_CUTTER,
    MOVE_KOWTOW_CLEAVE,
    MOVE_LEAF_BLADE,
    MOVE_NIGHT_SLASH,
    MOVE_POPULATION_BOMB,
    MOVE_PSYBLADE,
    MOVE_PSYCHO_CUT,
    MOVE_RAZOR_SHELL,
    MOVE_RAZOR_LEAF,
    MOVE_SACRED_SWORD,
    MOVE_SECRET_SWORD,
    MOVE_SLASH,
    MOVE_SOLAR_BLADE,
    MOVE_STONE_AXE,
    MOVE_X_SCISSOR,
};


 
 
int AI_CalcBaseDamage(void *bw, struct BattleStruct *sp, int moveno, u32 side_cond,
                   u32 field_cond, u16 pow, u8 type UNUSED, u8 attacker, u8 defender, u8 critical, BOOL usePPForAttacker, BOOL usePPForDefender,struct PartyPokemon *pp)
{

    u32 i;
    s32 damage = 0;
    u8 movetype;
    u8 movesplit;
    u16 attack;
    u16 defense;
    u16 sp_attack;
    u16 sp_defense;
    s8 atkstate;
    s8 defstate;
    s8 spatkstate;
    s8 spdefstate;
    u8 level;
    u16 movepower;
    u16 item;
    u32 battle_type;


    struct sDamageCalc AttackingMon;
    struct sDamageCalc DefendingMon;
    debug_printf("in AI calc damage using usePPForAttacker  = %d, and usePPForDefender = %d\n", usePPForAttacker, usePPForDefender);
    /*Populate the sDamageCalc structs from PartyPokemon 
    attacker instead of the battlemon.
    This is SPECIFICALLY for post-ko switch in logic*/
    if(usePPForAttacker){
        switch (moveno) {
            // handle body press - attack is derived from defense
            case MOVE_BODY_PRESS:
                attack = GetMonData(pp, MON_DATA_DEFENSE, 0);
                atkstate = 0; //Pokemon in the party have no stat changes
                break;
                
    
            default:
                attack = GetMonData(pp, MON_DATA_ATTACK, 0);
                atkstate = 0; //stage 0
                //atkstate = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATE_DEF, NULL) - 6;
                break;
        }
        sp_attack = GetMonData(pp, MON_DATA_SPECIAL_ATTACK, 0);
        spatkstate = 0; //stage 0
        level = GetMonData(pp, MON_DATA_LEVEL, 0);
        AttackingMon.species = GetMonData(pp, MON_DATA_SPECIES, 0);
        AttackingMon.hp = GetMonData(pp, MON_DATA_HP, 0);
        AttackingMon.maxhp = GetMonData(pp, MON_DATA_MAXHP, 0);
        AttackingMon.condition = GetMonData(pp, MON_DATA_STATUS, 0);
        AttackingMon.ability = GetMonData(pp, MON_DATA_ABILITY, 0);
        AttackingMon.sex = GetMonData(pp, MON_DATA_GENDER, 0);
        AttackingMon.type1 = GetMonData(pp, MON_DATA_TYPE_1, 0);
        AttackingMon.type2 = GetMonData(pp, MON_DATA_TYPE_2, 0);
        item = GetMonData(pp, MON_DATA_HELD_ITEM, 0);
        debug_printf("AI Calcing base damage using species = %d, hp = %d, attack = %d, and attack stage =%d \n",AttackingMon.species, AttackingMon.hp, attack, atkstate);

        defense = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_DEF, NULL);
        sp_defense = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_SPDEF, NULL);
        defstate = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_STATE_DEF, NULL) - 6;
        spdefstate = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_STATE_SPDEF, NULL) - 6;
    
        DefendingMon.species = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_SPECIES, NULL);
        DefendingMon.hp = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_HP, NULL);
        DefendingMon.maxhp = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_MAX_HP, NULL);
        DefendingMon.condition = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_MAX_CONDITION, NULL);
        DefendingMon.ability = GetBattlerAbility(sp, defender);
        DefendingMon.sex = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_SEX, NULL);
        DefendingMon.type1 = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_TYPE1, NULL);
        DefendingMon.type2 = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_TYPE2, NULL);
    }
    else if(usePPForDefender){
        switch (moveno) {
            // handle body press - attack is derived from defense
            case MOVE_BODY_PRESS:
                attack = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_DEF, NULL);
                atkstate = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATE_DEF, NULL) - 6;
                break;
    
            default:
                attack = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_ATK, NULL);
                atkstate = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATE_ATK, NULL) - 6;
                break;
        }
        sp_attack = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_SPATK, NULL);
        spatkstate = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATE_SPATK, NULL) - 6;
        level = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_LEVEL, NULL);
        AttackingMon.species = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_SPECIES, NULL);
        AttackingMon.hp = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_HP, NULL);
        AttackingMon.maxhp = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_MAX_HP, NULL);
        AttackingMon.condition = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_MAX_CONDITION, NULL);
        AttackingMon.ability = GetBattlerAbility(sp, attacker);
        AttackingMon.sex = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_SEX, NULL);
        AttackingMon.type1 = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_TYPE1, NULL);
        AttackingMon.type2 = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_TYPE2, NULL);

        defense = GetMonData(pp, MON_DATA_DEFENSE, 0);
        sp_defense = GetMonData(pp, MON_DATA_SPECIAL_DEFENSE, 0);
        defstate = 0; //cannot be boosted if not on the field
        spdefstate = 0;
    
        DefendingMon.species = GetMonData(pp, MON_DATA_SPECIES, 0);
        DefendingMon.hp = GetMonData(pp, MON_DATA_HP, 0);
        DefendingMon.maxhp = GetMonData(pp, MON_DATA_MAXHP, 0);
        DefendingMon.condition = GetMonData(pp, MON_DATA_STATUS, 0);
        DefendingMon.ability = GetMonData(pp, MON_DATA_ABILITY, 0);
        DefendingMon.sex = GetMonData(pp, MON_DATA_GENDER, 0);
        DefendingMon.type1 = GetMonData(pp, MON_DATA_TYPE_1, 0);
        DefendingMon.type2 = GetMonData(pp, MON_DATA_TYPE_2, 0);
        item = GetMonData(pp, MON_DATA_HELD_ITEM, 0);
    }

    else{
        switch (moveno) {
            // handle body press - attack is derived from defense
            case MOVE_BODY_PRESS:
                attack = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_DEF, NULL);
                atkstate = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATE_DEF, NULL) - 6;
                break;
    
            default:
                attack = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_ATK, NULL);
                atkstate = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATE_ATK, NULL) - 6;
                break;
        }
        sp_attack = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_SPATK, NULL);
        spatkstate = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATE_SPATK, NULL) - 6;
        level = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_LEVEL, NULL);
        AttackingMon.species = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_SPECIES, NULL);
        AttackingMon.hp = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_HP, NULL);
        AttackingMon.maxhp = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_MAX_HP, NULL);
        AttackingMon.condition = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_MAX_CONDITION, NULL);
        AttackingMon.ability = GetBattlerAbility(sp, attacker);
        AttackingMon.sex = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_SEX, NULL);
        AttackingMon.type1 = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_TYPE1, NULL);
        AttackingMon.type2 = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_TYPE2, NULL);
        item = GetBattleMonItem(sp, attacker);
        defense = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_DEF, NULL);
        sp_defense = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_SPDEF, NULL);
        defstate = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_STATE_DEF, NULL) - 6;
        spdefstate = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_STATE_SPDEF, NULL) - 6;
    
        DefendingMon.species = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_SPECIES, NULL);
        DefendingMon.hp = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_HP, NULL);
        DefendingMon.maxhp = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_MAX_HP, NULL);
        DefendingMon.condition = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_MAX_CONDITION, NULL);
        DefendingMon.ability = GetBattlerAbility(sp, defender);
        DefendingMon.sex = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_SEX, NULL);
        DefendingMon.type1 = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_TYPE1, NULL);
        DefendingMon.type2 = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_TYPE2, NULL);
        item = GetBattleMonItem(sp, defender);
    }
    
    AttackingMon.item_held_effect = BattleItemDataGet(sp, item, 1);
    AttackingMon.item_power = BattleItemDataGet(sp, item, 2);

    DefendingMon.item_held_effect = BattleItemDataGet(sp, item, 1);
    DefendingMon.item_power = BattleItemDataGet(sp, item, 2);
    
    //----------------
    battle_type = BattleTypeGet(bw);
    if(usePPForAttacker){
        if ((GetMonData(pp, MON_DATA_ABILITY, 0) != ABILITY_MOLD_BREAKER)
        && sp->battlemon[defender].ability == ABILITY_DISGUISE
        && (sp->battlemon[defender].species == SPECIES_MIMIKYU)
        // Mimikyu or Mimikyu-Large
        && (sp->battlemon[defender].form_no == 0 || sp->battlemon[defender].form_no == 2)
        // Not transformed
        && !(sp->battlemon[defender].condition2 & STATUS2_TRANSFORMED)) {
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_SUPER_EFFECTIVE;
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE;
            return 0;
        }
            
        if ((GetMonData(pp, MON_DATA_ABILITY, 0) != ABILITY_MOLD_BREAKER)
        && sp->battlemon[defender].ability == ABILITY_ICE_FACE
        && (sp->battlemon[defender].species == SPECIES_EISCUE)
        && (sp->battlemon[defender].form_no == 0)
        // Not transformed
        && !(sp->battlemon[defender].condition2 & STATUS2_TRANSFORMED)
        && (GetMoveSplit(sp, moveno) == SPLIT_PHYSICAL)) {
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_SUPER_EFFECTIVE;
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE;
            return 0;
        }
    }
    else if(usePPForDefender){
        if (sp->battlemon[attacker].ability != ABILITY_MOLD_BREAKER
        && GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_DISGUISE
        && (sp->battlemon[defender].species == SPECIES_MIMIKYU)
        // Mimikyu or Mimikyu-Large
        && (sp->battlemon[defender].form_no == 0 || sp->battlemon[defender].form_no == 2)
        // Not transformed
        && !(sp->battlemon[defender].condition2 & STATUS2_TRANSFORMED)) {
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_SUPER_EFFECTIVE;
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE;
            return 0;
        }
            
        if (sp->battlemon[attacker].ability != ABILITY_MOLD_BREAKER
        && GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_ICE_FACE
        && (sp->battlemon[defender].form_no == 0)
        // Not transformed
        && !(sp->battlemon[defender].condition2 & STATUS2_TRANSFORMED)
        && (GetMoveSplit(sp, moveno) == SPLIT_PHYSICAL)) {
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_SUPER_EFFECTIVE;
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE;
            return 0;
        }
    }
    else{
        if ((MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_DISGUISE) == TRUE)
        && (sp->battlemon[defender].species == SPECIES_MIMIKYU)
        // Mimikyu or Mimikyu-Large
        && (sp->battlemon[defender].form_no == 0 || sp->battlemon[defender].form_no == 2)
        // Not transformed
        && !(sp->battlemon[defender].condition2 & STATUS2_TRANSFORMED)) {
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_SUPER_EFFECTIVE;
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE;
            return 0;
        }
            
        if ((MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_ICE_FACE) == TRUE)
        && (sp->battlemon[defender].species == SPECIES_EISCUE)
        && (sp->battlemon[defender].form_no == 0)
        // Not transformed
        && !(sp->battlemon[defender].condition2 & STATUS2_TRANSFORMED)
        && (GetMoveSplit(sp, moveno) == SPLIT_PHYSICAL)) {
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_SUPER_EFFECTIVE;
            sp->waza_status_flag &= ~MOVE_STATUS_FLAG_NOT_VERY_EFFECTIVE;
            return 0;
        }
    }
        

    if (pow == 0)
        movepower = sp->moveTbl[moveno].power;
    else
        movepower = pow;

    // get the type
    if(usePPForAttacker){
        GetAdjustedMoveTypeBasics(sp, moveno, GetMonData(pp, MON_DATA_ABILITY, 0), 0);
    }

    else{
        movetype = GetAdjustedMoveType(sp, attacker, moveno);
    }

    movepower = movepower * sp->damage_value / 10;

    if(!usePPForAttacker){
        // handle charge
        if ((sp->battlemon[attacker].effect_of_moves & MOVE_EFFECT_FLAG_CHARGE) && (movetype == TYPE_ELECTRIC))
            movepower *= 2;

        // handle helping hand
        if (sp->oneTurnFlag[attacker].helping_hand_flag)
            movepower = movepower * 15 / 10;
    }

    // handle technician
    if ((AttackingMon.ability == ABILITY_TECHNICIAN) && (moveno != MOVE_STRUGGLE) && (movepower <= 60))
        movepower = movepower * 15 / 10;

    movesplit = GetMoveSplit(sp, moveno);

    // handle huge power + pure power
    if ((AttackingMon.ability == ABILITY_HUGE_POWER) || (AttackingMon.ability == ABILITY_PURE_POWER))
        attack = attack * 2;

    // handle slow start
    if(usePPForAttacker){
        if (AttackingMon.ability == ABILITY_SLOW_START)
            attack /= 2;
    }
    else{
        if ((AttackingMon.ability == ABILITY_SLOW_START)
        && ((BattleWorkMonDataGet(bw, sp, 3, 0) - BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_SLOW_START_COUNTER, NULL)) < 5))
            attack /= 2;
    }

    // handle defeatist
    if ((AttackingMon.ability == ABILITY_DEFEATIST) && (AttackingMon.hp <= AttackingMon.maxhp / 2))
    {
        attack /= 2;
        sp_attack /= 2;
    }

    //handle analytic
    if(usePPForAttacker){
        /*
        if (AttackingMon.ability == ABILITY_ANALYTIC)
        {
            for (i = 0; i < 4; i++)
            {
                if (attacker != i && sp->battlemon[i].hp != 0 && CalcSpeed(bw, sp, attacker, i, 0) == 1)
                {
                    break;
                }
            }
            if (i == 4)
            {
                movepower = movepower * 130 / 100;
            }
        }
        */
    }
    else{
        if (AttackingMon.ability == ABILITY_ANALYTIC)
        {
            for (i = 0; i < 4; i++)
            {
                if (attacker != i && sp->battlemon[i].hp != 0 && CalcSpeed(bw, sp, attacker, i, 0) == 0)
                {
                    break;
                }
            }
            if (i == 4)
            {
                movepower = movepower * 130 / 100;
            }
        }
    }

    
    // handle sheer force
    if(usePPForAttacker){
        //need a way to check if the move is affected by sheer force. There is not a function for this at the moment
    }
    else{
        if (AttackingMon.ability == ABILITY_SHEER_FORCE && sp->battlemon[attacker].sheer_force_flag == 1)
        {
            movepower = movepower * 130 / 100;
        }
    }


    // handle punk rock
    if(usePPForAttacker){
        if (AttackingMon.ability == ABILITY_PUNK_ROCK && IsMoveSoundBased(moveno))
        {
            movepower = movepower * 130 / 100;
        }
    }
    else{
        if (AttackingMon.ability == ABILITY_PUNK_ROCK && IsMoveSoundBased(sp->current_move_index))
        {
            movepower = movepower * 130 / 100;
        }
    }

    // type boosting held items
    {
        u8 element[2] = {AttackingMon.item_held_effect, movetype};
        if (IsElementInArray(HeldItemPowerUpTable, element, NELEMS(HeldItemPowerUpTable), sizeof(element)))
        {
            movepower = movepower * (100 + AttackingMon.item_power) / 100;
        }
    }
    // handle choice band
    if (AttackingMon.item_held_effect == HOLD_EFFECT_CHOICE_ATK)
        attack = attack * 150 / 100;

    // handle choice specs
    if (AttackingMon.item_held_effect == HOLD_EFFECT_CHOICE_SPATK)
        sp_attack = sp_attack * 150 / 100;

    // handle soul dew - gen 7 changes it to just boost movepower if the type is dragon or psychic, no more defense boost
    if ((AttackingMon.item_held_effect == HOLD_EFFECT_LATI_SPECIAL)
     && ((AttackingMon.species == SPECIES_LATIOS) || (AttackingMon.species == SPECIES_LATIAS))
     && (movetype == TYPE_DRAGON || movetype == TYPE_PSYCHIC))
    {
        movepower = movepower * 120 / 100; // 4915/4096
    }

    // handle deep sea tooth
    if ((AttackingMon.item_held_effect == HOLD_EFFECT_CLAMPERL_SPATK) && (AttackingMon.species == SPECIES_CLAMPERL))
        sp_attack *= 2;

    // handle deep sea scale
    if ((DefendingMon.item_held_effect == HOLD_EFFECT_CLAMPERL_SPDEF) && (DefendingMon.species == SPECIES_CLAMPERL))
        sp_defense *= 2;

    // handle light ball
    if ((AttackingMon.item_held_effect == HOLD_EFFECT_PIKA_SPATK_UP) && (AttackingMon.species == SPECIES_PIKACHU))
        movepower *= 2;

    // handle metal powder
    if ((DefendingMon.item_held_effect == HOLD_EFFECT_DITTO_DEF_UP) && (DefendingMon.species == SPECIES_DITTO))
        defense *= 2;

    // handle gorilla tactics
    if (AttackingMon.ability == ABILITY_GORILLA_TACTICS) {
        attack = attack * 150 / 100;
    }

    // handle assault vest
    if (DefendingMon.item_held_effect == HOLD_EFFECT_SPDEF_BOOST_NO_STATUS_MOVES) {
        sp_defense = sp_defense * 150 / 100;
    }

    // handle eviolite
    if(usePPForDefender){
        if(DefendingMon.item_held_effect == HOLD_EFFECT_EVIOLITE){
            defense = defense * 150 / 100;
            sp_defense = sp_defense * 150 / 100;
        }
    }
    else{
        if (DefendingMon.item_held_effect == HOLD_EFFECT_EVIOLITE) {
            u16 speciesWithForm;
            speciesWithForm = PokeOtherFormMonsNoGet(sp->battlemon[defender].species, sp->battlemon[defender].form_no);
    
            struct Evolution *evoTable;
            evoTable = sys_AllocMemory(0, MAX_EVOS_PER_POKE * sizeof(struct Evolution));
            ArchiveDataLoad(evoTable, ARC_EVOLUTIONS, speciesWithForm);
    
            // If a Pokémon has any evolutions, there should be an entry at the top that isn't EVO_NONE.
            // In that case, the Pokémon is capable of evolving, and so the effect of Eviolite should apply.
            if (evoTable[0].method != EVO_NONE) {
                defense = defense * 150 / 100;
                sp_defense = sp_defense * 150 / 100;
            }
    
            sys_FreeMemoryEz(evoTable);
        }
    }

    

    // handle thick club
    if ((AttackingMon.item_held_effect == HOLD_EFFECT_CUBONE_ATK_UP)
     && ((AttackingMon.species == SPECIES_CUBONE)
      || (AttackingMon.species == SPECIES_MAROWAK)))
        attack *= 2;

    // handle adamant/lustrous/griseous orb
    if ((AttackingMon.item_held_effect == HOLD_EFFECT_DIALGA_BOOST) &&
        ((movetype == TYPE_DRAGON) || (movetype == TYPE_STEEL)) &&
        (AttackingMon.species == SPECIES_DIALGA))
    {
        movepower = movepower * (100 + AttackingMon.item_power) / 100;
    }

    if ((AttackingMon.item_held_effect == HOLD_EFFECT_PALKIA_BOOST) &&
        ((movetype == TYPE_DRAGON) || (movetype == TYPE_WATER)) &&
        (AttackingMon.species == SPECIES_PALKIA))
    {
        movepower = movepower * (100 + AttackingMon.item_power) / 100;
    }

    if ((AttackingMon.item_held_effect == HOLD_EFFECT_GIRATINA_BOOST) &&
        ((movetype == TYPE_DRAGON) || (movetype == TYPE_GHOST)) &&
        (AttackingMon.species == SPECIES_GIRATINA))
    {
        movepower = movepower * (100 + AttackingMon.item_power) / 100;
    }

    if(usePPForAttacker){
        // handle adamant crystal, lustrous globe & griseous core
        if ((AttackingMon.item_held_effect == HOLD_EFFECT_DIALGA_BOOST_AND_TRANSFORM) &&
        ((movetype == TYPE_DRAGON) || (movetype == TYPE_STEEL)) &&
        (AttackingMon.species == SPECIES_DIALGA))
        {
            movepower = movepower * (100 + AttackingMon.item_power) / 100;
        }

        if ((AttackingMon.item_held_effect == HOLD_EFFECT_PALKIA_BOOST_AND_TRANSFORM) &&
        ((movetype == TYPE_DRAGON) || (movetype == TYPE_WATER)) &&
        (AttackingMon.species == SPECIES_PALKIA))
        {
            movepower = movepower * (100 + AttackingMon.item_power) / 100;
        }

        if ((AttackingMon.item_held_effect == HOLD_EFFECT_GIRATINA_BOOST_AND_TRANSFORM) &&
        ((movetype == TYPE_DRAGON) || (movetype == TYPE_GHOST)) &&
        (AttackingMon.species == SPECIES_GIRATINA))
        {
            movepower = movepower * (100 + AttackingMon.item_power) / 100;
        }
    }
    else{
        // handle adamant crystal, lustrous globe & griseous core
        if ((AttackingMon.item_held_effect == HOLD_EFFECT_DIALGA_BOOST_AND_TRANSFORM) &&
        ((movetype == TYPE_DRAGON) || (movetype == TYPE_STEEL)) &&
        ((BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATUS2, NULL) & STATUS2_TRANSFORMED) == 0) &&
        (AttackingMon.species == SPECIES_DIALGA))
        {
        movepower = movepower * (100 + AttackingMon.item_power) / 100;
        }

        if ((AttackingMon.item_held_effect == HOLD_EFFECT_PALKIA_BOOST_AND_TRANSFORM) &&
        ((movetype == TYPE_DRAGON) || (movetype == TYPE_WATER)) &&
        ((BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATUS2, NULL) & STATUS2_TRANSFORMED) == 0) &&
        (AttackingMon.species == SPECIES_PALKIA))
        {
        movepower = movepower * (100 + AttackingMon.item_power) / 100;
        }

        if ((AttackingMon.item_held_effect == HOLD_EFFECT_GIRATINA_BOOST_AND_TRANSFORM) &&
        ((movetype == TYPE_DRAGON) || (movetype == TYPE_GHOST)) &&
        ((BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATUS2, NULL) & STATUS2_TRANSFORMED) == 0) &&
        (AttackingMon.species == SPECIES_GIRATINA))
        {
        movepower = movepower * (100 + AttackingMon.item_power) / 100;
        }
    }
    
    // handle punching glove
    if ((AttackingMon.item_held_effect == HOLD_EFFECT_INCREASE_PUNCHING_MOVE_DMG) && IsElementInArray(PunchingMovesTable, (u16 *)&moveno, NELEMS(PunchingMovesTable), sizeof(PunchingMovesTable[0])))
    {
        movepower = movepower * (100 + AttackingMon.item_power) / 100;
    }

    // handle ogerpon mask boosts
    if (((AttackingMon.item_held_effect == HOLD_EFFECT_CORNERSTONE_MASK) ||
        (AttackingMon.item_held_effect == HOLD_EFFECT_WELLSPRING_MASK) ||
        (AttackingMon.item_held_effect == HOLD_EFFECT_HEARTHFLAME_MASK)) &&
        (AttackingMon.species == SPECIES_OGERPON))
    {
        movepower = movepower * (100 + AttackingMon.item_power) / 100;
    }

    // handle items that boost physical/special moves
    if ((AttackingMon.item_held_effect == HOLD_EFFECT_POWER_UP_PHYS) && (movesplit == SPLIT_PHYSICAL))
    {
        movepower = movepower * (100 + AttackingMon.item_power) / 100;
    }

    if ((AttackingMon.item_held_effect == HOLD_EFFECT_POWER_UP_SPEC) && (movesplit == SPLIT_SPECIAL))
    {
        movepower = movepower * (100 + AttackingMon.item_power) / 100;
    }

    // handle thick fat
    if(usePPForAttacker){
        if (!(GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_MOLD_BREAKER) && sp->battlemon[defender].ability == ABILITY_THICK_FAT &&
        (movetype == TYPE_FIRE) || (movetype == TYPE_ICE))
        {
            movepower /= 2;
        }
    }
    else if(usePPForDefender){

        if ((GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_THICK_FAT) && sp->battlemon[attacker].ability != ABILITY_MOLD_BREAKER &&
        (movetype == TYPE_FIRE) || (movetype == TYPE_ICE))
        {
            movepower /= 2;
        }
    }
    else{
        if ((MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_THICK_FAT) == TRUE) &&
        ((movetype == TYPE_FIRE) || (movetype == TYPE_ICE)))
        {
            movepower /= 2;
        }
    }


    // handle hustle
    if (AttackingMon.ability == ABILITY_HUSTLE)
    {
        attack = attack * 150 / 100;
    }

    // handle guts
    if ((AttackingMon.ability == ABILITY_GUTS) && (AttackingMon.condition))
    {
        attack = attack * 150 / 100;
    }

    // handle toxic boost
    if ((AttackingMon.ability == ABILITY_TOXIC_BOOST) && ((AttackingMon.condition & STATUS_BAD_POISON) || (AttackingMon.condition & STATUS_POISON)))
    {
        attack = attack * 150 / 100;
    }

    // handle flare boost
    if ((AttackingMon.ability == ABILITY_FLARE_BOOST) && ((AttackingMon.condition & STATUS_BURN)))
    {
        sp_attack = sp_attack * 150 / 100;
    }

    // handle tough claws
    if ((AttackingMon.ability == ABILITY_TOUGH_CLAWS) && (IsContactBeingMade(bw, sp)))
    {
        movepower = movepower * 130 / 100;
    }

    // handle fluffy
    if (DefendingMon.ability == ABILITY_FLUFFY) {
        if (IsContactBeingMade(bw, sp)) {
            movepower = movepower * 50 / 100;
        }

        if (movetype == TYPE_FIRE) {
            movepower = movepower * 200 / 100;
        }
    }

    // handle marvel scale
    if(usePPForAttacker){
        if (!(GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_MOLD_BREAKER) && (AttackingMon.condition)&& sp->battlemon[defender].ability == ABILITY_MARVEL_SCALE )
        {
            defense = defense * 150 / 100;
        }
    }
    else if(usePPForDefender){
        if ((GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_MARVEL_SCALE) && sp->battlemon[attacker].ability != ABILITY_MOLD_BREAKER && (AttackingMon.condition))
        {
            defense = defense * 150 / 100;
        }
    }
    else{
        if ((MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_MARVEL_SCALE) == TRUE) && (AttackingMon.condition))
        {
            defense = defense * 150 / 100;
        }
    }

    // handle grass pelt
    if(usePPForAttacker){
        if (!(GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_MOLD_BREAKER) && sp->battlemon[defender].ability == ABILITY_GRASS_PELT && (sp->terrainOverlay.type == GRASSY_TERRAIN && sp->terrainOverlay.numberOfTurnsLeft > 0))
        {
            defense = defense * 150 / 100;
        }
    }
    else if(usePPForDefender){
        if ((GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_GRASS_PELT) && sp->battlemon[attacker].ability != ABILITY_MOLD_BREAKER && (sp->terrainOverlay.type == GRASSY_TERRAIN && sp->terrainOverlay.numberOfTurnsLeft > 0))
        {
            defense = defense * 150 / 100;
        }
    }
    else{
        if ((MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_GRASS_PELT) == TRUE) && (sp->terrainOverlay.type == GRASSY_TERRAIN && sp->terrainOverlay.numberOfTurnsLeft > 0))
        {
            defense = defense * 150 / 100;
        }
    }
    
    // handle plus/minus
    if (((AttackingMon.ability == ABILITY_PLUS) || (AttackingMon.ability == ABILITY_MINUS)) &&
        (CheckSideAbility(bw, sp, CHECK_ABILITY_SAME_SIDE_HP, attacker, ABILITY_MINUS) ||
        CheckSideAbility(bw, sp, CHECK_ABILITY_SAME_SIDE_HP, attacker, ABILITY_PLUS)))
    {
        sp_attack = sp_attack * 150 / 100;
    }

    // handle fur coat - double defense
    if(usePPForAttacker){
        if (!(GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_MOLD_BREAKER)&& sp->battlemon[defender].ability == ABILITY_FUR_COAT)
        {
            defense *= 2;
        }
    }
    else if(usePPForDefender){
        if ((GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_FUR_COAT) && sp->battlemon[attacker].ability != ABILITY_MOLD_BREAKER)
        {
            defense *= 2;
        }
    }
    else{
        if ((MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_FUR_COAT) == TRUE))
        {
            defense *= 2;
        }
    }


    // handle mud/water sport
    if ((movetype == TYPE_ELECTRIC) && (CheckFieldMoveEffect(bw, sp, MOVE_EFFECT_FLAG_MUD_SPORT)))
    {
        movepower /= 3;
    }

    if ((movetype == TYPE_FIRE) && (CheckFieldMoveEffect(bw, sp, MOVE_EFFECT_FLAG_WATER_SPORT)))
    {
        movepower /= 3;
    }

    // handle "in a pinch" type boosters
    if ((movetype == TYPE_GRASS) && (AttackingMon.ability == ABILITY_OVERGROW) && (AttackingMon.hp <= AttackingMon.maxhp * 10 / 30))
    {
        movepower = movepower * 150 / 100;
    }

    if ((movetype == TYPE_FIRE) && (AttackingMon.ability == ABILITY_BLAZE) && (AttackingMon.hp <= AttackingMon.maxhp * 10 / 30))
    {
        movepower = movepower * 150 / 100;
    }

    if ((movetype == TYPE_WATER) && (AttackingMon.ability == ABILITY_TORRENT) && (AttackingMon.hp <= AttackingMon.maxhp * 10 / 30))
    {
        movepower = movepower * 150 / 100;
    }

    if ((movetype == TYPE_BUG) && (AttackingMon.ability == ABILITY_SWARM) && (AttackingMon.hp <= AttackingMon.maxhp * 10 / 30))
    {
        movepower = movepower * 150 / 100;
    }

    // handle ice scales - halve damage if move is special, regardless of if it uses defense stat
    if(usePPForAttacker){
        if (!(GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_MOLD_BREAKER) && sp->battlemon[defender].ability == ABILITY_ICE_SCALES && movesplit == SPLIT_SPECIAL)
        {
            movepower /= 2;
        }
    }
    else if(usePPForDefender){
        if ((GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_ICE_SCALES) && sp->battlemon[attacker].ability != ABILITY_MOLD_BREAKER && movesplit == SPLIT_SPECIAL)
        {
            movepower /= 2;
        }
    }
    else{
        if (MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_ICE_SCALES) == TRUE && movesplit == SPLIT_SPECIAL)
        {
            movepower /= 2;
        }
    }


    // handle steelworker
    if (AttackingMon.ability == ABILITY_STEELWORKER && (movetype == TYPE_STEEL))
    {
        movepower = movepower * 150 / 100;
    }

    // handle dragon's maw
    if (AttackingMon.ability == ABILITY_DRAGONS_MAW && (movetype == TYPE_DRAGON))
    {
        movepower = movepower * 150 / 100;
    }

    // handle transistor
    if (AttackingMon.ability == ABILITY_TRANSISTOR && (movetype == TYPE_ELECTRIC))
    {
        movepower = movepower * 130 / 100;
    }

    // handle rocky payload
    if (AttackingMon.ability == ABILITY_ROCKY_PAYLOAD && (movetype == TYPE_ROCK))
    {
        movepower = movepower * 150 / 100;
    }

    // if dark aura is present but not aura break
    if ((movetype == TYPE_DARK) && (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_DARK_AURA) != 0)
      && (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AURA_BREAK) == 0))
        movepower = movepower * 133 / 100;

    // if dark aura is present AND aura break
    else if ((movetype == TYPE_DARK) && (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_DARK_AURA) != 0)
      && (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AURA_BREAK) != 0))
        movepower = movepower * 100 / 133;

#if FAIRY_TYPE_IMPLEMENTED == 1
    // if FAIRY aura is present but not aura break
    if ((movetype == TYPE_FAIRY) && (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_FAIRY_AURA) != 0)
      && (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AURA_BREAK) == 0))
        movepower = movepower * 133 / 100;

    // if FAIRY aura is present AND aura break
    else if ((movetype == TYPE_FAIRY) && (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_FAIRY_AURA) != 0)
      && (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AURA_BREAK) != 0))
        movepower = movepower * 100 / 133;
#endif

    // handle steely spirit for the ally
    if (movetype == TYPE_STEEL && GetBattlerAbility(sp, BATTLER_ALLY(attacker)) == ABILITY_STEELY_SPIRIT)
    {
        movepower = movepower * 150 / 100;
    }

    // handle steely spirit for the attacker--can stack
    if (movetype == TYPE_STEEL && AttackingMon.ability == ABILITY_STEELY_SPIRIT)
    {
        movepower = movepower * 150 / 100;
    }

    // handle battery
    if (GetBattlerAbility(sp, BATTLER_ALLY(attacker)) == ABILITY_BATTERY)
    {
        sp_attack = sp_attack * 130 / 100;
    }

    // handle power spot
    if (GetBattlerAbility(sp, BATTLER_ALLY(attacker)) == ABILITY_POWER_SPOT)
    {
        movepower = movepower * 130 / 100;
    }

    // handle friend guard
    if (GetBattlerAbility(sp, BATTLER_ALLY(defender)) == ABILITY_FRIEND_GUARD)
    {
        movepower = movepower * 75 / 100;
    }

    if (MoveIsAffectedByNormalizeVariants(moveno)) {
        // handle aerilate - 20% boost if a normal type move was changed to a flying type move.  does not boost flying type moves themselves
        if (AttackingMon.ability == ABILITY_AERILATE && movetype == TYPE_FLYING && sp->moveTbl[moveno].type == TYPE_NORMAL) {
            movepower = movepower * 120 / 100;
        }

        // handle pixilate - 20% boost if a normal type move was changed to a fairy type move.  does not boost fairy type moves themselves
        if (AttackingMon.ability == ABILITY_PIXILATE && movetype == TYPE_FAIRY && sp->moveTbl[moveno].type == TYPE_NORMAL) {
            movepower = movepower * 120 / 100;
        }

        // handle galvanize - 20% boost if a normal type move was changed to an electric type move.  does not boost electric type moves themselves
        if (AttackingMon.ability == ABILITY_GALVANIZE && movetype == TYPE_ELECTRIC && sp->moveTbl[moveno].type == TYPE_NORMAL) {
            movepower = movepower * 120 / 100;
        }

        // handle refrigerate - 20% boost if a normal type move was changed to an ice type move.  does not boost ice type moves themselves
        if (AttackingMon.ability == ABILITY_REFRIGERATE && movetype == TYPE_ICE && sp->moveTbl[moveno].type == TYPE_NORMAL) {
            movepower = movepower * 120 / 100;
        }

        // handle normalize - 20% boost if a normal type move is used (and it changes types to normal too)
        if (AttackingMon.ability == ABILITY_NORMALIZE && movetype == TYPE_NORMAL) {
            movepower = movepower * 120 / 100;
        }
    }

    // handle heatproof/dry skin
    if(usePPForAttacker){
        if ((movetype == TYPE_FIRE) && !(GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_MOLD_BREAKER) && sp->battlemon[defender].ability == ABILITY_DRY_SKIN)
        {
            movepower /= 2;
        }
    
        if ((movetype == TYPE_FIRE) && !(GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_MOLD_BREAKER) && sp->battlemon[defender].ability == ABILITY_HEATPROOF)
        {
            movepower = movepower * 125 / 100;
        }
    }
    else if(usePPForDefender){
        if ((movetype == TYPE_FIRE) && (GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_DRY_SKIN) && sp->battlemon[attacker].ability != ABILITY_MOLD_BREAKER)
        {
            movepower /= 2;
        }
    
        if ((movetype == TYPE_FIRE) && (GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_HEATPROOF) && sp->battlemon[attacker].ability != ABILITY_MOLD_BREAKER)
        {
            movepower = movepower * 125 / 100;
        }
    }
    else{
        if ((movetype == TYPE_FIRE) && (MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_HEATPROOF) == TRUE))
        {
            movepower /= 2;
        }
    
        if ((movetype == TYPE_FIRE) && (MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_DRY_SKIN) == TRUE))
        {
            movepower = movepower * 125 / 100;
        }
    }
    
    // handle unaware
    if(usePPForAttacker){
        if (!(GetMonData(pp, MON_DATA_ABILITY,0) == ABILITY_MOLD_BREAKER) && sp->battlemon[defender].ability == ABILITY_UNAWARE)
        {
            atkstate = 0;
            spatkstate = 0;
        }
    }
    else if(usePPForDefender){
        if ((GetMonData(pp, MON_DATA_ABILITY, 0) == ABILITY_UNAWARE) && sp->battlemon[attacker].ability != ABILITY_MOLD_BREAKER)
        {
            atkstate = 0;
            spatkstate = 0;
        }
    }
    else{
        if (MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_UNAWARE) == TRUE)
        {
            atkstate = 0;
            spatkstate = 0;
        }
    }


    if (AttackingMon.ability == ABILITY_UNAWARE)
    {
        defstate = 0;
        spdefstate = 0;
    }

    // adjust states to access from the array
    atkstate += 6;
    defstate += 6;
    spatkstate += 6;
    spdefstate += 6;

    // handle rivalry
    if ((AttackingMon.ability == ABILITY_RIVALRY) &&
        (AttackingMon.sex == DefendingMon.sex) && (AttackingMon.sex != POKEMON_GENDER_UNKNOWN) && (DefendingMon.sex != POKEMON_GENDER_UNKNOWN))
    {
        movepower = movepower * 125 / 100;
    }

    if ((AttackingMon.ability == ABILITY_RIVALRY) &&
        (AttackingMon.sex != DefendingMon.sex) && (AttackingMon.sex != POKEMON_GENDER_UNKNOWN) && (DefendingMon.sex != POKEMON_GENDER_UNKNOWN))
    {
        movepower = movepower * 75 / 100;
    }

    // handle iron fist
    if ((AttackingMon.ability == ABILITY_IRON_FIST) && IsElementInArray(PunchingMovesTable, (u16 *)&moveno, NELEMS(PunchingMovesTable), sizeof(PunchingMovesTable[0])))
    {
        movepower = movepower * 12 / 10;
    }

    // handle strong jaw
    if ((AttackingMon.ability == ABILITY_STRONG_JAW) && IsElementInArray(StrongJawMovesTable, (u16 *)&moveno, NELEMS(StrongJawMovesTable), sizeof(StrongJawMovesTable[0])))
    {
        movepower = movepower * 15 / 10;
    }

    // handle mega launcher
    if ((AttackingMon.ability == ABILITY_MEGA_LAUNCHER) && IsElementInArray(MegaLauncherMovesTable, (u16 *)&moveno, NELEMS(MegaLauncherMovesTable), sizeof(MegaLauncherMovesTable[0])))
    {
        movepower = movepower * 15 / 10;
    }

    // handle sharpness
    if ((AttackingMon.ability == ABILITY_SHARPNESS) && IsElementInArray(SharpnessMovesTable, (u16 *)&moveno, NELEMS(SharpnessMovesTable), sizeof(SharpnessMovesTable[0])))
    {
        movepower = movepower * 15 / 10;
    }

    // handle water bubble
    if ((AttackingMon.ability == ABILITY_WATER_BUBBLE) && (movetype == TYPE_WATER))
    {
        movepower = movepower * 2;
    }

    // handle ruin abilities
    if ((CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_VESSEL_OF_RUIN))
      && (DefendingMon.ability != ABILITY_VESSEL_OF_RUIN))
        sp_attack = sp_attack * 75 / 100;

    if ((CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_SWORD_OF_RUIN))
      && (DefendingMon.ability != ABILITY_SWORD_OF_RUIN))
        defense = defense * 75 / 100;

    if ((CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_TABLETS_OF_RUIN))
      && (DefendingMon.ability != ABILITY_TABLETS_OF_RUIN))
        attack = attack * 75 / 100;

    if ((CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_BEADS_OF_RUIN))
      && (DefendingMon.ability != ABILITY_BEADS_OF_RUIN))
        sp_defense = sp_defense * 75 / 100;

    // handle field effects interacting with their moves

    if(usePPForAttacker){
        if (sp->terrainOverlay.numberOfTurnsLeft > 0) {
            switch (sp->terrainOverlay.type)
            {
            case ELECTRIC_TERRAIN:
                if (IsClientGrounded(sp, defender) && moveno == MOVE_RISING_VOLTAGE) {
                    movepower = movepower * 2;
                }
                break;
            case MISTY_TERRAIN:
                if (IsPartyPokemonGrounded(sp, pp) && moveno == MOVE_MISTY_EXPLOSION) {
                    movepower = movepower * 15 / 10;
                }
                break;
            case PSYCHIC_TERRAIN:
                if (IsPartyPokemonGrounded(sp, pp) && moveno == MOVE_EXPANDING_FORCE) {
                    movepower = movepower * 15 / 10;
                }
                break;
            default:
                break;
            }
        }
    }
    else if(usePPForDefender){
        if (sp->terrainOverlay.numberOfTurnsLeft > 0) {
            switch (sp->terrainOverlay.type)
            {
            case ELECTRIC_TERRAIN:
                if (IsPartyPokemonGrounded(sp, pp) && moveno == MOVE_RISING_VOLTAGE) {
                    movepower = movepower * 2;
                }
                break;
            case MISTY_TERRAIN:
                if (IsClientGrounded(sp, attacker) && moveno == MOVE_MISTY_EXPLOSION) {
                    movepower = movepower * 15 / 10;
                }
                break;
            case PSYCHIC_TERRAIN:
                if (IsClientGrounded(sp, attacker) && moveno == MOVE_EXPANDING_FORCE) {
                    movepower = movepower * 15 / 10;
                }
                break;
            default:
                break;
            }
        }
    }
    else{
        if (sp->terrainOverlay.numberOfTurnsLeft > 0) {
            switch (sp->terrainOverlay.type)
            {
            case ELECTRIC_TERRAIN:
                if (IsClientGrounded(sp, defender) && moveno == MOVE_RISING_VOLTAGE) {
                    movepower = movepower * 2;
                }
                break;
            case MISTY_TERRAIN:
                if (IsClientGrounded(sp, attacker) && moveno == MOVE_MISTY_EXPLOSION) {
                    movepower = movepower * 15 / 10;
                }
                break;
            case PSYCHIC_TERRAIN:
                if (IsClientGrounded(sp, attacker) && moveno == MOVE_EXPANDING_FORCE) {
                    movepower = movepower * 15 / 10;
                }
                break;
            default:
                break;
            }
        }
    }
    

    // handle grav apple
    if ((sp->field_condition & FIELD_STATUS_GRAVITY) && (moveno == MOVE_GRAV_APPLE))
    {
        movepower = movepower * 15 / 10;
    }

    // handle weather boosts
    if ((CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) == 0) &&
        (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK) == 0))
    {
        if ((field_cond & WEATHER_SUNNY_ANY) && (AttackingMon.ability == ABILITY_SOLAR_POWER))
        {
            sp_attack = sp_attack * 15 / 10;
        }
        if ((field_cond & WEATHER_SANDSTORM_ANY) &&
            ((DefendingMon.type1 == TYPE_ROCK) || (DefendingMon.type2 == TYPE_ROCK)))
        {
            sp_defense = sp_defense * 15 / 10;
        }
        if ((field_cond & WEATHER_SNOW_ANY) &&
            ((DefendingMon.type1 == TYPE_ICE) || (DefendingMon.type2 == TYPE_ICE)))
        {
            defense = defense * 15 / 10;
        }
        if ((field_cond & WEATHER_SUNNY_ANY) &&
            (CheckSideAbility(bw, sp, CHECK_ABILITY_SAME_SIDE_HP, attacker, ABILITY_FLOWER_GIFT)))
        {
            attack = attack * 15 / 10;
        }
        if ((field_cond & WEATHER_SUNNY_ANY) &&
            (AttackingMon.ability != ABILITY_MOLD_BREAKER) &&
            (CheckSideAbility(bw, sp, CHECK_ABILITY_SAME_SIDE_HP, defender, ABILITY_FLOWER_GIFT)))
        {
            sp_defense = sp_defense * 15 / 10;
        }
    }

    u16 equivalentAttack;
    u16 equivalentDefense;
    getEquivalentAttackAndDefense(sp, attack, defense, sp_attack, sp_defense, atkstate, defstate, spatkstate, spdefstate, &movesplit, attacker, defender, critical, moveno, &equivalentAttack, &equivalentDefense);

    //// halve the defense if using selfdestruct/explosion
    //if (sp->moveTbl[moveno].effect == MOVE_EFFECT_HALVE_DEFENSE)
    //    defense = defense / 2;
    debug_printf("equivalent attack is: %d, equivalentDefens is %d, movepower is: %d, defense is: %d, attack is: %d\n",equivalentAttack,equivalentDefense,movepower, defense,attack);
    damage = equivalentAttack * movepower;
    damage *= (level * 2 / 5 + 2);

    damage = damage / equivalentDefense;
    damage /= 50;

    // handle parental bond
    if(!usePPForAttacker){
        if (sp->oneTurnFlag[attacker].parental_bond_flag == 2) {
            damage /= 4;
        }
        switch (sp->oneTurnFlag[attacker].parental_bond_flag) {
            case 1:
                sp->oneTurnFlag[attacker].parental_bond_flag++;
                sp->oneTurnFlag[attacker].parental_bond_is_active = TRUE; // after first hit, set this flag just in case the ability is nullified after the first one
                break;
            default:
                sp->oneTurnFlag[attacker].parental_bond_flag = 0;
                break;
        }
    }

    // handle physical moves
    if (movesplit == SPLIT_PHYSICAL)
    {
        // burns halve physical damage.  this is ignored by guts and facade (as of gen 6)
        if ((AttackingMon.condition & STATUS_BURN) && (AttackingMon.ability != ABILITY_GUTS) && (moveno != MOVE_FACADE))
        {
            damage /= 2;
        }

        // handle reflect
        if (((side_cond & SIDE_STATUS_REFLECT) != 0)
         && (critical == 1)
         && (sp->moveTbl[moveno].effect != MOVE_EFFECT_REMOVE_SCREENS)
         && (AttackingMon.ability != ABILITY_INFILTRATOR))
        {
            if ((battle_type & BATTLE_TYPE_DOUBLE) && (CheckNumMonsHit(bw, sp, 1, defender) == 2))
            {
                damage = damage * 2 / 3;
            }
            else
            {
                damage /= 2;
            }
        }
    }
    else// if (movesplit == SPLIT_SPECIAL) // same as above, handle special moves
    {
        // handle light screen
        if (((side_cond & SIDE_STATUS_LIGHT_SCREEN) != 0)
         && (critical == 1)
         && (sp->moveTbl[moveno].effect != MOVE_EFFECT_REMOVE_SCREENS)
         && (AttackingMon.ability != ABILITY_INFILTRATOR))
        {
            if ((battle_type & BATTLE_TYPE_DOUBLE) && (CheckNumMonsHit(bw, sp, 1, defender) == 2))
            {
                damage = damage * 2 / 3;
            }
            else
            {
                damage /= 2;
            }
        }
    }

    if ((battle_type & BATTLE_TYPE_DOUBLE) &&
        (sp->moveTbl[moveno].target == 0x4) &&
        (CheckNumMonsHit(bw, sp, 1, defender) == 2))
    {
        damage = damage * 3 / 4;
    }

    if ((battle_type & BATTLE_TYPE_DOUBLE) &&
        (sp->moveTbl[moveno].target == 0x8) &&
        (CheckNumMonsHit(bw, sp, 1, defender) >= 2))
    {
        damage = damage * 3 / 4;
    }

    // handle weather inate type boosts
    if ((CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) == 0) &&
        (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK) == 0))
    {
        if (field_cond & WEATHER_RAIN_ANY) // handle rain boosts
        {
            switch (movetype)
            {
            case TYPE_FIRE:
                damage /= 2;
                break;
            case TYPE_WATER:
                damage = damage * 15 / 10;
                break;
            }
        }

        if ((field_cond & (FIELD_STATUS_FOG | WEATHER_HAIL_ANY | WEATHER_SANDSTORM_ANY | WEATHER_RAIN_ANY | WEATHER_SNOW_ANY)) && (moveno == MOVE_SOLAR_BEAM || moveno == MOVE_SOLAR_BLADE)) // solar beam nerf
        {
            damage /= 2;
        }

        if (field_cond & WEATHER_SUNNY_ANY) // sun boosts fire but nerfs water
        {
            switch (movetype)
            {
            case TYPE_FIRE:
                damage = damage * 15 / 10;
                break;
            case TYPE_WATER:
                // If the current weather is Sunny Day and the user is not holding Utility Umbrella, this move's damage is multiplied by 1.5 instead of halved for being Water type.
                if (moveno == MOVE_HYDRO_STEAM && item != ITEM_UTILITY_UMBRELLA) {
                    damage = damage * 15 / 10;
                } else {
                    damage /= 2;
                }
                break;
            }
        }

        if (AttackingMon.ability == ABILITY_SAND_FORCE // sand force boosts damage in sand for certain move types
         && field_cond & WEATHER_SANDSTORM_ANY
         && (movetype == TYPE_GROUND || movetype == TYPE_ROCK || movetype == TYPE_STEEL))
        {
            damage = damage * 130 / 100;
        }
    }

    if(!usePPForAttacker){
        if ((BattlePokemonParamGet(sp, attacker, BATTLE_MON_FLASH_FIRE_ACTIVATED, NULL)) && (movetype == TYPE_FIRE))
        {
            damage = damage * 15 / 10;
        }
    }

    // handle multiscale
    if ((DefendingMon.ability == ABILITY_MULTISCALE) && (DefendingMon.hp == DefendingMon.maxhp))
    {
        damage /= 2;
    }

    // handle shadow shield
    if ((DefendingMon.ability == ABILITY_SHADOW_SHIELD) && (DefendingMon.hp == DefendingMon.maxhp))
    {
        damage /= 2;
    }

    // handle water bubble
    if ((DefendingMon.ability == ABILITY_WATER_BUBBLE) && (movetype == TYPE_FIRE))
    {
        damage /= 2;
    }

    // handle punk rock TODO uncomment
    if (DefendingMon.ability == ABILITY_PUNK_ROCK && IsMoveSoundBased(moveno))
    {
        damage /= 2;
    }

    // handle purifying salt
    if ((DefendingMon.ability == ABILITY_PURIFYING_SALT) && (movetype == TYPE_GHOST))
    {
        damage /= 2;
    }

    // handle field effects
    if(usePPForAttacker){
        if (sp->terrainOverlay.numberOfTurnsLeft > 0) {
            switch (sp->terrainOverlay.type)
            {
            case GRASSY_TERRAIN:
                if (IsPartyPokemonGrounded(sp, pp) && movetype == TYPE_GRASS) {
                    damage = damage * 130 / 100;
                }
                if (moveno == MOVE_EARTHQUAKE || moveno == MOVE_MAGNITUDE || moveno == MOVE_BULLDOZE) {
                    damage /= 2;
                }
                break;
            case ELECTRIC_TERRAIN:
                if (IsPartyPokemonGrounded(sp, pp) && movetype == TYPE_ELECTRIC) {
                    damage = damage * 130 / 100;
                }
                break;
            case MISTY_TERRAIN:
                if (IsClientGrounded(sp, defender) && movetype == TYPE_DRAGON) {
                    damage /= 2;
                }
                break;
            case PSYCHIC_TERRAIN:
                if (IsPartyPokemonGrounded(sp, pp) && movetype == TYPE_PSYCHIC) {
                    damage = damage * 130 / 100;
                }
                break;
            default:
                break;
            }
        }
    }
    else if(usePPForDefender){
        if (sp->terrainOverlay.numberOfTurnsLeft > 0) {
            switch (sp->terrainOverlay.type)
            {
            case GRASSY_TERRAIN:
                if (IsClientGrounded(sp, attacker) && movetype == TYPE_GRASS) {
                    damage = damage * 130 / 100;
                }
                if (moveno == MOVE_EARTHQUAKE || moveno == MOVE_MAGNITUDE || moveno == MOVE_BULLDOZE) {
                    damage /= 2;
                }
                break;
            case ELECTRIC_TERRAIN:
                if (IsClientGrounded(sp, attacker) && movetype == TYPE_ELECTRIC) {
                    damage = damage * 130 / 100;
                }
                break;
            case MISTY_TERRAIN:
                if (IsPartyPokemonGrounded(sp, pp) && movetype == TYPE_DRAGON) {
                    damage /= 2;
                }
                break;
            case PSYCHIC_TERRAIN:
                if (IsClientGrounded(sp, attacker) && movetype == TYPE_PSYCHIC) {
                    damage = damage * 130 / 100;
                }
                break;
            default:
                break;
            }
        }
    }
    else{
        if (sp->terrainOverlay.numberOfTurnsLeft > 0) {
            switch (sp->terrainOverlay.type)
            {
            case GRASSY_TERRAIN:
                if (IsClientGrounded(sp, attacker) && movetype == TYPE_GRASS) {
                    damage = damage * 130 / 100;
                }
                if (moveno == MOVE_EARTHQUAKE || moveno == MOVE_MAGNITUDE || moveno == MOVE_BULLDOZE) {
                    damage /= 2;
                }
                break;
            case ELECTRIC_TERRAIN:
                if (IsClientGrounded(sp, attacker) && movetype == TYPE_ELECTRIC) {
                    damage = damage * 130 / 100;
                }
                break;
            case MISTY_TERRAIN:
                if (IsClientGrounded(sp, defender) && movetype == TYPE_DRAGON) {
                    damage /= 2;
                }
                break;
            case PSYCHIC_TERRAIN:
                if (IsClientGrounded(sp, attacker) && movetype == TYPE_PSYCHIC) {
                    damage = damage * 130 / 100;
                }
                break;
            default:
                break;
            }
        }
    }
    

    return damage + 2;
}
