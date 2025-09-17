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

BOOL TrainerAI_ShouldSwitch(struct BattleSystem *battleSys, int battler);

int TrainerAI_PickCommand(struct BattleSystem *battleSys, int battler)
{
    int i;
    u8 battler1, battler2;
    u32 battleType;
    int end;
    struct PartyPokemon *mon;
    struct BattleStruct *ctx = battleSys->sp;
    battleType = BattleTypeGet(battleSys);

    if (TrainerAI_ShouldSwitch(battleSys, battler))
    {
        if ((i = BattleAI_PostKOSwitchIn(battleSys, battler)) == 6) {
            battler1 = battler;
            if (battleType & BATTLE_TYPE_TAG
                || battleType & BATTLE_TYPE_MULTI) {
                battler2 = battler1;
            } else {
                battler2 = BATTLER_ALLY(battler);
            }
            end = Battle_GetClientPartySize(battleSys, battler);

            for (i = 0; i < end; i++) {


                mon = Battle_GetClientPartyMon(battleSys, battler, i);

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
        ctx->aiSwitchedPartySlot[battler] = i;
        return PLAYER_INPUT_PARTY;
    }
    return PLAYER_INPUT_FIGHT;
}

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
        }

        if (ctx->aiSwitchedPartySlot[attacker] != 6)
            return TRUE;

    }
    return FALSE;
}

 BOOL AI_PerishSongKO(struct BattleStruct *battleCtx, int battler)
 {
     if ((battleCtx->battlemon[battler].effect_of_moves & MOVE_EFFECT_FLAG_PERISH_SONG_ACTIVE)
         && battleCtx->battlemon[battler].moveeffect.perishSongTurns == 1) { //adjusted to 1 so the above mentioned bug is fixed.
         battleCtx->aiSwitchedPartySlot[battler] = 6;
         return TRUE;
     }

     return FALSE;
 }

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
                    if ((effectiveness & MOVE_STATUS_FLAG_SUPER_EFFECTIVE)) {
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
                    if (effectiveness == 0) {
                        //battleCtx->aiSwitchedPartySlot[battler] = i;
                        return TRUE;
                    }
                }
            }
        }
    }
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
