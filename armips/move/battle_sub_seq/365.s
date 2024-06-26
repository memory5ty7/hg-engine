.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"
.include "armips/include/constants.s"

.create "build/move/battle_sub_seq/1_365", 0

GRASSY_TERRAIN_APPLY_MSG equ (1388)
MISTY_TERRAIN_APPLY_MSG equ (1390)
ELECTRIC_TERRAIN_APPLY_MSG equ (1392)
PSYCHIC_TERRAIN_APPLY_MSG equ (1394)

// Weather Terrain

a001_365:
    updateterrainoverlay FALSE, DefaultOrEnd
    playanimation BATTLER_ATTACKER
    waitmessage
ifterrainoverlayistype GRASSY_TERRAIN, GrassyTerrainMessage
ifterrainoverlayistype MISTY_TERRAIN, MistyTerrainMessage
ifterrainoverlayistype ELECTRIC_TERRAIN, ElectricTerrainMessage
ifterrainoverlayistype PSYCHIC_TERRAIN, PsychicTerrainMessage
    goto DefaultOrEnd
GrassyTerrainMessage:
    printmessage GRASSY_TERRAIN_APPLY_MSG, TAG_NONE, "NaN", "NaN", "NaN", "NaN", "NaN", "NaN" // Grass grew to cover the battlefield!
    goto PostMessage
MistyTerrainMessage:
    printmessage MISTY_TERRAIN_APPLY_MSG, TAG_NONE, "NaN", "NaN", "NaN", "NaN", "NaN", "NaN" // Mist swirled about the battlefield!
    goto PostMessage
ElectricTerrainMessage:
    printmessage ELECTRIC_TERRAIN_APPLY_MSG, TAG_NONE, "NaN", "NaN", "NaN", "NaN", "NaN", "NaN" // An electric current ran across the battlefield!
    goto PostMessage
PsychicTerrainMessage:
    printmessage PSYCHIC_TERRAIN_APPLY_MSG, TAG_NONE, "NaN", "NaN", "NaN", "NaN", "NaN", "NaN" // The battlefield got weird!
PostMessage:
    waitmessage
    wait 0x1E
    changevar VAR_OP_CLEARMASK, VAR_SERVER_STATUS1, 0x4000 // reenable animations
    endscript

DefaultOrEnd:
    endscript

.close

