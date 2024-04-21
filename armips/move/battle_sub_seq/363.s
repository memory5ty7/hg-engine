.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/battle_sub_seq/1_363", 0

// Weather Spikes

a030_363:
    changevar VAR_OP_SET, VAR_ATTACKER, 0x1
    tryspikes _002C
    tryspikes _002C
    tryspikes _002C
    printmessage 0x1AB, 0x0, 0x13, "NaN", "NaN", "NaN", "NaN", "NaN"
    waitmessage
    changevar VAR_OP_SET, VAR_ADD_STATUS2, 0x2000005A
    endscript
_002C:
    endscript

.close
