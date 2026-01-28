.include "asm/include/battle_commands.inc"

.data

_000:
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_PAY_DAY_COUNT, 2, _spikesWeather
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_PAY_DAY_COUNT, 4, _randomTerrain
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_PAY_DAY_COUNT, 6, _enemyTailwind
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_PAY_DAY_COUNT, 8, _enemyTailwind

    UpdateVar OPCODE_SET, BSCRIPT_VAR_MSG_MOVE_TEMP, MOVE_TRICK_ROOM
    PlayMoveAnimation BATTLER_CATEGORY_MSG_TEMP
    Wait 
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MOVE_EFFECT_CHANCE, 0
    UpdateVar OPCODE_FLAG_OFF, BSCRIPT_VAR_BATTLE_STATUS, BATTLE_STATUS_MOVE_ANIMATIONS_OFF
    // The dimensions became distorted!
    PrintMessage 1267, TAG_NONE
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_FIELD_CONDITION, FIELD_CONDITION_TRICK_ROOM_INIT
    End 

_spikesWeather:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MSG_MOVE_TEMP, MOVE_SPIKES
    PlayMoveAnimation BATTLER_CATEGORY_MSG_TEMP
    Wait 

    UpdateVar OPCODE_SET, BSCRIPT_VAR_BATTLER_ATTACKER, 1
    UpdateVar OPCODE_SET, BSCRIPT_VAR_BATTLER_TARGET, 0

    TrySpikes _010
    AddEntryHazardToQueue BATTLER_CATEGORY_DEFENDER, HAZARD_IDX_SPIKES
    // Spikes were scattered all around your team’s feet!
    PrintMessage 427, TAG_NONE_SIDE, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30

    UpdateVar OPCODE_SET, BSCRIPT_VAR_BATTLER_ATTACKER, 1
    UpdateVar OPCODE_SET, BSCRIPT_VAR_BATTLER_TARGET, 0

    TryToxicSpikes _010
    AddEntryHazardToQueue BATTLER_CATEGORY_DEFENDER, HAZARD_IDX_TOXIC_SPIKES
    // Poison spikes were scattered all around your team’s feet!
    PrintMessage 1063, TAG_NONE_SIDE, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_SET, BSCRIPT_VAR_PAY_DAY_COUNT, 0
    End 

_randomTerrain:
    // strange energy
    PrintMessage 621, TAG_NONE_SIDE
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_SET, BSCRIPT_VAR_PAY_DAY_COUNT, 0
    Call BATTLE_SUBSCRIPT_CREATE_TERRAIN_OVERLAY
    End

_enemyTailwind:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_MSG_MOVE_TEMP, MOVE_TAILWIND
    PlayMoveAnimation BATTLER_CATEGORY_MSG_TEMP
    Wait

    // The Tailwind blew from behind your team!
    PrintMessage 1230, TAG_NONE_SIDE, BATTLER_CATEGORY_ENEMY
    Wait 
    WaitButtonABTime 30
    SetTailwindCounter BATTLER_CATEGORY_ENEMY
    UpdateVar OPCODE_SET, BSCRIPT_VAR_PAY_DAY_COUNT, 0
    End

_010:
    End
