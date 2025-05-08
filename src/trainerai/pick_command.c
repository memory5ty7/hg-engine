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

u8 AI_CalcSpeed(void *bw, struct BattleStruct *sp, int client1, int client2, int flag, int client2IsPP, struct PartyPokemon *pp);
int AI_ServerDoTypeCalcMod(void *bw UNUSED, struct BattleStruct *sp, int move_no, int move_type, int attack_client, int defence_client, int damage, u32 *flag, BOOL usePPForAttacker, BOOL usePPForDefender, struct PartyPokemon *pp);


int TrainerAI_PickCommand(struct BattleSystem *bsys, int attacker)
{

    // must declare C89-style to match
    int i;
    u8 battler1, battler2;
    u32 battleType;
    int end;
    struct PartyPokemon *mon;
    struct BattleStruct *ctx = bsys->sp;
    battleType = BattleTypeGet(bsys);

    
    if ((battleType & BATTLE_TYPE_TRAINER) || BATTLER_IS_ENEMY(attacker) == 0) { //w
        if (TrainerAI_ShouldSwitch(bsys, attacker)) {
            // If this is a switch which should use the post-KO switch logic, then do so.
            // If there is no valid battler, pick the first one in party order.
            if (ctx->aiSwitchedPartySlot[attacker] == 6) {
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
            }

            return PLAYER_INPUT_PARTY;
        }

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
                        battleCtx->aiSwitchedPartySlot[battler] = i;
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
                        battleCtx->aiSwitchedPartySlot[battler] = i;
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
                        battleCtx->aiSwitchedPartySlot[battler] = i;
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
                        battleCtx->aiSwitchedPartySlot[battler] = i;
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
                 battleCtx->aiSwitchedPartySlot[battler] = i;
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
    // Must keep C89-style declaration to match
    int i, j;
    u8 defender, defenderType1, defenderType2;
    u8 monType1, monType2;
    u16 monSpecies;
    u16 move;
    int moveType;
    u8 battlersDisregarded;
    u8 score, maxScore; // BUG: Post-KO Switch-In AI Scoring Overflow (see docs/bugs_and_glitches.md)
    u8 picked = 6;
    u8 slot1, slot2;
    u32 moveStatusFlags;
    int partySize;
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

    // Stage 1: Loop through all the party slots and find the one with the most favorable
    // offensive type-matchup against the chosen defender which also has a super-effective
    // move against that defender. Choose the Pokemon with the highest such score, breaking
    // ties by party-order. If no such Pokemon exists, proceed to Stage 2.
    //
    // Mono-type Pokemon are regarded as being dual-type of the same type.
    while (battlersDisregarded != 0x3F) {
        maxScore = 0;
        picked = 6;

        for (i = 0; i < partySize; i++) {
            mon = Battle_GetClientPartyMon(battleSys, battler, i);
            monSpecies = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0);

            if (monSpecies != SPECIES_NONE
                && monSpecies != SPECIES_EGG
                && GetMonData(mon, MON_DATA_HP, 0)
                && (battlersDisregarded & No2Bit(i)) == FALSE
                && i != battleCtx->sel_mons_no[slot1]
                && i != battleCtx->sel_mons_no[slot2]
                && i != battleCtx->aiSwitchedPartySlot[slot1]
                && i != battleCtx->aiSwitchedPartySlot[slot2]) {

                defenderType1 = battleCtx->battlemon[defender].type1; 
                defenderType2 = battleCtx->battlemon[defender].type2; 
                monType1 = GetMonData(mon, MON_DATA_TYPE_1, 0);
                monType2 = GetMonData(mon, MON_DATA_TYPE_2, 0);

                score = TypeMatchupMultiplier(monType1, defenderType1, defenderType2);
                score += TypeMatchupMultiplier(monType2, defenderType1, defenderType2);

                if (maxScore < score) {
                    maxScore = score;
                    picked = i;
                }
            } else {
                battlersDisregarded |= No2Bit(i);
            }
        }

        if (picked != 6) {
            // Determine if this mon has any super-effective moves against the defender
            mon = Battle_GetClientPartyMon(battleSys, battler, i);

            for (j = 0; j < CLIENT_MAX; j++) {

                move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL); 
                moveType = battleCtx->moveTbl[move].effect; 

                if (move) {
                    moveStatusFlags = 0;

                    AITypeCalc(battleCtx, 
                        move, 
                        moveType, 
                        GetMonData(mon, MON_DATA_ABILITY, 0), 
                        battleCtx->battlemon[defender].ability, 
                        BattleItemDataGet(battleCtx,GetMonData(mon, MON_DATA_HELD_ITEM, 0), 1),
                        GetMonData(mon, MON_DATA_TYPE_1, 0),
                         GetMonData(mon, MON_DATA_TYPE_2, 0), 
                         &moveStatusFlags);

                    if (moveStatusFlags & MOVE_STATUS_FLAG_SUPER_EFFECTIVE) {
                        break;
                    }
                }
            }

            // If this mon has no moves which would be super-effective against the
            // defender, mark it as disregarded and move to the next in priority.
            if (i == CLIENT_MAX) {
                battlersDisregarded |= No2Bit(picked);
            } else {
                return picked;
            }
        } else {
            // No valid battlers to further-evaluate, break out
            battlersDisregarded = 0x3F;
        }
    }

    maxScore = 0;
    picked = 6;

    // Stage 2: Loop through all the party slots and score them by how much damage would be done
    // by the maximum non-critical roll of each of their moves if it were used by the battler
    // which just fainted. Choose the Pokemon with the highest such score, breaking ties by
    // party-order.


    for (i = 0; i < partySize; i++) {
        mon = Battle_GetClientPartyMon(battleSys, battler, i);
        monSpecies = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0);

        if (monSpecies != SPECIES_NONE
            && monSpecies != SPECIES_EGG
            && GetMonData(mon, MON_DATA_HP, 0)
            && (battlersDisregarded & No2Bit(i)) == FALSE
            && i != battleCtx->sel_mons_no[slot1]
            && i != battleCtx->sel_mons_no[slot2]
            && i != battleCtx->aiSwitchedPartySlot[slot1]
            && i != battleCtx->aiSwitchedPartySlot[slot2]) {
            for (j = 0; j < CLIENT_MAX; j++) {

                move = GetMonData(mon, MON_DATA_MOVE1 + j, NULL); 
                moveType = battleCtx->moveTbl[move].effect; 

                if (move && battleCtx->moveTbl[move].power != 1) {

                    score = CalcBaseDamage(battleSys, battleCtx, move, battleCtx->side_condition[BATTLER_IS_ENEMY(defender)],
                    battleCtx->field_condition, battleCtx->moveTbl[move].power, battleCtx->moveTbl[move].type, battler, defender, 0, 1, 0, mon);


                    moveStatusFlags = 0;

                    score = AI_ServerDoTypeCalcMod(battleSys, battleCtx, move, 0, battler, defender, score, &moveStatusFlags, 1, 0, mon);


                    if (moveStatusFlags & MOVE_STATUS_FLAG_NOT_EFFECTIVE) {
                        score = 0;
                    }
                }

                if (maxScore < score) {
                    maxScore = score;
                    picked = i;
                }
            }
        }
    }

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
    speed2 = sp->battlemon[client2].speed * StatBoostModifiers[stat_stage_spd2][0] / StatBoostModifiers[stat_stage_spd2][1];

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
     }
     else if(usePPForDefender){
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
