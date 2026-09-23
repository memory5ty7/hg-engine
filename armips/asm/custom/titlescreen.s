.nds
.thumb

.open "base/overlay/overlay_0060.bin", 0x021E5900

; Loop forever
.org 0x21E5D38
	.byte 0xE0, 0xAF, 0x1E, 0x02

; Remove glowing animation
.org 0x21E6532
	.word 0x0

; yellow "Touch to start"
.org 0x021E67E0
	.hword 0x3FF

.close