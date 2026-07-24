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
#include "../../include/custom/custom_ai.h"


enum AiTurnProcessing {
    Calculate = 0,
    Calced_Attacker1,
    Calced_Attacker2,
    Picked_Attacker1,
    Picked_Attacker2,
    Picked
};

struct PACKED AI_turnStateStore {
    u8 isDouble;
    u8 isSwitch;
    u8 switchPosition;
    u8 target[2];
};



BOOL TrainerAI_ShouldSwitch(struct BattleSystem *bsys, int attacker);

int TrainerAI_PickCommand(struct BattleSystem *bsys, int attacker)
{
    u32 battleType = BattleTypeGet(bsys);
    if (battleType == BATTLE_TYPE_TRAINER) {
        if (TrainerAI_ShouldSwitch(bsys, attacker)) {
            return PLAYER_INPUT_PARTY;
        }
    }

    return PLAYER_INPUT_FIGHT;
}



void LONG_CALL CalcTurnStateDamagesAndScores(struct BattleSystem *bsys, u32 attacker, u32 defender, struct AIContext *aiOp1, struct AIContext *aiOp2, struct AI_turnState *turnState)
{
    struct BattleStruct *ctx = bsys->sp;
    if (ctx->battlemon[defender].hp > 0) {
        SetupStateVariables(bsys, attacker, defender, aiOp1);
        for (u8 i = 0; i < 4; i++) {
            turnState->damages[defender][i] = aiOp1->attackerRolledMoveDamages[i];
        }
        turnState->highestScoredMove[attacker] = ScoreMovesAgainstDefender(bsys, attacker, defender, turnState->moveScores, aiOp1);
    }

    if (aiOp2->isDoubleBattle) {
        int highestScoredMoveAcross = 0;
        defender = BATTLER_ACROSS(attacker);
        if (ctx->battlemon[defender].hp > 0) {
            SetupStateVariables(bsys, attacker, defender, aiOp2);
            for (u8 i = 0; i < 4; i++) {
                turnState->damages[defender][i] = aiOp2->attackerRolledMoveDamages[i];
            }
            highestScoredMoveAcross = ScoreMovesAgainstDefender(bsys, attacker, defender, turnState->moveScores, aiOp2);
            if (highestScoredMoveAcross > turnState->highestScoredMove[attacker]) {
                turnState->highestScoredMove[attacker] = highestScoredMoveAcross;
            }
        }

        defender = BATTLER_ALLY(attacker);
        highestScoredMoveAcross = ScoreMovesAgainstAlly(bsys, attacker, defender, turnState->moveScores, aiOp1);
        if (highestScoredMoveAcross > turnState->highestScoredMove[attacker]) {
            turnState->highestScoredMove[attacker] = highestScoredMoveAcross;
        }

        if (aiOp1->playerCanOneShotMonWithAnyMove) {
            aiOp2->playerCanOneShotMonWithAnyMove = TRUE;
        }
        if (aiOp2->playerCanOneShotMonWithAnyMove) {
            aiOp1->playerCanOneShotMonWithAnyMove = TRUE;
        }
    }
}

BOOL TrainerAI_ShouldSwitch(struct BattleSystem *bsys, int attacker)
{
    return FALSE;
    debug_printf("TrainerAI_ShouldSwitch:\n");
    struct BattleStruct *ctx = bsys->sp;
    u32 battleType = BattleTypeGet(bsys);

    if (battleType & (BATTLE_TYPE_MULTI | BATTLE_TYPE_DOUBLE | BATTLE_TYPE_TAG)) {
        return FALSE;
    }

    if (CantEscape(bsys, ctx, attacker, NULL)) {
        return FALSE;
    }
    struct AI_turnState turnStateStruct = { 0 };
    struct AI_turnState *turnState = &turnStateStruct;

    struct AI_turnState turnStateStructAlly = { 0 };
    struct AI_turnState *turnStateAlly = &turnStateStructAlly;

    struct AIContext aiContextOp1 = { 0 };
    struct AIContext aiContextOp2 = { 0 };
    struct AIContext *ai1 = &aiContextOp1;
    struct AIContext *ai2 = &aiContextOp2;


    struct AIContext aiAllyOp1 = { 0 };
    struct AIContext aiAllyOp2 = { 0 };
    struct AIContext *aiAlly1 = &aiAllyOp1;
    struct AIContext *aiAlly2 = &aiAllyOp2;

    //if (slot == first) //attacker = 1 else attacker = 3

    if (attacker == 1 || attacker == 3) {
    } else {

    }


    u32 defender = BATTLER_OPPONENT(attacker);
    CalcTurnStateDamagesAndScores(bsys, attacker, defender, ai1, ai2, turnState);

    
    if (ai1->isDoubleBattle && ai1->isAllyAlive) {
        attacker = BATTLER_ALLY(attacker);
        defender = BATTLER_OPPONENT(attacker);
        CalcTurnStateDamagesAndScores(bsys, attacker, defender, aiAlly1, aiAlly2, turnStateAlly);

        if (aiContextOp1.attackerMon.speed > aiContextOp1.aimonAlly.speed)
        {
            if (aiContextOp1.monCanOneShotPlayerWithAnyMove && aiContextOp1.aiMovesFirst)
            {
                //calc ally again, ignore fast ko mon
            }
        }
        else
        {
            if (aiAllyOp1.monCanOneShotPlayerWithAnyMove && aiAllyOp1.aiMovesFirst)
            {
                // calc ally again, ignore fast ko mon
            }
        }

    }

    /*
    setup AiContext for attacker
    calc scores

    if singles
        calc postKo score
        decide if switching/attacking

    if double
        setup AiContext for attacker2
        calc scores

    consolidate targets and divert if necessary
    choose moves

    store in bsys->sp
    set bsys->sp state to skip calc
    */

    return FALSE;
}