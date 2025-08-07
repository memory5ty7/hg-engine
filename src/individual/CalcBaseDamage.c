#include "../../include/battle.h"
#include "../../include/config.h"
#include "../../include/debug.h"
#include "../../include/overlay.h"
#include "../../include/pokemon.h"
#include "../../include/types.h"
#include "../../include/constants/ability.h"
#include "../../include/constants/hold_item_effects.h"
#include "../../include/constants/file.h"
#include "../../include/constants/item.h"
#include "../../include/constants/move_effects.h"
#include "../../include/constants/moves.h"
#include "../../include/constants/species.h"


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




int UNUSED CalcBaseDamage(void *bw, struct BattleStruct *sp, int moveno, u32 side_cond,
                   u32 field_cond, u16 pow, u8 type UNUSED, u8 attacker, u8 defender, u8 critical)
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

    defense = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_DEF, NULL);
    sp_attack = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_SPATK, NULL);
    sp_defense = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_SPDEF, NULL);

    defstate = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_STATE_DEF, NULL) - 6;
    spatkstate = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_STATE_SPATK, NULL) - 6;
    spdefstate = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_STATE_SPDEF, NULL) - 6;

    level = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_LEVEL, NULL);

    AttackingMon.species = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_SPECIES, NULL);
    DefendingMon.species = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_SPECIES, NULL);
    AttackingMon.hp = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_HP, NULL);
    DefendingMon.hp = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_HP, NULL);
    AttackingMon.maxhp = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_MAX_HP, NULL);
    DefendingMon.maxhp = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_MAX_HP, NULL);
    AttackingMon.condition = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_MAX_CONDITION, NULL);
    DefendingMon.condition = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_MAX_CONDITION, NULL);
    AttackingMon.ability = GetBattlerAbility(sp, attacker);
    DefendingMon.ability = GetBattlerAbility(sp, defender);
    AttackingMon.sex = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_SEX, NULL);
    DefendingMon.sex = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_SEX, NULL);
    AttackingMon.type1 = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_TYPE1, NULL);
    DefendingMon.type1 = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_TYPE1, NULL);
    AttackingMon.type2 = BattlePokemonParamGet(sp, attacker, BATTLE_MON_DATA_TYPE2, NULL);
    DefendingMon.type2 = BattlePokemonParamGet(sp, defender, BATTLE_MON_DATA_TYPE2, NULL);

    item = GetBattleMonItem(sp, attacker);
    AttackingMon.item_held_effect = BattleItemDataGet(sp, item, 1);
    AttackingMon.item_power = BattleItemDataGet(sp, item, 2);

    item = GetBattleMonItem(sp, defender);
    DefendingMon.item_held_effect = BattleItemDataGet(sp, item, 1);
    DefendingMon.item_power = BattleItemDataGet(sp, item, 2);

    battle_type = BattleTypeGet(bw);

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

    
    //=====Step 1. Custom BP=====

    movepower = sp->moveTbl[moveno].power;

    // TODO: Check if there are any moves not ported yet 
    // if (pow == 0) {
    //     debug_printf("First case\n");
    //     movepower = sp->moveTbl[moveno].power;
    // } else {
    //     debug_printf("Second case\n");
    //     movepower = pow;
    // }

    switch (moveno) {
    // Speed-based
    case MOVE_GYRO_BALL:
        if (AttackingMon.speed == 0) {
            movepower = 1;
        } else {
            movepower = (25 * DefendingMon.speed) / AttackingMon.speed;
            movepower = movepower > 150 ? 150 : movepower;
        }
        break;
    case MOVE_ELECTRO_BALL:
        if (DefendingMon.speed == 0) {
            movepower = 40;
        } else {
            switch (AttackingMon.speed / DefendingMon.speed) {
                case 0:
                    movepower = 40;
                    break;
                case 1:
                    movepower = 60;
                    break;
                case 2:
                    movepower = 80;
                    break;
                case 3:
                    movepower = 120;
                    break;
                // 4 or higher
                default:
                    movepower = 150;
                    break;
            }
        }
        break;
    // Weight-based
    case MOVE_LOW_KICK:
    case MOVE_GRASS_KNOT:
        while (sLowKickWeightToPower[i][0] != 0xFFFF) {
            if (sLowKickWeightToPower[i][0] >= DefendingMon.weight) {
                break;
            }
            i++;
        }

        if (sLowKickWeightToPower[i][0] != 0xFFFF) {
            movepower = sLowKickWeightToPower[i][1];
        } else {
            movepower = 120;
        }
        break;
    case MOVE_HEAVY_SLAM:
    case MOVE_HEAT_CRASH:
        switch (AttackingMon.weight / DefendingMon.weight) {
            case 2:
                movepower = 60;
                break;
            case 3:
                movepower = 80;
                break;
            case 4:
                movepower = 100;
                break;
            case 5:
                movepower = 120;
                break;
            // less than 2
            default:
                movepower = 40;
                break;
        }
        break;
    // HP-based
    case MOVE_ERUPTION:
    case MOVE_WATER_SPOUT:
        movepower = (150 * AttackingMon.hp) / AttackingMon.maxhp;
        break;
    case MOVE_FLAIL:
        p = (48 * AttackingMon.hp) / AttackingMon.maxhp;
        if (p >= 32) {
            movepower = 20;
            break;
        }
        if (p >= 17) {
            movepower = 40;
            break;
        }
        if (p >= 10) {
            movepower = 80;
            break;
        }
        if (p >= 5) {
            movepower = 100;
            break;
        }
        if (p >= 2) {
            movepower = 150;
            break;
        }
        if (p <= 1) {
            movepower = 200;
            break;
        }
        break;
    case MOVE_CRUSH_GRIP:
    case MOVE_WRING_OUT:
        // TODO: Check correctness
        movepower = QMul_RoundDown(120 * 100, (DefendingMon.hp * 4096) / DefendingMon.maxhp) / 100;
        break;
    // Happiness-based
    case MOVE_RETURN:
        movepower = AttackingMon.happiness * 10 / 25;
        break;
    case MOVE_FRUSTRATION:
        movepower = (255 - AttackingMon.happiness) * 10 / 25;
        break;
    // Counter-based
    case MOVE_FURY_CUTTER:
        for (int n = 0; n < sp->battlemon[attacker].moveeffect.furyCutterCount; n++) {
            movepower *= 2;
        }
        break;
    case MOVE_ROLLOUT:
    case MOVE_ICE_BALL:
        // TODO: Handle Rollout storage, need to hook `BtlCmd_CalcRolloutPower`
        // For now we use the Gen 4 implementation which is basically the same
        // Edit: Rollout storage seems to be patched

        for (int n = 0; n < 5 - sp->battlemon[attacker].moveeffect.rolloutCount; n++) {
            movepower *= 2;
        }
        break;
    case MOVE_SPIT_UP:
        if (sp->oneTurnFlag[attacker].parental_bond_flag == 2 && sp->battlemon[attacker].ability == ABILITY_PARENTAL_BOND) {
            movepower = sp->damage_power;
        } else {
            movepower = 100 * sp->battlemon[attacker].moveeffect.stockpileCount;
        }
        break;
    // Stat boosts-based
    case MOVE_PUNISHMENT:
        for (int stat = 0; stat < 8; stat++) {
            if (sp->battlemon[defender].states[stat] > 6) {
                positiveStatBoosts += sp->battlemon[defender].states[stat] - 6;
            }
        }
        movepower = 60 + 20 * positiveStatBoosts;
        movepower = movepower > 200 ? 200 : movepower;
        break;
    case MOVE_STORED_POWER:
        for (int stat = 0; stat < 8; stat++) {
            if (sp->battlemon[attacker].states[stat] > 6) {
                positiveStatBoosts += sp->battlemon[attacker].states[stat] - 6;
            }
        }
        movepower = 20 + 20 * positiveStatBoosts;
        break;
    // Dichotomous Base Power
    case MOVE_ACROBATICS:
        if (GetBattleMonItem(sp, attacker) == ITEM_NONE) {
            movepower *= 2;
        }
        break;
    case MOVE_ASSURANCE:
    case MOVE_REVENGE:
        if (sp->oneTurnFlag[defender].assuranceDamage) {
            movepower *= 2;
        }
        break;
    case MOVE_WATER_PLEDGE:
    case MOVE_FIRE_PLEDGE:
    case MOVE_GRASS_PLEDGE:
        // TODO
        break;
    case MOVE_GUST:
    case MOVE_TWISTER:
        // TODO: handle charging turn of Sky Drop
        if (sp->battlemon[defender].effect_of_moves & MOVE_EFFECT_FLAG_FLYING_IN_AIR) {
            movepower *= 2;
        }
        break;
    case MOVE_HEX:
        if (sp->battlemon[defender].condition & STATUS_ALL) {
            movepower *= 2;
        }
        break;
    case MOVE_PAYBACK:
        // TODO: Check correctness
        if (sp->playerActions[defender][0] == CONTROLLER_COMMAND_40) {
            movepower *= 2;
        }
        break;
    case MOVE_PURSUIT:
        // TODO: Handle this massive headache later
        movepower = movepower * sp->damage_value / 10;
        break;
    case MOVE_ROUND:
        // TODO: Implement Round
        break;
    case MOVE_SMELLING_SALTS:
        if (sp->battlemon[defender].condition & STATUS_PARALYSIS) {
            movepower *= 2;
        }
        break;
    case MOVE_STOMPING_TANTRUM:
        // TODO: Implement Stomping Tantrum
        break;
    case MOVE_WAKE_UP_SLAP:
        if (sp->battlemon[defender].condition & STATUS_SLEEP) {
            movepower *= 2;
        }
        break;
    case MOVE_WEATHER_BALL:
        if (!CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE)
        && !CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {
            if ((sp->field_condition & FIELD_CONDITION_WEATHER)
            && !(sp->field_condition & (WEATHER_STRONG_WINDS | WEATHER_SNOW_ANY))) {
                movepower *= 2;
            }
        }
        break;
    case MOVE_WATER_SHURIKEN:
        if (sp->battlemon[sp->attack_client].species == SPECIES_GRENINJA
            && sp->battlemon[sp->attack_client].form_no == 1) {
            movepower = 20;
        }
        break;
    case MOVE_BOLT_BEAK:
        // https://www.smogon.com/forums/threads/sword-shield-battle-mechanics-research.3655528/post-8433978
        break;
    case MOVE_FISHIOUS_REND:
        // https://www.smogon.com/forums/threads/sword-shield-battle-mechanics-research.3655528/post-8433978
        break;
    case MOVE_RISING_VOLTAGE:
        if ((sp->terrainOverlay.numberOfTurnsLeft > 0) && (sp->terrainOverlay.type == ELECTRIC_TERRAIN)) {
            movepower = 140;
        }
        break;
    // Item-based
    case MOVE_FLING:
        // TODO: test Parental Bond interaction
        movepower = sp->damage_power;
        break;
    case MOVE_NATURAL_GIFT:
        movepower = sp->damage_power;
        break;
    // Other
    case MOVE_BEAT_UP:
        for (int i = sp->beat_up_count; i < Battle_GetClientPartySize(bw, sp->attack_client); i++) {
            struct PartyPokemon *mon = Battle_GetClientPartyMon(bw, sp->attack_client, i);
            if ((IsMonValidAndHealthy(mon))) {

                sp->beat_up_count = i + 1;
                sp->multiHitCountTemp++;
                int species = GetMonData(mon, MON_DATA_SPECIES, 0);
                int form = GetMonData(mon, MON_DATA_FORM, 0);
                movepower = 5 + (PokeFormNoPersonalParaGet(species, form, PERSONAL_BASE_ATTACK) / 10);
                break;

            }
        }

        break;
    case MOVE_ECHOED_VOICE:
        // TODO
        break;
    case MOVE_HIDDEN_POWER:
        movepower = 60;
        break;
    case MOVE_MAGNITUDE:
        // TODO: check correctness
        movepower = sp->magnitude;
        break;
    case MOVE_PRESENT:
        movepower = sp->damage_power;
        break;
    case MOVE_TRIPLE_KICK:
        movepower = sp->damage_power;
        break;
    case MOVE_TRUMP_CARD:
        movepower = sp->damage_power;
        break;
    default:
        break;
    }

    sp->damage_power = movepower;
    movetype = GetAdjustedMoveType(sp, attacker, moveno);

    // TODO: Check if there are any moves not ported yet 
    // movepower = movepower * sp->damage_value / 10;

#ifdef DEBUG_DAMAGE_CALC
    debug_printf("\n=================\n");
    debug_printf("[CalcBaseDamage] Step 1. Custom BP\n");
    debug_printf("[CalcBaseDamage] moveno: %d\n", moveno);
    debug_printf("[CalcBaseDamage] movepower: %d\n", movepower);
#endif

    //=====End of Step 1=====

    //=====Step 2. Base Power Modifiers=====

    SortRawSpeedNonRNGArray(bw, sp);

    // Z-move effects:

    // Move effects:

    // handle Helping Hand (+5 priority)
    // TODO: Handle multiple Helping Hand boosts
    if (sp->oneTurnFlag[attacker].helping_hand_flag) {
        basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_5);
    }

    switch (moveno) {
        case MOVE_FACADE:
            if ((AttackingMon.condition & STATUS_FACADE_BOOST)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__2_0);
            }
            break;
        case MOVE_BRINE:
            if (DefendingMon.hp <= DefendingMon.maxhp / 2) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__2_0);
            }
            break;
        case MOVE_KNOCK_OFF:
            if (CanKnockOffApply(bw, sp)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_5);
            }
            break;
        case MOVE_VENOSHOCK:
            if (DefendingMon.condition &STATUS_POISON_ALL) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__2_0);
            }
            break;
        case MOVE_RETALIATE:
            // TODO
            break;
        case MOVE_FUSION_FLARE:
            // TODO
            break;
        case MOVE_FUSION_BOLT:
            // TODO
            break;
        case MOVE_GRAV_APPLE:
            // https://www.smogon.com/forums/threads/sword-shield-battle-mechanics-research.3655528/post-8870357
            if ((sp->field_condition & FIELD_STATUS_GRAVITY)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_5);
            }
            break;
        case MOVE_EXPANDING_FORCE:
            // https://www.smogon.com/forums/threads/sword-shield-battle-mechanics-research.3655528/post-8520635
            if ((sp->terrainOverlay.numberOfTurnsLeft > 0) && (sp->terrainOverlay.type == MISTY_TERRAIN)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_5);
            }
            break;
        case MOVE_MISTY_EXPLOSION:
            // https://www.smogon.com/forums/threads/sword-shield-battle-mechanics-research.3655528/post-8520635
            if ((sp->terrainOverlay.numberOfTurnsLeft > 0) && (sp->terrainOverlay.type == MISTY_TERRAIN)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_5);
            }
            break;
        case MOVE_LASH_OUT:
            // https://www.smogon.com/forums/threads/sword-shield-battle-mechanics-research.3655528/post-8870357
            // TODO
            if (FALSE) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__2_0);
            }
            break;
        

        default:
            break;
    }

    // Effects relative to a particular slot of the field (Wish, Lunar Dance, Future Sight, etc.):

    // handle Charge
    if ((sp->battlemon[attacker].effect_of_moves & MOVE_EFFECT_FLAG_CHARGE)
    && (movetype == TYPE_ELECTRIC)) {
        basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__2_0);
    }

    // handle Me First
    if (sp->battlemon[sp->attack_client].moveeffect.meFirstFlag) {
        if (sp->me_first_total_turns == sp->battlemon[sp->attack_client].moveeffect.meFirstCount) {
            sp->battlemon[sp->attack_client].moveeffect.meFirstCount--;
        }

        if ((sp->me_first_total_turns - sp->battlemon[sp->attack_client].moveeffect.meFirstCount) < 2) {
            basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_5);
        } else {
            sp->battlemon[sp->attack_client].moveeffect.meFirstFlag = 0;
        }
    }

    // Effects relative to a particular side of the field (Tailwind, Safeguard, Pledge combo effects, Wide Guard, etc.):

    // Field effects (weather conditions, Terrains, Imprison, Ion Deluge, Magic Room, Gravity, etc.):

    if ((CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) == 0)
    && (CheckSideAbility(bw, sp, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK) == 0)) {
        if ((field_cond & (FIELD_STATUS_FOG | WEATHER_HAIL_ANY | WEATHER_SANDSTORM_ANY | WEATHER_RAIN_ANY | WEATHER_SNOW_ANY))
        && (moveno == MOVE_SOLAR_BEAM || moveno == MOVE_SOLAR_BLADE)) {
            basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__0_5);
        }
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
    if ((DefendingMon.item_held_effect == HOLD_EFFECT_SPDEF_BOOST_NO_STATUS_MOVES)) {
        sp_defense = sp_defense * 150 / 100;
    }

    // handle eviolite
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
    if ((MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_THICK_FAT) == TRUE) &&
        ((movetype == TYPE_FIRE) || (movetype == TYPE_ICE)))
    {
        movepower /= 2;
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
    if ((MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_MARVEL_SCALE) == TRUE) && (DefendingMon.condition))
    {
        defense = defense * 150 / 100;
    }

    // handle grass pelt
    if ((MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_GRASS_PELT) == TRUE) && (sp->terrainOverlay.type == GRASSY_TERRAIN && sp->terrainOverlay.numberOfTurnsLeft > 0))
    {
        defense = defense * 150 / 100;
    }

    // handle plus/minus
    if (((AttackingMon.ability == ABILITY_PLUS) || (AttackingMon.ability == ABILITY_MINUS)) &&
        (CheckSideAbility(bw, sp, CHECK_ABILITY_SAME_SIDE_HP, attacker, ABILITY_MINUS) ||
        CheckSideAbility(bw, sp, CHECK_ABILITY_SAME_SIDE_HP, attacker, ABILITY_PLUS)))
    {
        sp_attack = sp_attack * 150 / 100;
    }

    // handle fur coat - double defense
    if ((MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_FUR_COAT) == TRUE))
    {
        defense *= 2;
    }

    // Items:

    for (i = 0; i < maxBattlers; i++) {
        if (attacker == sp->rawSpeedNonRNGClientOrder[i]) {
            // Handle Muscle Band
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_POWER_UP_PHYS) && (movesplit == SPLIT_PHYSICAL)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_1);
                continue;
            }

            if ((AttackingMon.item_held_effect == HOLD_EFFECT_POWER_UP_SPEC) && (movesplit == SPLIT_SPECIAL)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_1);
                continue;
            }

            // type boosting held items
            {
                u8 element[2] = {AttackingMon.item_held_effect, movetype};
                if (IsElementInArray(HeldItemPowerUpTable, element, NELEMS(HeldItemPowerUpTable), sizeof(element))) {
                    basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                    continue;
                }
            }

            // handle Adamant Orb
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_DIALGA_BOOST)
            && ((movetype == TYPE_DRAGON) || (movetype == TYPE_STEEL))
            && (AttackingMon.species == SPECIES_DIALGA)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                continue;
            }

            // handle Lustrous Orb
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_PALKIA_BOOST)
            && ((movetype == TYPE_DRAGON) || (movetype == TYPE_WATER))
            && (AttackingMon.species == SPECIES_PALKIA)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                continue;
            }

            // handle Griseous Orb
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_GIRATINA_BOOST)
            && ((movetype == TYPE_DRAGON) || (movetype == TYPE_GHOST))
            && (AttackingMon.species == SPECIES_GIRATINA)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                continue;
            }

            // handle Adamant Crystal, lustrous globe & griseous core
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_DIALGA_BOOST_AND_TRANSFORM)
            && ((movetype == TYPE_DRAGON) || (movetype == TYPE_STEEL))
            && (AttackingMon.species == SPECIES_DIALGA)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                continue;
            }

            // handle Lustrous Globe
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_PALKIA_BOOST_AND_TRANSFORM) 
            && ((movetype == TYPE_DRAGON) || (movetype == TYPE_WATER))
            && (AttackingMon.species == SPECIES_PALKIA)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                continue;
            }

            // handle Griseous Core
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_GIRATINA_BOOST_AND_TRANSFORM)
            && ((movetype == TYPE_DRAGON) || (movetype == TYPE_GHOST))
            && (AttackingMon.species == SPECIES_GIRATINA)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                continue;
            }

            // handle Soul Dew
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_LATI_SPECIAL)
            && ((AttackingMon.species == SPECIES_LATIOS) || (AttackingMon.species == SPECIES_LATIAS))
            && (movetype == TYPE_DRAGON || movetype == TYPE_PSYCHIC)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                continue;
            }

            // handle Gems
            if (sp->gemBoostingMove) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_3);
                continue;
            }

            // handle Punching Glove
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_INCREASE_PUNCHING_MOVE_DMG) && IsElementInArray(PunchingMovesTable, (u16 *)&moveno, NELEMS(PunchingMovesTable), sizeof(PunchingMovesTable[0]))) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_1_BUT_HIGHER);
                continue;
            }

            // handle Wellspring Mask
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_WELLSPRING_MASK)
            && (AttackingMon.species == SPECIES_OGERPON)
            && (AttackingMon.form == 1 || AttackingMon.form == 5)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                continue;
            }

            // handle Hearthflame Mask
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_HEARTHFLAME_MASK)
            && (AttackingMon.species == SPECIES_OGERPON)
            && (AttackingMon.form == 2 || AttackingMon.form == 6)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                continue;
            }

            // handle Cornerstone Mask
            if ((AttackingMon.item_held_effect == HOLD_EFFECT_CORNERSTONE_MASK)
            && (AttackingMon.species == SPECIES_OGERPON)
            && (AttackingMon.form == 3 || AttackingMon.form == 7)) {
                basePowerModifier = QMul_RoundUp(basePowerModifier, UQ412__1_2);
                continue;
            }
        }
        
    }
    
    // Stall (the ability):

    // Apply the chained modifier to the starting base power. That is, multiply the starting base power by the chained base power modifiers, divide by 4096, and pokeRound the result. If the base power would now be less than 1, make it 1. Finally, if the base power is greater than 65,535, make it the the current base power modulo 65,536 (BP % 65536).

    movepower = QMul_RoundDown(movepower, basePowerModifier);
    movepower = movepower < 1 ? 1 : movepower;
    movepower = movepower % 65536;

#ifdef DEBUG_DAMAGE_CALC
    debug_printf("\n=================\n");
    debug_printf("[CalcBaseDamage] Step 2. Base Power Modifiers\n");
    debug_printf("[CalcBaseDamage] basePowerModifier: %d\n", basePowerModifier);
    debug_printf("[CalcBaseDamage] movepower: %d\n", movepower);
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
    if ((movetype == TYPE_FIRE) && (MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_HEATPROOF) == TRUE))
    {
        movepower /= 2;
    }

    if ((movetype == TYPE_FIRE) && (MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_DRY_SKIN) == TRUE))
    {
        movepower = movepower * 125 / 100;
    }

    // handle simple
    // if (AttackingMon.ability == ABILITY_SIMPLE)
    // {
    //     atkstate *= 2;
    //     if (atkstate < -6)
    //     {
    //         atkstate = -6;
    //     }
    //     if (atkstate > 6)
    //     {
    //         atkstate = 6;
    //     }
    //     spatkstate *= 2;
    //     if (spatkstate < -6)
    //     {
    //         spatkstate = -6;
    //     }
    //     if (spatkstate > 6)
    //     {
    //         spatkstate = 6;
    //     }
    // }

    // if (MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_SIMPLE) == TRUE)
    // {
    //     defstate *= 2;
    //     if (defstate < -6)
    //     {
    //         defstate = -6;
    //     }
    //     if (defstate > 6)
    //     {
    //         defstate = 6;
    //     }
    //     spdefstate *= 2;
    //     if (spdefstate < -6)
    //     {
    //         spdefstate = -6;
    //     }
    //     if (spdefstate > 6)
    //     {
    //         spdefstate = 6;
    //     }
    // }

    // handle unaware
    if (MoldBreakerAbilityCheck(sp, attacker, defender, ABILITY_UNAWARE) == TRUE)
    {
        atkstate = 0;
        spatkstate = 0;
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

    damage = equivalentAttack * movepower;
    damage *= (level * 2 / 5 + 2);

    damage = damage / equivalentDefense;
    damage /= 50;

    // handle parental bond
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

    if ((BattlePokemonParamGet(sp, attacker, BATTLE_MON_FLASH_FIRE_ACTIVATED, NULL)) && (movetype == TYPE_FIRE))
    {
        damage = damage * 15 / 10;
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

    return damage + 2;
}
