#include "../../include/types.h"
#include "../../include/config.h"
#include "../../include/battle.h"
#include "../../include/mega.h"
#include "../../include/pokemon.h"
#include "../../include/trainer_ai.h"
#include "../../include/constants/ability.h"
#include "../../include/constants/move_effects.h"
#include "../../include/constants/species.h"
#include "../../include/constants/battle_script_constants.h"
#include "../../include/constants/battle_message_constants.h"
#include "../../include/constants/item.h"
#include "../../include/item.h"

int LONG_CALL CalcBaseDamage(void *bw, struct BattleStruct *sp, int moveno, u32 side_cond,
                   u32 field_cond, u16 pow, u8 type, u8 attacker, u8 defender, u8 critical);

typedef struct {
    /*Field/Pokemon state relavent variables*/
    BOOL defenderImmuneToPoison;
    BOOL defenderImmuneToParalysis;
    BOOL defenderImmuneToBurn;
    BOOL defenderImmuneToSleep;
    BOOL attackerKnowsPsychUp;
    BOOL attackerHasSupereffectiveMove;
    BOOL defenderHasHazards;
    BOOL trickRoomActive;
    BOOL hasStatChange;
    BOOL attackerHasDamagingMove;
    BOOL defenderHasBadItem;
    u8 attackerMovesFirst;
    u8 defenderMovesFirst;
    u8 isSpeedTie;
    u32 flingPower;
    u32 attackerMoveEffectiveness;
    int chosenTarget;
    int attacker;
    int defender;
    int defenderSide;
    int attackerSide;
    int attackerAbility;
    int attackerLevel;
    int defenderAbility;
    int attackerItem;
    int defenderItem;
    int holdEffect;
    int defenderType1;
    int defenderType2;
    int attackerType1;
    int attackerType2;
    int attackerHP;
    int attackerMaxHP;
    int attackerPercentHP;
    int defenderHP;
    int defenderMaxHP;
    int defenderPercentHP;
    int attackerSpeed;
    int defenderSpeed;
    int partySizeAttacker;
    int livingMembersAttacker;
    int partySizeDefender;
    int livingMembersDefender;
    int damagedMonsDefender;
    int statusedMonsAttacker;
    int attackerMovesKnown;
    int attackerPartyIndex;
    int defenderLastUsedMove;
    int defenderLastUsedMoveEffect;
    int defenderTurnsOnField;
    int attackerTurnsOnField;
    int differenceInAttackStages;
    int differenceInSpAtkStages;
    int differenceInDefenseStages;
    int differenceInSpDefStages;
    int maxDamageReceived;

    /*Specific to multi/double/tag battles*/
    int partner;
    int partnerHP;
    int partnerPercentHP;
    int partnerAbility;
    int partnerItem;

    /*Move-relevant variables*/
    int attackerMove;
    int attackerMoveEffect;
    int attackerMoveType;
    int attackerMovePPRemaining;
    int attackerMinRollMoveDamages[4];
    int attackerMaxDamageOutputMinRoll;
    int attackerMoveRange;
    int attackerMoveEffectChance;

    int attackerMaxRollMoveDamages[4];
    int attackerRandomRollMoveDamages[4];

    int turnsToKill;
    int turnsToGetKilled;

    BOOL defenderHasPhysicalMove;
    BOOL defenderHasSpecialMove;
} AIContext;

typedef struct {
    u32 flag;
    int (*evaluator)(struct BattleSystem *bsys, u32 attacker, int moveIndex, AIContext *ai);
} MoveEvaluator;

/*Flag functions return a move score, given the index of the current move*/
int BasicAI(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai);
int BasicImmunity(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai);
int BasicDamage(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai);
int BasicStatus(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai);

/*Helper Functions*/
int AttackerMonWithHighestDamage(struct BattleSystem *bsys, u32 attacker, AIContext *ai);
int BattlerPositiveStatChangesSum(struct BattleSystem *bsys, u32 battler, AIContext *ai);
BOOL BattlerHasStatBoostGreater(struct BattleSystem *bsys, u32 battler, u32 boost_amount, AIContext *ai);
BOOL BattlerHasStatBoostLesser(struct BattleSystem *bsys, u32 battler, u32 drop_amount, AIContext *ai);
BOOL BattlerKnowsMove(struct BattleSystem *bsys, u32 battler, u32 move);
BOOL BattlerHasMoveSplit(struct BattleSystem *bsys, u32 battler, u32 move_split, AIContext *ai);
BOOL BattlerHasMoveEffect(struct BattleSystem *bsys, u32 battler, u32 move_effect, AIContext *ai);
BOOL BattlerHasTypeDamagingMove (struct BattleSystem *bsys, u32 battler, u32 type, AIContext *ai);
BOOL ItemIsBadToTrade(u32 item, AIContext *ai);
BOOL ItemIsDisruptive(u32 item, AIContext *ai);
BOOL IsDesirableAbility(u32 ability);
BOOL LONG_CALL DropsStatsAsStatus(u32 moveEffect);
BOOL LONG_CALL IsInMirrorMoveList(u32 moveEffect);
BOOL LONG_CALL IsInList(u32 moveEffect, const u16 StatList[], u16 ListLength);
BOOL LONG_CALL BattlerKnowsMoveInList(struct BattleSystem *bsys, u32 battler, const u16 MoveList[], u16 listLength, AIContext *ai);
BOOL LONG_CALL BattlerMovesFirstDoubles(struct BattleSystem *bsys, struct BattleStruct *ctx, int mainBattler, int flag, AIContext *ai);
BOOL LONG_CALL MoveIsStrongest(struct BattleSystem *bsys, struct BattleStruct *ctx, int moveIndex, AIContext *ai);
void SetupStateVariables(struct BattleSystem *bsys, u32 attacker, u32 defender, AIContext *ai);
int AdjustUnusualMoveDamage(struct BattleSystem *bsys, u32 attacker, u32 defender, int damage, int move, AIContext *ai);
int AdjustUnusualMovePower(struct BattleSystem *bsys, u32 attacker, u32 defender, int moveEffect, AIContext *ai);
u32 LONG_CALL MaskOfFlagNo(int flagno);

int BasicOffensiveSetup(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai);
int BasicDefensiveSetup(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai);

enum AIActionChoice __attribute__((section (".init"))) TrainerAI_Main(struct BattleSystem *bsys, u32 battler)
{
    struct BattleStruct *ctx = bsys->sp;
    AIContext aictx = {0};
    AIContext *ai = &aictx;
    enum AIActionChoice result = AI_ENEMY_ATTACK_1, highest_damage_something = 0;
    u8 buf[64];

    /*
    if(ctx->battlemon[attacker].hp == 0){//if pokemon is dead, dont do anything -- this is necessary for doubles.
        return -1;
    }*/
    int highest_move_score = 0;
    u32 moveScores[4][4];
    for (int i = 0; i < 4; i++) {           //don't want to get negative (unsigned ints) numbers, so start high at 100
        for (int j = 0; j < 4; j++) {
            moveScores[i][j] = 100;
        }
    } 
    int max_scores[4] = {0};                //highest score over all of the 4 moves the attacker has, measured against each mon on the field (self is always 0)
    int num_defender_ties = 0;
    int defender_tie_indices[4] = {0};
    int num_move_score_ties = 0;
    int move_tie_indices[4] = {0};
    int target = 0;
    u32 defender = BATTLER_OPPONENT(battler);   //default for singles -- updated in the doubles section

    SetupStateVariables(bsys, battler, defender, ai);

    /*Main loop over moves and select the best one*/
    for (int i = 0; i < 4; i++)
    {   
        /*Move-relevant variables*/
        ai->attackerMove = ctx->battlemon[ai->attacker].move[i];
        ai->attackerMoveEffect = ctx->moveTbl[ai->attackerMove].effect;
        ai->attackerMoveEffectChance = ctx->moveTbl[ai->attackerMove].secondaryEffectChance;
        ai->attackerMoveRange = ctx->moveTbl[ai->attackerMove].target;
        ai->attackerMoveEffectiveness = 0;       
        ai->attackerMoveType = ctx->moveTbl[ai->attackerMove].type;
        ai->attackerMovePPRemaining = ctx->battlemon[ai->attacker].pp[i];
        AITypeCalc(ctx, ai->attackerMove, ai->attackerMoveType, ai->attackerAbility, ai->defenderAbility, ai->holdEffect, ai->defenderType1, ai->defenderType2, & ai->attackerMoveEffectiveness);

        moveScores[target][i] += BasicAI(bsys, ai->attacker, i, ai);

        sprintf(buf, "Move: %d, Score: %d (Random Roll : %d/%d)\n", i + 1, moveScores[target][i] - 100, ai->attackerRandomRollMoveDamages[i], ai->defenderMaxHP);
        debugsyscall(buf);
    }
    ctx->aiWorkTable.ai_dir_select_client[ai->attacker] = target;                   //target is always 0 in single battles (the player)

    sprintf(buf,"--------------------\n");
    debugsyscall(buf);

    for(int i = 0; i < 4; i++){
        if(moveScores[target][i] > moveScores[target][result]){
            result = i;
        }
    }

    highest_move_score = moveScores[target][result];
    int j_tie_index = 0;

    for (int moveno = 0; moveno < 4; moveno++){                                         //check for ties
        if(moveScores[target][moveno] == highest_move_score){
            num_move_score_ties++;
            move_tie_indices[j_tie_index] = moveno;
            j_tie_index++;
        }
    }
    result  = move_tie_indices[BattleRand(bsys) % num_move_score_ties];             //randomly pick a move among the tie
    return result;
}

/*Lists of effects, moves, etc...*/
const u16 DropStatList[] = {
    MOVE_EFFECT_ATK_DOWN,
    MOVE_EFFECT_ATK_DOWN_2,
    MOVE_EFFECT_ATK_DOWN_3,
    MOVE_EFFECT_DEF_DOWN,
    MOVE_EFFECT_DEF_DOWN_2,
    MOVE_EFFECT_DEF_DOWN_3,
    MOVE_EFFECT_SPEED_DOWN,
    MOVE_EFFECT_SPEED_DOWN_2,
    MOVE_EFFECT_SPEED_DOWN_3,
    MOVE_EFFECT_SP_ATK_DOWN,
    MOVE_EFFECT_SP_ATK_DOWN_2,
    MOVE_EFFECT_SP_ATK_DOWN_3,
    MOVE_EFFECT_SP_ATK_DOWN_2_OPPOSITE_GENDER,
    MOVE_EFFECT_SP_DEF_DOWN,
    MOVE_EFFECT_SP_DEF_DOWN_2,
    MOVE_EFFECT_SP_DEF_DOWN_3,
    MOVE_EFFECT_FAINT_AND_ATK_SP_ATK_DOWN_2,
    MOVE_EFFECT_ATK_SP_ATK_DOWN,
    MOVE_EFFECT_VENOM_DRENCH,
    MOVE_EFFECT_ATK_DEF_DOWN,
    MOVE_EFFECT_EVA_DOWN,
    MOVE_EFFECT_EVA_DOWN_2,
    MOVE_EFFECT_EVA_DOWN_3,
    MOVE_EFFECT_ACC_DOWN,
    MOVE_EFFECT_ACC_DOWN_2,
    MOVE_EFFECT_ACC_DOWN_3
};

const u16 RaiseStatList[] = {
    MOVE_EFFECT_ATK_UP,
    MOVE_EFFECT_ATK_UP_2,
    MOVE_EFFECT_ATK_UP_3,
    MOVE_EFFECT_DEF_UP,
    MOVE_EFFECT_DEF_UP_2,
    MOVE_EFFECT_DEF_UP_3,
    MOVE_EFFECT_SPEED_UP,
    MOVE_EFFECT_SPEED_UP_2,
    MOVE_EFFECT_SPEED_UP_3,
    MOVE_EFFECT_SP_ATK_UP,
    MOVE_EFFECT_SP_ATK_UP_2,
    MOVE_EFFECT_SP_ATK_UP_3,
    MOVE_EFFECT_SP_DEF_UP,
    MOVE_EFFECT_SP_DEF_UP_2,
    MOVE_EFFECT_SP_DEF_UP_3,
    MOVE_EFFECT_ACC_UP,
    MOVE_EFFECT_ACC_UP_2,
    MOVE_EFFECT_ACC_UP_3,
    MOVE_EFFECT_EVA_UP,
    MOVE_EFFECT_EVA_UP_2,
    MOVE_EFFECT_EVA_UP_2_MINIMIZE,
    MOVE_EFFECT_EVA_UP_3,
    MOVE_EFFECT_ATK_SPEED_UP,
    MOVE_EFFECT_ATK_SP_ATK_UP,
    MOVE_EFFECT_DEF_UP_DOUBLE_ROLLOUT_POWER,
    MOVE_EFFECT_DEF_SP_DEF_UP,
    MOVE_EFFECT_SP_ATK_SP_DEF_UP

};
/*Stat increases*/
const u16 AttackRaiseList[] = {
    MOVE_EFFECT_ATK_UP,
    MOVE_EFFECT_ATK_UP_2,
    MOVE_EFFECT_ATK_UP_3,
    MOVE_EFFECT_ATK_SPEED_UP, //dragon dance
    //MOVE_EFFECT_MAX_ATK_LOSE_HALF_MAX_HP, //belly drum
    MOVE_EFFECT_RAISE_ALL_STATS_LOSE_THIRD_MAX_HP, //clangorous soul
    MOVE_EFFECT_ATK_DEF_ACC_UP,
    MOVE_EFFECT_SP_ATK_UP, //growth
    MOVE_EFFECT_ATK_SP_ATK_UP, //work up
    MOVE_EFFECT_ATK_ACC_UP, //hone claws
    MOVE_EFFECT_RAISE_ATTACK_HIT, //powerup punch
    MOVE_EFFECT_SPEED_UP_2_ATK_UP, //shift gear
    MOVE_EFFECT_ATK_SP_ATK_SPEED_UP_2_DEF_SP_DEF_DOWN, //shell smash
    MOVE_EFFECT_TIDY_UP, //tidy up is basically ddance
    MOVE_EFFECT_ATK_DEF_SPEED_UP, //victory dance
    MOVE_EFFECT_ATK_DEF_ACC_UP, //coil
};

const u16 DefenseRaiseList[] = {
    MOVE_EFFECT_DEF_UP,
    MOVE_EFFECT_DEF_UP_2,
    MOVE_EFFECT_DEF_UP_3,
    MOVE_EFFECT_DEF_UP_DOUBLE_ROLLOUT_POWER,
    MOVE_EFFECT_DEF_SP_DEF_UP,
};

const u16 SpAtkRaiseList[] = {
    MOVE_EFFECT_SP_ATK_UP,
    MOVE_EFFECT_SP_ATK_UP_2,
    MOVE_EFFECT_SP_ATK_UP_3,
    MOVE_EFFECT_ATK_SP_ATK_UP,  //work up
    MOVE_EFFECT_SP_ATK_SP_DEF_UP, //calm mind
    //MOVE_EFFECT_ATK_SP_ATK_SPEED_UP_2_LOSE_HALF_MAX_HP, //fillet away
    MOVE_EFFECT_RAISE_SP_ATK_HIT, //mystical power, torch song
    MOVE_EFFECT_ATK_SP_ATK_SPEED_UP_2_DEF_SP_DEF_DOWN,
    MOVE_EFFECT_SP_ATK_SP_DEF_SPEED_UP, //quiver dance
    MOVE_EFFECT_TAKE_HEART,
};

const u16 SpDefRaiseList[] = {
    MOVE_EFFECT_SP_DEF_UP,
    MOVE_EFFECT_SP_DEF_UP_2,
    MOVE_EFFECT_SP_DEF_UP_3,
    MOVE_EFFECT_SP_ATK_SP_DEF_UP
};

const u16 SpeedRaiseList[] = {
    MOVE_EFFECT_SPEED_UP,
    MOVE_EFFECT_SPEED_UP_2,
    MOVE_EFFECT_SPEED_UP_3, //dragon dance is intentionally excluded
};

const u16 AccRaiseList[] = {
    MOVE_EFFECT_ACC_UP,
    MOVE_EFFECT_ACC_UP_2,
    MOVE_EFFECT_ACC_UP_3
};
const u16 EvaRaiseList[] = {
    MOVE_EFFECT_EVA_UP,
    MOVE_EFFECT_EVA_UP_2,
    MOVE_EFFECT_EVA_UP_2_MINIMIZE,
    MOVE_EFFECT_EVA_UP_3
};

/*Stat decreases*/
const u16 AttackDropList[] = {
    MOVE_EFFECT_ATK_DOWN,
    MOVE_EFFECT_ATK_DOWN_2,
    MOVE_EFFECT_ATK_DOWN_3,
    MOVE_EFFECT_ATK_SP_ATK_DOWN,
    MOVE_EFFECT_ATK_DEF_DOWN,
    //MOVE_EFFECT_FAINT_AND_ATK_SP_ATK_DOWN_2,
    //MOVE_EFFECT_VENOM_DRENCH
};

const u16 DefenseDropList[] = {
    MOVE_EFFECT_DEF_DOWN,
    MOVE_EFFECT_DEF_DOWN_2,
    MOVE_EFFECT_DEF_DOWN_3,
    MOVE_EFFECT_ATK_DEF_DOWN
};

const u16 SpAtkDropList[] = {
    MOVE_EFFECT_SP_ATK_DOWN,
    MOVE_EFFECT_SP_ATK_DOWN_2,
    MOVE_EFFECT_SP_ATK_DOWN_3,
    //MOVE_EFFECT_FAINT_AND_ATK_SP_ATK_DOWN_2,
    MOVE_EFFECT_SP_ATK_DOWN_2_OPPOSITE_GENDER,
    MOVE_EFFECT_ATK_SP_ATK_DOWN,
    //MOVE_EFFECT_VENOM_DRENCH
};

const u16 SpDefDropList[] = {
    MOVE_EFFECT_SP_DEF_DOWN,
    MOVE_EFFECT_SP_DEF_DOWN_2,
    MOVE_EFFECT_SP_DEF_DOWN_3
};

const u16 SpeedDropList[] = {
    MOVE_EFFECT_SPEED_DOWN,
    MOVE_EFFECT_SPEED_DOWN_2,
    MOVE_EFFECT_SPEED_DOWN_3,
    MOVE_EFFECT_VENOM_DRENCH
};

const u16 AccDropList[] = {
    MOVE_EFFECT_ACC_DOWN,
    MOVE_EFFECT_ACC_DOWN_2,
    MOVE_EFFECT_ACC_DOWN_3
};

const u16 EvaDropList[] = {
    MOVE_EFFECT_EVA_DOWN,
    MOVE_EFFECT_EVA_DOWN_2,
    MOVE_EFFECT_EVA_DOWN_3
};  

/*Other Lists*/
const u16 MirrorMoveEffectList[] ={
    MOVE_EFFECT_STATUS_SLEEP,
    MOVE_EFFECT_ACC_DOWN,
    MOVE_EFFECT_ONE_HIT_KO,
    MOVE_EFFECT_STATUS_BADLY_POISON,
    MOVE_EFFECT_HIGH_CRITICAL,
    MOVE_EFFECT_STATUS_CONFUSE,
    MOVE_EFFECT_DEF_DOWN_2,
    MOVE_EFFECT_SPEED_DOWN_2,
    MOVE_EFFECT_SP_DEF_DOWN_2,
    MOVE_EFFECT_STATUS_PARALYZE,
    MOVE_EFFECT_STATUS_POISON,
    MOVE_EFFECT_CONFUSE_HIT,
    MOVE_EFFECT_ONE_HIT_KO,
    MOVE_EFFECT_STEAL_HELD_ITEM,
    MOVE_EFFECT_INFATUATE,
    MOVE_EFFECT_ATK_UP_2_STATUS_CONFUSION,
    MOVE_EFFECT_TORMENT,
    MOVE_EFFECT_SP_ATK_UP_CAUSE_CONFUSION,
    MOVE_EFFECT_SWITCH_HELD_ITEMS,
    MOVE_EFFECT_USER_ATK_DEF_DOWN_HIT,
    MOVE_EFFECT_SWITCH_ABILITIES,
    MOVE_EFFECT_TRANSFER_STATUS,
    MOVE_EFFECT_SWAP_ATK_SP_ATK_STAT_CHANGES,
    MOVE_EFFECT_SWAP_DEF_SP_DEF_STAT_CHANGES,
    MOVE_EFFECT_HIT_FIRST_IF_TARGET_ATTACKING,
    MOVE_EFFECT_PRIORITY_1,
    MOVE_EFFECT_SWAP_STAT_CHANGES,
    MOVE_EFFECT_SP_ATK_DOWN_2_OPPOSITE_GENDER
};

const u16 SetupFirstTurnList[] = {
    MOVE_EFFECT_CONVERSION,
    MOVE_EFFECT_SET_REFLECT,
    MOVE_EFFECT_SET_LIGHT_SCREEN,
    MOVE_EFFECT_STATUS_PARALYZE,
    MOVE_EFFECT_STATUS_POISON,
    MOVE_EFFECT_STATUS_BADLY_POISON,
    MOVE_EFFECT_STATUS_BURN,
    MOVE_EFFECT_STATUS_SLEEP,
    MOVE_EFFECT_STATUS_CONFUSE,
    MOVE_EFFECT_ATK_UP_2_STATUS_CONFUSION,
    MOVE_EFFECT_SP_ATK_UP_CAUSE_CONFUSION,
    MOVE_EFFECT_STATUS_LEECH_SEED,
    MOVE_EFFECT_SET_SUBSTITUTE,
    MOVE_EFFECT_EVA_UP_2_MINIMIZE,
    MOVE_EFFECT_TORMENT,
    MOVE_EFFECT_GROUND_TRAP_USER_CONTINUOUS_HEAL,
    MOVE_EFFECT_MAKE_SHARED_MOVES_UNUSEABLE,
    MOVE_EFFECT_DOUBLE_SPEED_3_TURNS,
    MOVE_EFFECT_PREVENT_CRITS,
    MOVE_EFFECT_GIVE_GROUND_IMMUNITY,
    MOVE_EFFECT_REMOVE_HAZARDS_SCREENS_EVA_DOWN,
    MOVE_EFFECT_WHIRLPOOL,
    MOVE_EFFECT_BIND_HIT
};

const u16 RiskyFlagList[] = {
    MOVE_EFFECT_STATUS_SLEEP,
    MOVE_EFFECT_HALVE_DEFENSE,
    MOVE_EFFECT_COPY_MOVE,
    MOVE_EFFECT_ONE_HIT_KO,
    MOVE_EFFECT_HIGH_CRITICAL,
    MOVE_EFFECT_HIGH_CRITICAL_POISON_HIT,
    MOVE_EFFECT_SLEEP_POISON_PARALYZE_HIT,
    MOVE_EFFECT_HIGH_CRITICAL_RAISE_SPEED_HIT,
    MOVE_EFFECT_HIGH_CRITICAL_POISON_HIT,
    MOVE_EFFECT_CALL_RANDOM_MOVE,
    MOVE_EFFECT_RANDOM_DAMAGE_1_TO_150_LEVEL,
    MOVE_EFFECT_COUNTER,
    MOVE_EFFECT_MIRROR_COAT,
    MOVE_EFFECT_METAL_BURST,
    MOVE_EFFECT_KO_MON_THAT_DEFEATED_USER,
    MOVE_EFFECT_ATK_UP_2_STATUS_CONFUSION,
    MOVE_EFFECT_INFATUATE,
    MOVE_EFFECT_RANDOM_POWER_MAYBE_HEAL,
    MOVE_EFFECT_RAISE_ALL_STATS_HIT,
    MOVE_EFFECT_MAX_ATK_LOSE_HALF_MAX_HP,
    MOVE_EFFECT_HIT_LAST_WHIFF_IF_HIT,
    MOVE_EFFECT_RANDOM_STAT_UP_2,
    MOVE_EFFECT_DOUBLE_POWER_IF_HIT,
    MOVE_EFFECT_USE_MOVE_FIRST,
    MOVE_EFFECT_HIT_FIRST_IF_TARGET_ATTACKING
};


const u16 PrioritizeDamageFlagList[] = {
    MOVE_EFFECT_HALVE_DEFENSE,
    MOVE_EFFECT_RECOVER_DAMAGE_SLEEP,
    MOVE_EFFECT_CHARGE_TURN_HIGH_CRIT,
    MOVE_EFFECT_CHARGE_TURN_DEF_UP,
    MOVE_EFFECT_CHARGE_TURN_HIGH_CRIT_FLINCH,
    MOVE_EFFECT_CHARGE_TURN_SUN_SKIPS,
    MOVE_EFFECT_CHARGE_TURN_SP_ATK_UP,
    MOVE_EFFECT_CHARGE_TURN_SP_ATK_UP_RAIN_SKIPS,
    MOVE_EFFECT_RECHARGE_AFTER,
    MOVE_EFFECT_SPIT_UP,
    MOVE_EFFECT_HIT_LAST_WHIFF_IF_HIT,
    MOVE_EFFECT_USER_ATK_DEF_DOWN_HIT,
    MOVE_EFFECT_INCREASE_POWER_WITH_LESS_HP,
    MOVE_EFFECT_HIT_FIRST_IF_TARGET_ATTACKING,
    MOVE_EFFECT_RECOIL_HALF,
    MOVE_EFFECT_RANDOM_TYPE_BASED_ON_IVS,
    MOVE_EFFECT_POWER_BASED_ON_LOW_SPEED,
    MOVE_EFFECT_NATURAL_GIFT,
    MOVE_EFFECT_JUDGMENT,
    MOVE_EFFECT_POWER_BASED_ON_FRIENDSHIP,
    MOVE_EFFECT_POWER_BASED_ON_LOW_FRIENDSHIP,
    MOVE_EFFECT_INCREASE_POWER_WITH_WEIGHT,
    MOVE_EFFECT_RANDOM_DAMAGE_1_TO_150_LEVEL,
    MOVE_EFFECT_LEVEL_DAMAGE_FLAT,
    MOVE_EFFECT_40_DAMAGE_FLAT,
    MOVE_EFFECT_10_DAMAGE_FLAT
};

const u16 BatonPassFlagList[] = {
    MOVE_EFFECT_ATK_UP_2,
    MOVE_EFFECT_ATK_SPEED_UP,
    MOVE_EFFECT_SP_ATK_SP_DEF_UP,
    MOVE_EFFECT_SP_ATK_UP_2
};

const u16 HarassmentFlagList[] = {//also included in harassment flag are all statdrop list moves
    MOVE_EFFECT_STATUS_PARALYZE,
    MOVE_EFFECT_STATUS_POISON,
    MOVE_EFFECT_STATUS_BADLY_POISON,
    MOVE_EFFECT_STATUS_BURN,
    MOVE_EFFECT_STATUS_SLEEP,
    MOVE_EFFECT_STATUS_CONFUSE,
    MOVE_EFFECT_ATK_UP_2_STATUS_CONFUSION,
    MOVE_EFFECT_SP_ATK_UP_CAUSE_CONFUSION,
    MOVE_EFFECT_INFATUATE,
    MOVE_EFFECT_STATUS_LEECH_SEED,
    MOVE_EFFECT_ENCORE,
    MOVE_EFFECT_DECREASE_LAST_MOVE_PP,
    MOVE_EFFECT_SET_SPIKES,
    MOVE_EFFECT_TORMENT,
    MOVE_EFFECT_NATURE_POWER,
    MOVE_EFFECT_REMOVE_HELD_ITEM,
    MOVE_EFFECT_MAKE_SHARED_MOVES_UNUSEABLE,
    MOVE_EFFECT_SECRET_POWER,
    MOVE_EFFECT_ATK_DEF_DOWN,
    MOVE_EFFECT_CAMOUFLAGE,
    MOVE_EFFECT_PREVENT_ITEM_USE,
    MOVE_EFFECT_TRANSFER_STATUS,
    MOVE_EFFECT_TOXIC_SPIKES,
    MOVE_EFFECT_REMOVE_HAZARDS_SCREENS_EVA_DOWN,
    MOVE_EFFECT_SP_ATK_DOWN_2_OPPOSITE_GENDER
};

const u16 CheckHPFlagList_1[] = {
    MOVE_EFFECT_RESTORE_HALF_HP,
    MOVE_EFFECT_HEAL_HALF_DIFFERENT_IN_WEATHER,
    MOVE_EFFECT_KO_MON_THAT_DEFEATED_USER,
    MOVE_EFFECT_INCREASE_POWER_WITH_LESS_HP,
    MOVE_EFFECT_FAINT_AND_ATK_SP_ATK_DOWN_2,
    MOVE_EFFECT_FAINT_AND_FULL_HEAL_NEXT_MON,
    MOVE_EFFECT_REMOVE_ALL_PP_ON_DEFEAT
};

const u16 CheckHPFlagList_2[] = {
    MOVE_EFFECT_CRIT_UP_2,
    MOVE_EFFECT_BIDE,
    MOVE_EFFECT_CONVERSION,
    MOVE_EFFECT_CONVERSION2,
    MOVE_EFFECT_SET_LIGHT_SCREEN,
    MOVE_EFFECT_SET_REFLECT,
    MOVE_EFFECT_PREVENT_STAT_REDUCTION,
    MOVE_EFFECT_PREVENT_STATUS,
    MOVE_EFFECT_MAX_ATK_LOSE_HALF_MAX_HP
};

const u16 CheckHPFlagList_3[] = {
    MOVE_EFFECT_PREVENT_CRITS,
    MOVE_EFFECT_SWAP_ATK_SP_ATK_STAT_CHANGES,
    MOVE_EFFECT_SWAP_DEF_SP_DEF_STAT_CHANGES,
};

const u16 CheckHPFlagList_4[] = {
    MOVE_EFFECT_RAISE_ATK_WHEN_HIT,
    MOVE_EFFECT_NEXT_ATTACK_ALWAYS_HITS,
    MOVE_EFFECT_COPY_STAT_CHANGES,
    MOVE_EFFECT_MIRROR_COAT,
    MOVE_EFFECT_METAL_BURST,
    MOVE_EFFECT_DECREASE_POWER_WITH_LESS_USER_HP,
    MOVE_EFFECT_HALVE_ELECTRIC_DAMAGE,
    MOVE_EFFECT_HALVE_FIRE_DAMAGE,
    MOVE_EFFECT_RANDOM_STAT_UP_2
};

const u16 CheckHPFlagList_5[] = {
    MOVE_EFFECT_STATUS_POISON,
    MOVE_EFFECT_PREVENT_STAT_REDUCTION,
    MOVE_EFFECT_AVERAGE_HP,
    MOVE_EFFECT_PREVENT_STATUS,
    MOVE_EFFECT_RANDOM_STAT_UP_2,
    MOVE_EFFECT_INCREASE_POWER_WITH_MORE_HP,
    MOVE_EFFECT_ALL_FAINT_3_TURNS
};

const u16 CheckHPFlagList_6[] = {
    MOVE_EFFECT_STATUS_PARALYZE,
    MOVE_EFFECT_STATUS_POISON,
    MOVE_EFFECT_STATUS_BADLY_POISON,
    MOVE_EFFECT_STATUS_BURN,
    MOVE_EFFECT_STATUS_SLEEP,
    MOVE_EFFECT_STATUS_CONFUSE,
    MOVE_EFFECT_ATK_UP_2_STATUS_CONFUSION,
    MOVE_EFFECT_SP_ATK_UP_CAUSE_CONFUSION,
    MOVE_EFFECT_BIDE,
    MOVE_EFFECT_CONVERSION,
    MOVE_EFFECT_CONVERSION2,
    MOVE_EFFECT_SET_LIGHT_SCREEN,
    MOVE_EFFECT_SET_REFLECT,
    MOVE_EFFECT_ONE_HIT_KO,
    MOVE_EFFECT_HALVE_HP,
    MOVE_EFFECT_NEXT_ATTACK_ALWAYS_HITS,
    MOVE_EFFECT_DECREASE_LAST_MOVE_PP,
    MOVE_EFFECT_DOUBLE_POWER_EACH_TURN_LOCK_INTO,
    MOVE_EFFECT_COPY_STAT_CHANGES,
    MOVE_EFFECT_MIRROR_COAT,
    MOVE_EFFECT_COUNTER,
    MOVE_EFFECT_HALVE_DEFENSE
};

const u16 TagStrategyFlagList_SkillSwap[] = {
    MOVE_FIRE_BLAST,
    MOVE_THUNDER,
    MOVE_CROSS_CHOP,
    MOVE_HYDRO_PUMP,
    MOVE_DYNAMIC_PUNCH,
    MOVE_BLIZZARD,
    MOVE_ZAP_CANNON,
    MOVE_MEGAHORN,
    MOVE_FOCUS_BLAST,
    MOVE_GUNK_SHOT,
    MOVE_MAGMA_STORM,
    MOVE_POWER_WHIP,
    MOVE_SEED_FLARE,
    MOVE_HEAD_SMASH
};

const u16 MovesEffectsWithFlatDamageOrOHKO[] = {
    MOVE_EFFECT_ONE_HIT_KO,
    MOVE_EFFECT_METAL_BURST,
    MOVE_EFFECT_COUNTER,
    MOVE_EFFECT_BIDE,
    MOVE_EFFECT_40_DAMAGE_FLAT,
    MOVE_EFFECT_SET_HP_EQUAL_TO_USER,
    MOVE_EFFECT_HALVE_HP,
    MOVE_EFFECT_MIRROR_COAT,
    MOVE_EFFECT_LEVEL_DAMAGE_FLAT,
    MOVE_EFFECT_10_DAMAGE_FLAT
};

const u16 SetupAttackEffectsList[] = {
    
};

int BasicAI (struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai){
    int moveScore = 0;
    struct BattleStruct *ctx = bsys->sp;

    moveScore += BasicImmunity(bsys, attacker, i, ai);

    if(ctx->moveTbl[ai->attackerMove].split == SPLIT_STATUS)
    {
        moveScore += BasicStatus(bsys, attacker, i, ai);
    } else {
        moveScore += BasicDamage(bsys, attacker, i, ai);
    }

    u8 struggleFlags = StruggleCheck(bsys, ctx, attacker, 0, -1);
    if (struggleFlags & MaskOfFlagNo(i)) {
        moveScore = 0;
    }

    return moveScore;
}

int BasicImmunity(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai)
{
    struct BattleStruct *ctx = bsys->sp;
    int moveScore = 0;

    /*Never use moves that are out of pp*/
    if(ctx->battlemon[ai->attacker].pp[i] == 0){
        return -40;
    }
    if(ctx->battlemon[ai->attacker].moveeffect.tauntTurns > 0 && 
        ctx->moveTbl[ai->attackerMove].split == SPLIT_STATUS){
        return -50; //taunted, so no status moves
    }

    if(ctx->battlemon[ai->attacker].moveeffect.disabledMove == ai->attackerMove &&
        ctx->battlemon[ai->attacker].moveeffect.disabledTurns > 0){
        return -40; //disabled, will softlock
    }


    /*Check for ai->defender type immunities.*/
    if(ai->attackerMoveEffectiveness == MOVE_STATUS_FLAG_NOT_EFFECTIVE && ctx->moveTbl[ai->attackerMove].split != SPLIT_STATUS){
        return -15;
    }
    /*Check for wonder guard*/
    if(ai->attackerMoveEffectiveness != MOVE_STATUS_FLAG_SUPER_EFFECTIVE &&
        ai->defenderAbility == ABILITY_WONDER_GUARD && ai->attackerAbility != ABILITY_MOLD_BREAKER){
        return -15;
    }

    //Ability immunities
    if(ai->attackerAbility != ABILITY_MOLD_BREAKER){
        if(ai->attackerMoveType == TYPE_ELECTRIC && //electric
            (ai->defenderAbility == ABILITY_VOLT_ABSORB ||
            ai->defenderAbility == ABILITY_LIGHTNING_ROD ||
            ai->defenderAbility == ABILITY_MOTOR_DRIVE) ){
            return -15;
        }
        if(ai->attackerMoveType == TYPE_WATER && //water
            (ai->defenderAbility == ABILITY_STORM_DRAIN ||
            ai->defenderAbility == ABILITY_WATER_ABSORB ||
            ai->defenderAbility == ABILITY_DRY_SKIN || 
            ctx->field_condition & WEATHER_EXTREMELY_HARSH_SUNLIGHT)  ){
            return -15;
        }
        if(ai->attackerMoveType == TYPE_FIRE && //fire
            (ai->defenderAbility == ABILITY_FLASH_FIRE || 
            ai->defenderAbility == ABILITY_WELL_BAKED_BODY || 
            ai->defenderAbility == ABILITY_THERMAL_EXCHANGE ||
            ctx->field_condition & WEATHER_HEAVY_RAIN) ){
            return -15;
        }
        if(ai->attackerMoveType == TYPE_GRASS && //grass
            (ai->defenderAbility == ABILITY_SAP_SIPPER) ){
            return -15;
        }
        if(ai->attackerMoveType == TYPE_GROUND && //ground
            (ai->defenderAbility == ABILITY_LEVITATE ||
            ai->defenderAbility == ABILITY_EARTH_EATER) ){
            return -15;
        }
        if(IsMoveSoundBased(ai->attackerMove) && //sound based moves
            ai->defenderAbility == ABILITY_SOUNDPROOF){ 
            return -15;
        }
        if(ctx->moveTbl[ai->attackerMove].split == SPLIT_STATUS &&
            ai->defenderAbility == ABILITY_GOOD_AS_GOLD && 
            !(ctx->moveTbl[ai->attackerMove].target == RANGE_USER ||  //do not include things like light screen, stealth rocks, self-targetting moves.
              ctx->moveTbl[ai->attackerMove].target == RANGE_OPPONENT_SIDE ||
              (ctx->moveTbl[ai->attackerMove].target == RANGE_USER_SIDE && ai->attackerMove != MOVE_LIFE_DEW )) ){
            return -15;
        }
    }

    /*Check for grass immunity to powder moves*/
    // Isnt working????
    if((IsPowderMove(ai->attackerMove) || ai->attackerMove == MOVE_LEECH_SEED) && HasType(ctx, ai->defender, TYPE_GRASS)
        || ((ai->attackerMove == MOVE_SLEEP_POWDER || ai->attackerMove == MOVE_STUN_SPORE)&& HasType(ctx, ai->defender, TYPE_GRASS))){
        return -20;
    }

    if((ai->defenderType1 == TYPE_DARK || ai->defenderType2 == TYPE_DARK) && 
        (ctx->moveTbl[ai->attackerMove].split == SPLIT_STATUS &&
        ai->attackerAbility == ABILITY_PRANKSTER &&
        ctx->moveTbl[ai->attackerMove].priority >= 0)
        && attacker != ai->defender){
        return -15;
    }

    /*Check for immunity to paralysis*/
    if((ai->attackerMoveEffect == MOVE_EFFECT_STATUS_PARALYZE) && ai->defenderImmuneToParalysis ){
        return -15;
    }

    /*Check for immunity to burn*/
    else if((ai->attackerMoveEffect == MOVE_EFFECT_STATUS_BURN) && ai->defenderImmuneToBurn){
        return -15;
    }

    /*Check for immunity to poison/badly poison*/
    else if((ai->attackerMoveEffect == MOVE_EFFECT_STATUS_POISON ||
        ai->attackerMoveEffect == MOVE_EFFECT_STATUS_BADLY_POISON) && ai->defenderImmuneToPoison){
        return -15;
    }

    /*Check for immunity to sleep*/
    else if((ai->attackerMoveEffect == MOVE_EFFECT_STATUS_SLEEP ||
        ai->attackerMoveEffect == MOVE_EFFECT_STATUS_SLEEP_NEXT_TURN) &&  ai->defenderImmuneToSleep){
        return -15;
    }

    /*Check for immunity to confusion*/ 
    else if((ai->attackerMoveEffect == MOVE_EFFECT_STATUS_CONFUSE ||
        ai->attackerMoveEffect == MOVE_EFFECT_ATK_UP_2_STATUS_CONFUSION || //swagger
        ai->attackerMoveEffect == MOVE_EFFECT_SP_ATK_UP_CAUSE_CONFUSION|| //flatter
        ai->attackerMoveEffect == MOVE_EFFECT_CONFUSE_ALL_ADJACENT ) && //teeter dance, need to change for double battles
        (ctx->battlemon[ai->defender].condition2 & STATUS2_CONFUSION || 
        ctx->side_condition[ai->defenderSide] & SIDE_STATUS_SAFEGUARD ||
        ai->defenderAbility == ABILITY_OWN_TEMPO )){
        return -15;
    }
    /*Check for immunity to infatuation*/
    else if((ai->attackerMoveEffect == MOVE_EFFECT_INFATUATE) && 
        (ctx->battlemon[ai->defender].condition2 & STATUS2_ATTRACT || 
        ai->defenderAbility == ABILITY_OBLIVIOUS ||
        ctx->battlemon[ai->defender].sex == ctx->battlemon[ai->defender].sex ||
        ctx->battlemon[ai->defender].sex == POKEMON_GENDER_UNKNOWN)){
        return -15;
    }
    else if(ai->attackerMove == MOVE_GRASSY_TERRAIN){
        if(ctx->terrainOverlay.type == GRASSY_TERRAIN && ctx->terrainOverlay.numberOfTurnsLeft > 0){
            return -15;
        }
    }
    else if(ai->attackerMove == MOVE_MISTY_TERRAIN){
        if(ctx->terrainOverlay.type == MISTY_TERRAIN && ctx->terrainOverlay.numberOfTurnsLeft > 0){
            return -15;
        }
    }
    else if(ai->attackerMove == MOVE_ELECTRIC_TERRAIN){
        if(ctx->terrainOverlay.type == ELECTRIC_TERRAIN && ctx->terrainOverlay.numberOfTurnsLeft > 0){
            return -15;
        }
    }
    else if(ai->attackerMove == MOVE_PSYCHIC_TERRAIN){
        if(ctx->terrainOverlay.type == PSYCHIC_TERRAIN && ctx->terrainOverlay.numberOfTurnsLeft > 0){
            return -15;
        }
    }
    /*Check for consecutive destiny bonds*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_KO_MON_THAT_DEFEATED_USER &&
            ctx->battlemon[ai->attacker].condition2 & STATUS2_DESTINY_BOND){
        return -15; //destiny bond is already active, don't use it again in a row
    }

    /*Check for self-killing moves */
    else if((ai->attackerMoveEffect == MOVE_EFFECT_HALVE_DEFENSE ) && 
    ((ai->defenderAbility == ABILITY_DAMP && ai->attackerAbility != ABILITY_MOLD_BREAKER) ||
        (ai->livingMembersAttacker == 1 && ai->livingMembersDefender > 1))){
        return -15; //prevents ai auto-losing the battle
    }
    else if((ai->attackerMoveEffect == MOVE_EFFECT_HALVE_DEFENSE) &&
        (ai->livingMembersAttacker == 1 && ai->livingMembersDefender == 1)){
        moveScore = -1; //Ai will consider exploding if both parties have one Pokemon left
    }

    /*Handle nightmare*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_STATUS_NIGHTMARE && 
    (ctx->battlemon[ai->defender].condition2 & STATUS2_NIGHTMARE ||
        ai->defenderAbility == ABILITY_MAGIC_GUARD)){
        return -15;
    }
    else if(ai->attackerMoveEffect == MOVE_EFFECT_STATUS_NIGHTMARE &&
        !(ctx->battlemon[ai->defender].condition & STATUS_SLEEP)){
        return -8;
    }

    /*Handle dream eater*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_RECOVER_DAMAGE_SLEEP &&
        !(ctx->battlemon[ai->defender].condition & STATUS_SLEEP)){ //must be asleep
        return -15;
    }

    /*Handle belly drum*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_MAX_ATK_LOSE_HALF_MAX_HP &&
        (ai->attackerHP * 100 / ai->attackerMaxHP < 51 )){
        return -15;
    }

    /*OHKO moves*/
    else if((ai->attackerMoveEffect == MOVE_EFFECT_ONE_HIT_KO) &&
        ((ai->defenderAbility == ABILITY_STURDY && ai->attackerAbility != ABILITY_MOLD_BREAKER) || 
        ctx->battlemon[attacker].level < ctx->battlemon[ai->defender].level)){
            return -15;
    }

    /*Magnet Rise*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_GIVE_GROUND_IMMUNITY &&
        (ctx->battlemon[attacker].effect_of_moves & MOVE_EFFECT_FLAG_MAGNET_RISE || ai->attackerType1  == TYPE_FLYING || ai->attackerType2  == TYPE_FLYING || ai->attackerAbility == ABILITY_LEVITATE)){
            return -15; //magnet rise is already active, or flying type, or levitate
    }

    /*Handle substitute*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_SET_SUBSTITUTE && 
        (ctx->battlemon[attacker].condition2 & STATUS2_SUBSTITUTE || ai->attackerHP*100/ai->attackerMaxHP < 26) ){
        return -15;
    } //might have to consider status moves that are blocked by sub (unrelated)

    else if(ai->attackerMove == MOVE_LEECH_SEED && 
        (ctx->battlemon[ai->defender].effect_of_moves & MOVE_EFFECT_FLAG_LEECH_SEED_ACTIVE ||
        ai->defenderType1 == TYPE_GRASS || ai->defenderType2 == TYPE_GRASS ||
        ai->defenderAbility == ABILITY_MAGIC_GUARD )){
        return -15;
    }

    /*Handle disable & encore*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_DISABLE && 
        (ctx->battlemon[ai->defender].moveeffect.disabledTurns != 0) ){
        return -8;
    }
    else if(ai->attackerMoveEffect == MOVE_EFFECT_ENCORE && 
        (ctx->battlemon[ai->defender].moveeffect.encoredTurns != 0) ){
        return -8;
    }

    /*Handle hazards*/
    else if((ai->attackerMoveEffect == MOVE_EFFECT_STEALTH_ROCK && 
        (ctx->side_condition[ai->defenderSide] & SIDE_STATUS_STEALTH_ROCK || ai->livingMembersDefender == 1 )) ||
        (ai->attackerMoveEffect == MOVE_EFFECT_SET_SPIKES && 
            (ctx->scw[ai->defenderSide].spikesLayers >= 3 || ai->livingMembersDefender == 1) )||
            (ai->attackerMoveEffect == MOVE_EFFECT_TOXIC_SPIKES && 
                (ctx->scw[ai->defenderSide].toxicSpikesLayers >= 2 || ai->livingMembersDefender == 1))){
        return -15;
    }

    /*Handle weather*/
    else if((ai->attackerMoveEffect == MOVE_EFFECT_WEATHER_SANDSTORM && 
        (ctx->field_condition & WEATHER_SANDSTORM_ANY)) ||
        (ai->attackerMoveEffect == MOVE_EFFECT_WEATHER_HAIL && 
            (ctx->field_condition & WEATHER_HAIL_ANY )) ||
            (ai->attackerMoveEffect == MOVE_EFFECT_WEATHER_SNOW && 
                (ctx->field_condition & WEATHER_SNOW_ANY )) ||
            (ai->attackerMoveEffect == MOVE_EFFECT_WEATHER_RAIN && 
                (ctx->field_condition & WEATHER_RAIN_ANY)) ||
                (ai->attackerMoveEffect == MOVE_EFFECT_WEATHER_SUN && 
                    (ctx->field_condition & WEATHER_SUNNY_ANY))){
        return -8;
    }

    /*Handle doom desire and future sight*/
    if((ai->attackerMoveEffect == MOVE_EFFECT_HIT_IN_3_TURNS) &&
        ctx->fcc.future_prediction_count[ai->defender] !=0 ){
        return -12;
    }
    /*Handle baton pass, shed tail*/
    else if((ai->attackerMoveEffect == MOVE_EFFECT_PASS_STATS_AND_STATUS || ai->attackerMoveEffect == MOVE_EFFECT_SHED_TAIL) &&
        ai->livingMembersAttacker == 1){
        return -15;
    }
    /*Handle fake out after turn one*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_ALWAYS_FLINCH_FIRST_TURN_ONLY && ai->attackerTurnsOnField > 0){
        return -25;
    }

    /*Handle Memento*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_FAINT_AND_ATK_SP_ATK_DOWN_2 && ((ai->defenderAbility == ABILITY_WHITE_SMOKE ||
        ai->defenderAbility == ABILITY_CLEAR_BODY) && ai->attackerAbility != ABILITY_MOLD_BREAKER) ||
        (ctx->battlemon[attacker].states[STAT_ATTACK] <= 0 ||ctx->battlemon[attacker].states[STAT_SPATK] <= 0)){
            return -15;
    }

    /*Handle imprison*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_MAKE_SHARED_MOVES_UNUSEABLE && 
        (ctx->battlemon[attacker].effect_of_moves & MOVE_EFFECT_FLAG_IMPRISONED ||
            ctx->battlemon[ai->defender].effect_of_moves & MOVE_EFFECT_FLAG_IMPRISONED )){
                return -15;
    }

    /*Tailwind*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_DOUBLE_SPEED_3_TURNS &&
    (ctx->side_condition[ai->attackerSide] & SIDE_STATUS_TAILWIND
    )){
        return -15;
    }

    /*Gravity*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_GRAVITY &&
    (ctx->field_condition & FIELD_STATUS_GRAVITY)){
        return -15;
    }

    /*Natural Gift*/
    if(ai->attackerMoveEffect == MOVE_EFFECT_NATURAL_GIFT &&
        (!IS_ITEM_BERRY(ai->attackerItem))){
            return -15;
    }

    /*Embargo*/
    else if(ai->attackerMoveEffect == MOVE_EFFECT_PREVENT_ITEM_USE &&
        (ctx->battlemon[ai->defender].effect_of_moves & MOVE_EFFECT_FLAG_EMBARGO)){
            return -15;
    }

    return 0;
}

int statDropPreventingAbilities[] = {
    ABILITY_CLEAR_BODY,
    ABILITY_WHITE_SMOKE,
    ABILITY_CONTRARY,
};

int weatherPreventingAbilities[] = {
    ABILITY_AIR_LOCK,
    ABILITY_CLOUD_NINE,
};

BOOL isInArray(int val, int* array, int arraySize){
    for(int i = 0; i < arraySize; i++){
        if(array[i] == val) return TRUE;
    }
    return FALSE;
}

BOOL batllerKnowsMove(struct BattleSystem *bsys, u32 battler, int move){
    struct BattleStruct *ctx = bsys->sp;
    for(int i = 0; i < 4; i++){
        if(ctx->battlemon[battler].move[i] == move) return TRUE;
    }
    return FALSE;
}

int BasicStatus(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai)
{
    int moveScore = 0;

    switch(ai->attackerMoveEffect)
    {
        case MOVE_EFFECT_WEATHER_RAIN:
            if (!(bsys->sp->field_condition & WEATHER_RAIN_ANY) && !isInArray(ai->defenderAbility, weatherPreventingAbilities, sizeof(weatherPreventingAbilities)/sizeof(int)) )
                {
                    moveScore = 11;
                }
            break;
        case MOVE_EFFECT_WEATHER_SUN:
            if (!(bsys->sp->field_condition & WEATHER_SUNNY_ANY) && !isInArray(ai->defenderAbility, weatherPreventingAbilities, sizeof(weatherPreventingAbilities)/sizeof(int)) )
                {
                    moveScore = 11;
                }
            break;
        case MOVE_EFFECT_WEATHER_SANDSTORM:
            if (!(bsys->sp->field_condition & WEATHER_SANDSTORM_ANY) && !isInArray(ai->defenderAbility, weatherPreventingAbilities, sizeof(weatherPreventingAbilities)/sizeof(int)) )
                {
                    moveScore = 11;
                }
            break;
        case MOVE_EFFECT_WEATHER_HAIL:
            if (!(bsys->sp->field_condition & WEATHER_HAIL_ANY) && !isInArray(ai->defenderAbility, weatherPreventingAbilities, sizeof(weatherPreventingAbilities)/sizeof(int)) )
                {
                    moveScore = 11;
                }
            break;
        case MOVE_EFFECT_APPLY_TERRAINS:
            switch(ai->attackerMove)
            {
                case MOVE_GRASSY_TERRAIN:
                    if (bsys->sp->terrainOverlay.type != GRASSY_TERRAIN || bsys->sp->terrainOverlay.numberOfTurnsLeft == 0)
                    {
                        moveScore = 11;
                    }
                    break;
                case MOVE_MISTY_TERRAIN:
                    if (bsys->sp->terrainOverlay.type != MISTY_TERRAIN || bsys->sp->terrainOverlay.numberOfTurnsLeft == 0)
                    {
                        moveScore = 11;
                    }
                    break;
                case MOVE_ELECTRIC_TERRAIN:
                    if (bsys->sp->terrainOverlay.type != ELECTRIC_TERRAIN || bsys->sp->terrainOverlay.numberOfTurnsLeft == 0)
                    {
                        moveScore = 11;
                    }
                    break;
                case MOVE_PSYCHIC_TERRAIN:
                    if (bsys->sp->terrainOverlay.type != PSYCHIC_TERRAIN || bsys->sp->terrainOverlay.numberOfTurnsLeft == 0)
                    {
                        moveScore = 11;
                    }
                    break;
                default:
                    break;
            }
        case MOVE_EFFECT_STICKY_WEB:
            if (ai->attackerTurnsOnField == 0)
            {
                moveScore = 12;
            } else {
                moveScore = 9;
            }
            break;
        case MOVE_EFFECT_STEALTH_ROCK:
            if (ai->attackerTurnsOnField == 0)
            {
                moveScore = 9;
            } else {
                moveScore = 7;
            }
            break;
        case MOVE_EFFECT_TOXIC_SPIKES:
            if (ai->attackerTurnsOnField == 0)
            {
                moveScore = 9 - bsys->sp->scw[ai->defenderSide].toxicSpikesLayers;
            } else {
                moveScore = 7 - bsys->sp->scw[ai->defenderSide].toxicSpikesLayers;
            }    
            break;
        case MOVE_EFFECT_SET_SPIKES:
            if (ai->attackerTurnsOnField == 0)
            {
                moveScore = 9 - bsys->sp->scw[ai->defenderSide].spikesLayers;
            } else {
                moveScore = 7 - bsys->sp->scw[ai->defenderSide].spikesLayers;
            }      
            break; 
        case MOVE_EFFECT_STATUS_SLEEP:
            moveScore = 6; 
            if (
                (BattlerKnowsMove(bsys, ai->attacker, MOVE_NIGHTMARE) || BattlerKnowsMove(bsys, ai->attacker, MOVE_DREAM_EATER))
                && !(BattlerKnowsMove(bsys, ai->defender, MOVE_SLEEP_TALK) || BattlerKnowsMove(bsys, ai->defender, MOVE_SNORE))
            )
            {
                moveScore +=1;

                if (BattlerKnowsMove(bsys, ai->attacker, MOVE_HEX))
                {
                    moveScore +=1;
                }
            }
            break;
        case MOVE_EFFECT_ATK_SPEED_UP:
        case MOVE_EFFECT_SPEED_UP_2_ATK_UP:
        case MOVE_EFFECT_ATK_UP_2:
        case MOVE_EFFECT_ATK_UP:
            moveScore = BasicOffensiveSetup(bsys, attacker, i, ai);
            break;
        case MOVE_EFFECT_DEF_UP_2:
        case MOVE_EFFECT_DEF_UP_3:
        case MOVE_EFFECT_DEF_UP:
        case MOVE_EFFECT_STOCKPILE:
        case MOVE_EFFECT_DEF_SP_DEF_UP:
            moveScore = BasicDefensiveSetup(bsys, attacker, i, ai);
            break;
        case MOVE_EFFECT_ATK_DEF_UP:
        case MOVE_EFFECT_ATK_DEF_SPEED_UP:
        case MOVE_EFFECT_CURSE:
            // Handle Ghost Type Curse
            moveScore = 6;
            if(ai->defenderHasPhysicalMove && !ai->defenderHasSpecialMove)
            {
                moveScore = BasicDefensiveSetup(bsys, attacker, i, ai);
            } else {
                moveScore = BasicOffensiveSetup(bsys, attacker, i, ai);
            }
            break;
        case MOVE_EFFECT_SP_ATK_SP_DEF_UP:
        case MOVE_EFFECT_SP_ATK_SP_DEF_SPEED_UP:
            moveScore = 6;
            if(ai->defenderHasSpecialMove && !ai->defenderHasPhysicalMove)
            {
                moveScore = BasicDefensiveSetup(bsys, attacker, i, ai);
            } else {
                moveScore = BasicOffensiveSetup(bsys, attacker, i, ai);
            }
            break;
        case MOVE_EFFECT_ALL_FAINT_3_TURNS:
            moveScore = 6;
            break;
        case MOVE_EFFECT_STATUS_BURN:
            moveScore = 6;
            if (ai->defenderHasPhysicalMove)
            {
                moveScore += 1;
            }
            if (BattlerKnowsMove(bsys, ai->defender, MOVE_HEX))
            {
                moveScore += 1;
            }
            break;
        case MOVE_EFFECT_STATUS_PARALYZE:
            moveScore = 7;
            if (BattlerKnowsMove(bsys, ai->attacker, MOVE_HEX)
                || bsys->sp->battlemon[ai->defender].condition2 & STATUS2_CONFUSION
                || bsys->sp->battlemon[ai->defender].condition2 & STATUS2_ATTRACT)
            {
                moveScore += 1;
            }
        default:
            break;
    } 

    return moveScore;
}

int BasicOffensiveSetup(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai)
{
    int moveScore = 6;

    if (!ai->attackerMovesFirst && ai->turnsToGetKilled <= 2)
    {
        moveScore -= 5;
    }

    return moveScore;
}

int BasicDefensiveSetup(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai)
{
    int moveScore = 6;

    if(!ai->attackerMovesFirst && ai->turnsToGetKilled <= 2)
    {
        moveScore -= 5;
    }

    return moveScore;
}


#define BATTLE_TYPE_DOUBLE_ANY (BATTLE_TYPE_MULTI | BATTLE_TYPE_DOUBLE | BATTLE_TYPE_TAG)

int BasicDamage(struct BattleSystem *bsys, u32 attacker, int i, AIContext *ai)
{
    int moveScore = 0;
    struct BattleStruct *ctx = bsys->sp;
    BOOL is_current_move_not_strongest = FALSE;
    if(ai->attackerMoveEffect == MOVE_EFFECT_HALVE_DEFENSE){
        return 0;
    }
    for(int j = 0; j < ai->attackerMovesKnown; j++){
        if ( i != j && ai->attackerRandomRollMoveDamages[i] < ai->attackerRandomRollMoveDamages[j]){
            is_current_move_not_strongest = TRUE;
        }
    }

    if (ai->attackerRandomRollMoveDamages[i] >= ai->defenderHP){
        /*Fast Kill*/
        if(ai->attackerMovesFirst || ai->isSpeedTie || ai->attackerItem == ITEM_QUICK_CLAW || (!ai->attackerMovesFirst && ctx->moveTbl[ai->attackerMove].priority > 0)){
            moveScore += 12;
        }
        /*Slow Kill*/
        else{
            moveScore += 9;
        }
    } else if (!is_current_move_not_strongest) moveScore += 6;

    switch(ai->attackerMoveEffect)
    {
        case MOVE_EFFECT_THUNDER:
        case MOVE_EFFECT_HURRICANE:
        case MOVE_EFFECT_HIT_FLY:
        case MOVE_EFFECT_DOUBLE_DAMAGE_FLY_OR_BOUNCE:
        case MOVE_EFFECT_FLINCH_DOUBLE_DAMAGE_FLY_OR_BOUNCE:
        //case MOVE_EFFECT_SMACK_DOWN:
        //case MOVE_EFFECT_THOUSAND_ARROWS:
            if (ai->attackerMovesFirst
                && bsys->sp->battlemon[ai->defender].effect_of_moves & MOVE_EFFECT_FLAG_FLYING_IN_AIR)
                {
                    moveScore += 20;
                }
            break;
        case MOVE_EFFECT_RANDOM_POWER_10_CASES:
        case MOVE_EFFECT_DOUBLE_DAMAGE_DIG:
        //case MOVE_EFFECT_FISSURE:
            if (ai->attackerMovesFirst
                && bsys->sp->battlemon[ai->defender].effect_of_moves & MOVE_EFFECT_FLAG_DIGGING)
                {
                    moveScore += 20;

                }
            break;
        case MOVE_EFFECT_DOUBLE_DAMAGE_DIVE:
        case MOVE_EFFECT_WHIRLPOOL:
            if (ai->attackerMovesFirst
                && bsys->sp->battlemon[ai->defender].effect_of_moves & MOVE_EFFECT_FLAG_IS_DIVING)
                {
                    moveScore += 20;
                    
                }
            break;  
        case MOVE_EFFECT_RAISE_SPEED_HIT:
            if (is_current_move_not_strongest && !ai->attackerMovesFirst)
                {
                    moveScore += 7;
                }
            break;
        case MOVE_EFFECT_LOWER_SPEED_HIT:
            if (is_current_move_not_strongest && ai->attackerMoveEffectChance == 100)
            {
                if (!ai->attackerMovesFirst && !isInArray(ai->defenderAbility, statDropPreventingAbilities, sizeof(statDropPreventingAbilities)/sizeof(int)) )
                    {
                        moveScore += 6;
                    }
                else
                    {
                        moveScore += 5;
                    }
                if ((BattleTypeGet(bsys) & BATTLE_TYPE_DOUBLE_ANY) && (ai->attackerMoveRange == RANGE_ADJACENT_OPPONENTS || ai->attackerMoveRange == RANGE_ALL_ADJACENT))
                    {
                        moveScore += 1;
                    }
            }
            break;
        //case MOVE_EFFECT_FELL_STINGER:
        default:
            break;
    }

    return moveScore;
}

/*-------------------------------Helper Functions--------------------------------*/


/*returns the index of the pokemon on the attacker's (ai's)
team with the largest damage against the target*/
int AttackerMonWithHighestDamage (struct BattleSystem *bsys, u32 attacker, AIContext *ai){
    struct BattleStruct *ctx = bsys->sp;
    int maxDamage = 0;
    int maxDamageIndex = 0;
    //loop over party pokemon that aren't fainted
    for(int i = 0; i < ai->partySizeAttacker; i++){
        struct PartyPokemon * currentMonAttacking = Battle_GetClientPartyMon(bsys, attacker, i);
        //loop over each pokemon's moves
        if(GetMonData(currentMonAttacking, MON_DATA_HP, 0) != 0){
            for (int attack_index = 0; attack_index < 4; attack_index++){
                int current_move = GetMonData(currentMonAttacking, MON_DATA_MOVE1 + attack_index, NULL);
                int damage = CalcBaseDamage(bsys, ctx, current_move, ctx->side_condition[ai->defenderSide], ctx->field_condition, 0, 0, attacker, ai->defender, NULL);
                if(damage > maxDamage){
                    maxDamage = damage;
                    maxDamageIndex = i;
                }
            }
        }
    }
    return maxDamageIndex;
}

/*Returns the sum of all stat changes, only looking at boosted moves.*/
int BattlerPositiveStatChangesSum (struct BattleSystem *bsys, u32 battler, AIContext *ai){
    struct BattleStruct *ctx = bsys->sp;
    int statSum = 0;

    for(int stat = 0; stat < STAT_MAX; stat++){
        if(ctx->battlemon[battler].states[stat] > 6){
            statSum += ctx->battlemon[battler].states[stat];
        }
    }
    return statSum;
}

/*Returns true if the battler has >= boost_amount in any stat*/
BOOL BattlerHasStatBoostGreater (struct BattleSystem *bsys, u32 battler, u32 boost_amount, AIContext *ai){
    BOOL battlerHasStatBoost = 0;
    struct BattleStruct *ctx = bsys->sp;
    if(ctx->battlemon[battler].states[STAT_ATTACK] >= boost_amount ||
        ctx->battlemon[battler].states[STAT_DEFENSE] >= boost_amount ||
        ctx->battlemon[battler].states[STAT_SPATK] >= boost_amount ||
        ctx->battlemon[battler].states[STAT_SPDEF] >= boost_amount ||
        ctx->battlemon[battler].states[STAT_SPEED] >= boost_amount ||
        ctx->battlemon[battler].states[STAT_EVASION] >= boost_amount ||
        ctx->battlemon[battler].states[STAT_ACCURACY] >= boost_amount){
            battlerHasStatBoost = 1;
    }
    return battlerHasStatBoost;
}

/*Returns true if the battler has <= boost_amount in any stat*/
BOOL BattlerHasStatBoostLesser (struct BattleSystem *bsys, u32 battler, u32 drop_amount, AIContext *ai){
    BOOL battlerHasStatBoost = 0;
    struct BattleStruct *ctx = bsys->sp;
    if(ctx->battlemon[battler].states[STAT_ATTACK] <= drop_amount ||
        ctx->battlemon[battler].states[STAT_DEFENSE] <= drop_amount ||
        ctx->battlemon[battler].states[STAT_SPATK] <= drop_amount ||
        ctx->battlemon[battler].states[STAT_SPDEF] <= drop_amount ||
        ctx->battlemon[battler].states[STAT_SPEED] <= drop_amount ||
        ctx->battlemon[battler].states[STAT_EVASION] <= drop_amount ||
        ctx->battlemon[battler].states[STAT_ACCURACY] <= drop_amount){
            battlerHasStatBoost = 1;
    }
    return battlerHasStatBoost;
}

/*Returns true if user has a particular move in their 4 move slots.*/
BOOL BattlerKnowsMove (struct BattleSystem *bsys, u32 battler, u32 move){
    BOOL knowsMove = 0;
    struct BattleStruct *ctx = bsys->sp;
    for(int i = 0; i < 4; i++){
        int battler_move_check = ctx->battlemon[battler].move[i];
        if(battler_move_check == move){
            knowsMove = 1;
        }
    }
    return knowsMove;
}

BOOL BattlerHasTypeDamagingMove (struct BattleSystem *bsys, u32 battler, u32 type, AIContext *ai){
    BOOL hasMove = FALSE;
    struct BattleStruct *ctx = bsys->sp;
    for(int i = 0; i < 4; i++){
        int battler_move_check = ctx->battlemon[battler].move[i];
        if(ctx->moveTbl[battler_move_check].type == type && ctx->moveTbl[battler_move_check].split != SPLIT_STATUS){
            hasMove = TRUE;
        }
    }
    return hasMove;
}

/*Returns true if user has a particular move split (physical, special, or status) in their 4 move slots.*/
BOOL BattlerHasMoveSplit (struct BattleSystem *bsys, u32 battler, u32 move_split, AIContext *ai){
    BOOL hasMoveSplit = 0;
    struct BattleStruct *ctx = bsys->sp;

    for(int i = 0; i < 4; i++){
        int battler_move_split = ctx->moveTbl[ctx->battlemon[battler].move[i]].split ;
        if(battler_move_split == move_split){
            hasMoveSplit = 1;
        }
    }
    return hasMoveSplit;
}
/*Returns true if user has a particular move effect in their 4 move slots.*/
BOOL BattlerHasMoveEffect (struct BattleSystem *bsys, u32 battler, u32 move_effect, AIContext *ai){

    BOOL hasMoveEffect = 0;
    struct BattleStruct *ctx = bsys->sp;

    for(int i = 0; i < 4; i++){
        int battler_move_effect = ctx->moveTbl[ctx->battlemon[battler].move[i]].effect ;
        if(battler_move_effect == move_effect){
            hasMoveEffect = 1;
        }
    }
    return hasMoveEffect;
}

/*Returns true if user has a particular damaging move type.*/
BOOL BattlerHasDamagingMoveType (struct BattleSystem *bsys, u32 battler, u32 type, AIContext *ai){

    BOOL hasMoveType = FALSE;
    struct BattleStruct *ctx = bsys->sp;

    for(int i = 0; i < 4; i++){
        int battler_move_type = ctx->moveTbl[ctx->battlemon[battler].move[i]].type;
        if(battler_move_type == type && ctx->moveTbl[ctx->battlemon[battler].move[i]].split != SPLIT_STATUS){
            hasMoveType = TRUE;
        }
    }
    return hasMoveType;
}

/*Returns true if the item has some sort of negative effect on holder.*/
BOOL ItemIsBadToTrade(u32 item, AIContext *ai){
    if((item == ITEM_IRON_BALL && !ai->trickRoomActive)||
    item == ITEM_LAGGING_TAIL ||item == ITEM_TOXIC_ORB ||
    item == ITEM_FLAME_ORB || item == ITEM_RING_TARGET ||
    item == ITEM_STICKY_BARB || item == ITEM_CHOICE_SCARF ||
    item == ITEM_CHOICE_SPECS || item == ITEM_CHOICE_BAND ||
    item == ITEM_BLACK_SLUDGE || item == ITEM_MACHO_BRACE ||
    item == ITEM_POWER_BRACER || item == ITEM_POWER_BAND ||
    item == ITEM_POWER_ANKLET || item == ITEM_POWER_BELT|| 
    item == ITEM_POWER_LENS || item == ITEM_POWER_WEIGHT){
        return TRUE;
    }
    else{
        return FALSE;
    }
}
/*Returns true if the item has some sort of negative effect on holder -- excludes some of the above functions' items.*/
BOOL ItemIsDisruptive(u32 item, AIContext *ai){
    if((item == ITEM_IRON_BALL && !ai->trickRoomActive)||
    item == ITEM_CHOICE_SCARF ||
    item == ITEM_CHOICE_SPECS || item == ITEM_CHOICE_BAND ||
    item == ITEM_STICKY_BARB ||
    item == ITEM_POWER_BRACER || item == ITEM_POWER_BAND ||
    item == ITEM_POWER_ANKLET || item == ITEM_POWER_BELT|| 
    item == ITEM_POWER_LENS || item == ITEM_POWER_WEIGHT){
        return 1;
    }
    else{
        return 0;
    }
}

/*Returns true if the ability passed is "good", which is pretty subjective.*/
BOOL IsDesirableAbility(u32 ability){
    if(ability == ABILITY_SPEED_BOOST ||
        ability == ABILITY_BATTLE_ARMOR ||
        ability == ABILITY_SAND_VEIL ||
        ability == ABILITY_STATIC ||
        ability == ABILITY_FLASH_FIRE||
        ability == ABILITY_WONDER_GUARD ||
        ability == ABILITY_SWIFT_SWIM ||
        ability == ABILITY_HUGE_POWER ||
        ability == ABILITY_RAIN_DISH ||
        ability == ABILITY_CUTE_CHARM ||
        ability == ABILITY_SHED_SKIN ||
        ability == ABILITY_MARVEL_SCALE ||
        ability == ABILITY_PURE_POWER||
        ability == ABILITY_CHLOROPHYLL ||
        ability == ABILITY_SHIELD_DUST ||
        ability == ABILITY_ADAPTABILITY ||
        ability == ABILITY_MAGIC_GUARD||
        ability == ABILITY_MOLD_BREAKER ||
        ability == ABILITY_SUPER_LUCK ||
        ability == ABILITY_UNAWARE ||
        ability == ABILITY_TINTED_LENS||
        ability == ABILITY_FILTER ||
        ability == ABILITY_SOLID_ROCK ||
        ability == ABILITY_RECKLESS ||
        ability == ABILITY_SHELL_ARMOR){
            return TRUE;
        }
    else{
        return FALSE;
    }
    
}

/**
 * @brief Check if the current move is a stat dropping move (Status moves only)
 * @param moveEffect move's effect
 * @return TRUE if it is a stat dropping move
*/
BOOL LONG_CALL DropsStatsAsStatus(u32 moveEffect) {
    u8 output = FALSE;
    for (u16 i = 0; i < NELEMS(DropStatList); i++) {
        if (moveEffect == DropStatList[i]) {
            output = TRUE;
            break;
        }
    }
    return output;
}

/**
 * @brief Check if the current move is a favored by mirror move
 * @param moveEffect move's effect
 * @return TRUE if it is in the mirror move list
*/
BOOL LONG_CALL IsInMirrorMoveList(u32 moveEffect) {
    u8 output = FALSE;
    for (u16 i = 0; i < NELEMS(MirrorMoveEffectList); i++) {
        if (moveEffect == MirrorMoveEffectList[i]) {
            output = TRUE;
            break;
        }
    }
    return output;
}

/*Returns true if a given list has a certain value in it.*/
BOOL LONG_CALL IsInList(u32 value, const u16 list[], u16 ListLength) {
    u8 output = FALSE;
    for (u16 i = 0; i < ListLength; i++) {
        if (value == list[i]) {
            output = TRUE;
            break;
        }
    }
    return output;
}

/*Returns true if the given battler has a move in a list.*/
BOOL LONG_CALL BattlerKnowsMoveInList(struct BattleSystem *bsys, u32 battler, const u16 MoveList[], u16 listLength, AIContext *ai) {
    struct BattleStruct *ctx = bsys->sp;
    BOOL knowsMove = FALSE;
    for (int i = 0; i < 4; i++) {
        for (int listIndex = 0; listIndex < listLength; listIndex++){
            if (ctx->battlemon[battler].move[i] == MoveList[listIndex]) {
                knowsMove = TRUE;
                break;
            }
        }
    }
    return knowsMove;
}

/*Returns true if the battler moves first. 
This function particularly accounts for 4 battlers, not just 2.*/
BOOL LONG_CALL BattlerMovesFirstDoubles(struct BattleSystem *bsys, struct BattleStruct *ctx, int mainBattler, int flag, AIContext *ai){
    BOOL movesFirst = TRUE;
    for (int otherBattler = 0; otherBattler < 4; otherBattler++){
        if(ctx->battlemon[otherBattler].hp != 0 && mainBattler != otherBattler){
            if(CalcSpeed(bsys, ctx, otherBattler, mainBattler, flag) != 1){
                return FALSE;
            }
        }
    }
    return movesFirst;
}

/*Returns true if the attacker's move index (0-3) has the highest max damage roll of all other move indices.*/
BOOL LONG_CALL MoveIsStrongest(struct BattleSystem *bsys, struct BattleStruct *ctx, int moveIndex, AIContext *ai){
    BOOL is_strongest = TRUE;
    for (int i = 0; i < 4; i++){
        if(i != moveIndex){
            if(ai->attackerRandomRollMoveDamages[moveIndex] < ai->attackerRandomRollMoveDamages[i]){
                return FALSE;
            }
        }
    }
    return is_strongest;
}

/*Set up all of the AI variables, exlcuding the double battle related ones, which are setup explicitly in TagStrategy Flag*/
void SetupStateVariables(struct BattleSystem *bsys, u32 attacker, u32 defender, AIContext *ai){
    struct BattleStruct *ctx = bsys->sp;
    u8 speedCalc;
    int work;
    u32 temp = 0;
    ai->attacker = attacker;
    ai->defender = defender;
    ai->attackerSide = BATTLER_IS_ENEMY(ai->attacker);
    ai->defenderSide = BATTLER_IS_ENEMY(ai->defender);
    ai->attackerLevel = ctx->battlemon[attacker].level;
    ai->attackerAbility = ctx->battlemon[attacker].ability;
    ai->defenderAbility = ctx->battlemon[ai->defender].ability;
    ai->attackerItem = ctx->battlemon[attacker].item;
    ai->defenderItem = ctx->battlemon[ai->defender].item;
    ai->holdEffect = BattleItemDataGet(ctx, ai->defenderItem, 1); //this was mistakenly documented as attacker's held item in ai.c -- fixed now
    ai->defenderType1 = ctx->battlemon[ai->defender].type1;
    ai->defenderType2 = ctx->battlemon[ai->defender].type2;
    ai->attackerType1 = ctx->battlemon[attacker].type1;
    ai->attackerType2 = ctx->battlemon[attacker].type2;
    ai->attackerHP = ctx->battlemon[attacker].hp;
    ai->defenderHP = ctx->battlemon[ai->defender].hp;
    ai->attackerMaxHP = ctx->battlemon[attacker].maxhp;
    ai->defenderMaxHP = ctx->battlemon[ai->defender].maxhp;
    ai->attackerPercentHP = ai->attackerHP * 100 / ai->attackerMaxHP;
    ai->defenderPercentHP = ai->defenderHP * 100 / ai->defenderMaxHP; 
    ai->attackerSpeed = ctx->battlemon[attacker].speed;
    ai->defenderSpeed = ctx->battlemon[ai->defender].speed;
    ai->attackerPartyIndex = ctx->sel_mons_no[attacker];
    ai->defenderLastUsedMove = ctx->waza_no_old[ai->defender];
    ai->defenderLastUsedMoveEffect = ctx->moveTbl[ai->defenderLastUsedMove].effect;
    ai->defenderTurnsOnField = ctx->total_turn - ctx->battlemon[ai->defender].moveeffect.fakeOutCount;
    ai->attackerTurnsOnField = ctx->total_turn - ctx->battlemon[attacker].moveeffect.fakeOutCount;
    ai->flingPower = BattleItemDataGet(ctx, ai->attackerItem, ITEM_PARAM_FLING_POWER);
    ai->differenceInAttackStages = ctx->battlemon[attacker].states[STAT_ATTACK] - ctx->battlemon[ai->defender].states[STAT_ATTACK];
    ai->differenceInSpAtkStages = ctx->battlemon[attacker].states[STAT_SPATK] - ctx->battlemon[ai->defender].states[STAT_SPATK];
    ai->differenceInDefenseStages = ctx->battlemon[attacker].states[STAT_DEFENSE] - ctx->battlemon[ai->defender].states[STAT_DEFENSE];
    ai->differenceInSpDefStages = ctx->battlemon[attacker].states[STAT_SPDEF] - ctx->battlemon[ai->defender].states[STAT_SPDEF];
    ai->defenderMovesFirst = 0;
    ai->attackerMovesFirst = 0;
    ai->isSpeedTie = 0;
    ai->trickRoomActive = 0;
    ai->defenderHasBadItem = 0;
    ai->maxDamageReceived = 0;
    ai->attackerMaxDamageOutputMinRoll = 0;

    speedCalc = CalcSpeed(ctx, ctx, ai->defender, attacker, CALCSPEED_FLAG_NO_PRIORITY); //checks actual turn order with field state considered
    //evaluates to 0 if ai->defender > attacker (false)
    //and 1 if ai->defender < attacker (true)
    //if speed tie, then 2.
    if(speedCalc == 0){
        ai->defenderMovesFirst = 1;
    }
    else if(speedCalc == 1){
        ai->attackerMovesFirst = 1;
    }
    else if(speedCalc == 2){
        ai->isSpeedTie = 1;
    }

    if(ctx->field_condition & FIELD_STATUS_TRICK_ROOM){
        ai->trickRoomActive = 1;
    }
    if((ai->defenderItem == ITEM_IRON_BALL && !ai->trickRoomActive)||ai->defenderItem == ITEM_LAGGING_TAIL ||ai->defenderItem == ITEM_TOXIC_ORB ||ai->defenderItem == ITEM_FLAME_ORB || ai->defenderItem == ITEM_RING_TARGET ||
    ai->defenderItem == ITEM_STICKY_BARB || ai->defenderItem == ITEM_CHOICE_SCARF || ai->defenderItem == ITEM_CHOICE_SPECS || ai->defenderItem == ITEM_CHOICE_BAND){
        ai->defenderHasBadItem = 1;
    }

    /*Check if target or user has stat change*/
    ai->hasStatChange = 0;
    for(int i = 0; i < STAT_MAX; i++){
        if (ctx->battlemon[attacker].states[i] != 0 ||
            ctx->battlemon[ai->defender].states[i] != 0){
            ai->hasStatChange = 1;
        }
    }
    
    /*Check if ai->defender has any IMPACTFUL hazards up (spikes at level 2 or higher)*/
    if(ctx->side_condition[ai->defenderSide] & SIDE_STATUS_STEALTH_ROCK ||
        ctx->scw[ai->defenderSide].spikesLayers >= 2 ||
        ctx->scw[ai->defenderSide].toxicSpikesLayers >= 1){
        ai->defenderHasHazards = 1;
    }
    else{
        ai->defenderHasHazards = 0;
    }

    ai->defenderImmuneToPoison = 
        (ai->defenderType1 == TYPE_POISON || ai->defenderType2 == TYPE_POISON || //TODO need to consider corrosion
        ai->defenderType1 == TYPE_STEEL || ai->defenderType2 == TYPE_STEEL ||
        ctx->battlemon[ai->defender].condition & STATUS_ALL || 
        ctx->side_condition[ai->defenderSide] & SIDE_STATUS_SAFEGUARD ||
        ai->defenderAbility == ABILITY_MAGIC_GUARD ||
        ai->defenderAbility == ABILITY_IMMUNITY ||
        ai->defenderAbility == ABILITY_POISON_HEAL ||
        (ai->defenderAbility == ABILITY_LEAF_GUARD && ctx->field_condition & WEATHER_SUNNY_ANY)|| 
        (ai->defenderAbility == ABILITY_HYDRATION && ctx->field_condition & WEATHER_RAIN_ANY) ) ||
        (IsClientGrounded(ctx, ai->defender) && ctx->terrainOverlay.type == MISTY_TERRAIN);
    ai->defenderImmuneToParalysis =
        (ai->defenderType1 == TYPE_ELECTRIC || ai->defenderType2 == TYPE_ELECTRIC ||
        ctx->battlemon[ai->defender].condition & STATUS_ALL || 
        ctx->side_condition[ai->defenderSide] & SIDE_STATUS_SAFEGUARD ||
        ai->defenderAbility == ABILITY_LIMBER ||
        (ai->defenderAbility == ABILITY_LEAF_GUARD && ctx->field_condition & WEATHER_SUNNY_ANY)|| 
        (ai->defenderAbility == ABILITY_HYDRATION && ctx->field_condition & WEATHER_RAIN_ANY) ||
        (ai->defenderAbility == ABILITY_MAGIC_GUARD && ctx->battlemon[attacker].speed > ctx->battlemon[ai->defender].speed)) ||
        (IsClientGrounded(ctx, ai->defender) && ctx->terrainOverlay.type == MISTY_TERRAIN) ;
    ai->defenderImmuneToBurn =  
        (ai->defenderType1 == TYPE_FIRE || ai->defenderType2 == TYPE_FIRE ||
        ctx->battlemon[ai->defender].condition & STATUS_ALL || 
        ctx->side_condition[ai->defenderSide] & SIDE_STATUS_SAFEGUARD ||
        ai->defenderAbility == ABILITY_MAGIC_GUARD ||
        ai->defenderAbility == ABILITY_WATER_VEIL ||
        ai->defenderAbility == ABILITY_THERMAL_EXCHANGE) ||
        (ai->defenderAbility == ABILITY_LEAF_GUARD && ctx->field_condition & WEATHER_SUNNY_ANY)|| 
        (ai->defenderAbility == ABILITY_HYDRATION && ctx->field_condition & WEATHER_RAIN_ANY) ||
        (IsClientGrounded(ctx, ai->defender) && ctx->terrainOverlay.type == MISTY_TERRAIN);
    ai->defenderImmuneToSleep = (ctx->battlemon[ai->defender].condition & STATUS_ALL || 
        ctx->side_condition[ai->defenderSide] & SIDE_STATUS_SAFEGUARD ||
        ai->defenderAbility == ABILITY_VITAL_SPIRIT ||
        ai->defenderAbility == ABILITY_INSOMNIA || 
        (ai->defenderAbility == ABILITY_LEAF_GUARD && ctx->field_condition & WEATHER_SUNNY_ANY)|| 
        (ai->defenderAbility == ABILITY_HYDRATION && ctx->field_condition & WEATHER_RAIN_ANY) ||
        (ai->defenderAbility == ABILITY_MAGIC_GUARD && ctx->battlemon[attacker].speed > ctx->battlemon[ai->defender].speed)||
        (IsClientGrounded(ctx, ai->defender) && (ctx->terrainOverlay.type == ELECTRIC_TERRAIN ||ctx->terrainOverlay.type == MISTY_TERRAIN)));
    ai->attackerMoveEffectiveness = 0;
    ai->partySizeAttacker = Battle_GetClientPartySize(bsys, attacker);
    ai->livingMembersAttacker = 0;
    ai->partySizeDefender = Battle_GetClientPartySize(bsys, ai->defender);
    ai->livingMembersDefender = 0;
    ai->statusedMonsAttacker = 0;
    ai->damagedMonsDefender = 0;

    /*Check if attacker's team has anyone that is statused or damaged.
    Also compute number of living members on attacker's team.*/
    for (int i = 0; i < ai->partySizeAttacker; i++) {
        struct PartyPokemon * currentMonAttacking = Battle_GetClientPartyMon(bsys, attacker, i);

        if(!(GetMonData(currentMonAttacking, MON_DATA_HP, 0) == 0 ||
        GetMonData(currentMonAttacking, MON_DATA_SPECIES_OR_EGG, 0) == 0||
        GetMonData(currentMonAttacking, MON_DATA_SPECIES_OR_EGG, 0) == 494)){

            ai->livingMembersAttacker++;
            work = GetMonData(currentMonAttacking, MON_DATA_STATUS, NULL);
            if(GetMonData(currentMonAttacking, MON_DATA_HP, 0) !=
            GetMonData(currentMonAttacking, MON_DATA_MAXHP, 0)){
                ai->damagedMonsDefender++;
            }
            if(!(work & STATUS_NONE)){
                ai->statusedMonsAttacker++;
            }
        }
    }

    /*Loop over defending team*/
    for (int i = 0; i < ai->partySizeDefender; i++) {
        struct PartyPokemon * currentMonDefending = Battle_GetClientPartyMon(bsys, ai->defender, i);
        if(!(GetMonData(currentMonDefending, MON_DATA_HP, 0) == 0 ||
        GetMonData(currentMonDefending, MON_DATA_SPECIES_OR_EGG, 0) == 0||
        GetMonData(currentMonDefending, MON_DATA_SPECIES_OR_EGG, 0) == 494)){
            ai->livingMembersDefender++;
        }
    }

    ai->damagedMonsDefender = 0;
    ai->statusedMonsAttacker = 0;
    ai->attackerKnowsPsychUp = 0;
    ai->attackerMovesKnown = GetBattlerLearnedMoveCount(bsys, ctx, attacker);
    ai->attackerHasSupereffectiveMove = 0;
    ai->attackerHasDamagingMove = 0;
    ai->turnsToGetKilled = 0;
    ai->defenderHasPhysicalMove = 0;
    ai->defenderHasSpecialMove = 0;

    int attackerMoveCheck;
    int attackerEffectCheck;
    int attackerMoveTypeCheck;
    int specialMovePower = 0;

    /*Loop over defender's moves, and compute the max of all min roll damages*/
    int currentReceivedDamage = 0;
    for (int i = 0; i < GetBattlerLearnedMoveCount(bsys, ctx, ai->defender); i++){
        if(ctx->moveTbl[ctx->battlemon[ai->defender].move[i]].split != SPLIT_STATUS){
            if(attackerEffectCheck == MOVE_EFFECT_RANDOM_POWER_10_CASES){ //average magnitude power
                specialMovePower = 71;
            }
            currentReceivedDamage = CalcBaseDamage(bsys, ctx, ctx->battlemon[ai->defender].move[i], ctx->side_condition[ai->attackerSide],ctx->field_condition, specialMovePower, 0, ai->attacker, ai->defender, ctx->critical);
            currentReceivedDamage = ServerDoTypeCalcMod(bsys, ctx, ctx->battlemon[ai->defender].move[i], 0, ai->defender, ai->attacker, currentReceivedDamage, &temp); // looking at MAX ROLL, not min roll. 
            currentReceivedDamage = AdjustUnusualMoveDamage(bsys, ai->defender, ai->attacker, currentReceivedDamage, ctx->battlemon[ai->defender].move[i], ai);
            if(currentReceivedDamage > ai->maxDamageReceived){
                ai->maxDamageReceived = currentReceivedDamage;
            }

            if(ctx->moveTbl[ctx->battlemon[ai->defender].move[i]].split == SPLIT_PHYSICAL)
            {
                ai->defenderHasPhysicalMove = 1;
            } else {
                ai->defenderHasSpecialMove = 1;
            }
        }
        
    }
    ai->turnsToGetKilled = ai->attackerHP / (ai->maxDamageReceived + 1) + 1;


    /*Loop over all moves for checking certain conditions*/
    /*Set up max roll damage calculations for all known moves.
    Also check if user has a super-effective move*/
    for(int i = 0; i < ai->attackerMovesKnown; i++){

        attackerMoveCheck = ctx->battlemon[attacker].move[i];
        attackerEffectCheck = ctx->moveTbl[attackerMoveCheck].effect;
        attackerMoveTypeCheck = ctx->moveTbl[attackerMoveCheck].type;
        specialMovePower = 0;
        if(attackerEffectCheck == MOVE_EFFECT_RANDOM_POWER_10_CASES){ //average magnitude power
            specialMovePower = 71;
        }
        ai->attackerMaxRollMoveDamages[i] = CalcBaseDamage(bsys, ctx, attackerMoveCheck, ctx->side_condition[ai->defenderSide],ctx->field_condition, specialMovePower, 0, ai->attacker, ai->defender, NULL);
        ai->attackerMaxRollMoveDamages[i] = ServerDoTypeCalcMod(bsys, ctx, attackerMoveCheck, 0, attacker, ai->defender, ai->attackerMaxRollMoveDamages[i], &temp);
        ai->attackerMaxRollMoveDamages[i] = AdjustUnusualMoveDamage(bsys, ai->attacker, ai->defender, ai->attackerMaxRollMoveDamages[i], attackerEffectCheck, ai);
        ai->attackerMinRollMoveDamages[i] = ai->attackerMaxRollMoveDamages[i] * 85 / 100;
        ai->attackerRandomRollMoveDamages[i] = ai->attackerMaxRollMoveDamages[i] * (100 - (gf_rand() % 15)) / 100;

        /*Record our highest damage output*/
        if(ai->attackerRandomRollMoveDamages[i] > ai->attackerMaxDamageOutputMinRoll){
            ai->attackerMaxDamageOutputMinRoll = ai->attackerRandomRollMoveDamages[i];
        }

        if(ai->attackerRandomRollMoveDamages[i] > 0){
            ai->attackerHasDamagingMove = 1;
        }
        if(attackerMoveCheck == MOVE_PSYCH_UP){
            ai->attackerKnowsPsychUp = 1;
        }

        AITypeCalc(ctx, attackerMoveCheck, attackerMoveTypeCheck, ai->attackerAbility, ai->defenderAbility, ai->holdEffect, ai->defenderType1, ai->defenderType2, & ai->attackerMoveEffectiveness);
        if(ai->attackerMoveEffectiveness == MOVE_STATUS_FLAG_SUPER_EFFECTIVE){
            ai->attackerHasSupereffectiveMove = 1;
        }

    }
    ai->turnsToKill = ai->defenderHP / (ai->attackerMaxDamageOutputMinRoll + 1) + 1;
}

/*Adjusts the computed damage for attacks like multihit or flat damage moves.*/
int AdjustUnusualMoveDamage(struct BattleSystem *bsys, u32 attacker, u32 defender, int damage, int effect, AIContext *ai){
    struct BattleStruct *ctx = bsys->sp;
    switch(effect){
        case MOVE_EFFECT_MULTI_HIT:
            if (ctx->battlemon[attacker].ability == ABILITY_SKILL_LINK){
                return damage *= 5;
            }
            else if(ctx->battlemon[attacker].item == ITEM_LOADED_DICE){
                return damage *= 4;
            }
            else{
                return damage *= 3; //average of 2-5 hits
            }
            return damage *= 3;
        case MOVE_EFFECT_LEVEL_DAMAGE_FLAT:
        case MOVE_EFFECT_RANDOM_DAMAGE_1_TO_150_LEVEL:
            return ctx->battlemon[attacker].level;
        case MOVE_EFFECT_10_DAMAGE_FLAT:
            return 20;
        case MOVE_EFFECT_40_DAMAGE_FLAT:
            return 40;
        case MOVE_EFFECT_POISON_MULTI_HIT:
        case MOVE_EFFECT_HIT_TWICE:
            return damage *= 2; 
        case MOVE_EFFECT_HALVE_HP:
            return ctx->battlemon[defender].hp / 2;
        case MOVE_EFFECT_SET_HP_EQUAL_TO_USER:
            return ctx->battlemon[defender].hp - ctx->battlemon[attacker].hp;
        case MOVE_EFFECT_DOUBLE_DAMAGE_ON_STATUS:
            if(!ctx->battlemon[defender].condition & STATUS_NONE){
                return damage * 2;
            }
        default:
            return damage;   
    }
}

/*Returns the true move power of variable power moves like reversal or magnitude*/
int AdjustUnusualMovePower(struct BattleSystem *bsys, u32 attacker, u32 defender, int moveEffect, AIContext *ai){
    struct BattleStruct *ctx = bsys->sp;
    switch(moveEffect){
        case MOVE_EFFECT_RANDOM_POWER_10_CASES:
            return 71; //average power
        case MOVE_EFFECT_INCREASE_POWER_WITH_LESS_HP:
            if(ai->attackerPercentHP <= 4){
                return 200;
            }
            else if(ai->attackerPercentHP <= 10){
                return 150;
            }
            else if(ai->attackerPercentHP <= 21){
                return 100;
            }
            else if(ai->attackerPercentHP <= 35){
                return 80;
            }
            else if(ai->attackerPercentHP <= 69){
                return 40;
            }
            else{
                return 20;
            }
    }
    return 0;
}