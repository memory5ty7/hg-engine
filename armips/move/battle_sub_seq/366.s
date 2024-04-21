.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

// Weather Magnet Rise

.create "build/move/battle_sub_seq/1_366", 0

a030_366:
    ifmonstat IF_EQUAL, BATTLER_ATTACKER, MON_DATA_TYPE_1, 0x2, _0090
    ifmonstat IF_EQUAL, BATTLER_ATTACKER, MON_DATA_TYPE_2, 0x2, _0090
    ifmonstat IF_NOTEQUAL, BATTLER_ATTACKER, MON_DATA_79, 0x0, _0090
    abilitycheck 0x0, BATTLER_ATTACKER, ABILITY_LEVITATE, _0090
    ifmonstat IF_MASK, BATTLER_ATTACKER, MON_DATA_MOVE_STATE, 0x400, _0090
    changemondatabyvalue VAR_OP_SETMASK, BATTLER_ATTACKER, 0x3B, 0x8000000
    changemondatabyvalue VAR_OP_SET, BATTLER_ATTACKER, 0x4F, 0x5
    printmessage 0x409, 0x2, 0x1, "NaN", "NaN", "NaN", "NaN", "NaN"
    waitmessage
    changevar VAR_OP_SET, VAR_ADD_STATUS1, 0x2000005A
    endscript
_0090:
    endscript

.close