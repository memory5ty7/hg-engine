.nds
.thumb

.open "base/overlay/overlay_0015.bin", 0x021F9380

.org 0x021FBA44

	ldr r0, =ITEM_REPELLENT
    cmp r5, r0
    beq 0x021FBA50
	b 0x21FBA5C

.pool
.close