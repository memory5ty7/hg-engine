.nds
.thumb

.open "base/arm9.bin", 0x02000000

// Force Perfect IVs

.org 0x020960E4

.byte 31

.close