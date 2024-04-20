.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/battle_sub_seq/1_359", 0

// Weather Stealth Rocks

a001_359:
    changevar VAR_OP_SETMASK, VAR_SIDE_EFFECT_OPPONENT, 0x80
    printmessage 0x435, 0x0, 0x13, "NaN", "NaN", "NaN", "NaN", "NaN"
    waitmessage
    changevar VAR_OP_SET, VAR_ADD_STATUS2, 0x2000005A
    endscript

.close
