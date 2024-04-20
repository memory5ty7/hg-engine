.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/battle_sub_seq/1_362", 0

// Weather Tailwind

a001_362:
    printmessage 1231, TAG_NONE_DIR, BATTLER_DEFENDER, "NaN", "NaN", "NaN", "NaN", "NaN"
    waitmessage
    wait 0x1E
    settailwind BATTLER_OPPONENT
    endscript

.close

