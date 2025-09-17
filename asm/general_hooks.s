.text
.align 2
.thumb

.global set_starter_hidden_ability_hook
set_starter_hidden_ability_hook:
mov r5, r2
add r4, #8
mul r5, r1
add r1, r4, r5
push {r0-r7}
bl set_starter_hidden_ability
pop {r0-r7}
ldr r2, =0x02096160 | 1
bx r2

.pool


.global ImplementLevelCap_hook
ImplementLevelCap_hook:
ldr r3, =0x206E540 | 1
bl bx_r3
// r0 is level
bl IsLevelAtLevelCap
cmp r0, #1
beq return_to_2245B3E // above level cap
ldr r3, =0x02245A32 | 1
bx r3

return_to_2245B3E:
ldr r3, =0x2245B3E|1
// fall through

bx_r3:
bx r3

.pool


// r0 is level
.global CapRareCandies
CapRareCandies:
bl IsLevelAtLevelCap
cmp r0, #0
bne return_to_208FEFA
mov r0, r4
ldr r3, =0x0201AB0C | 1 // free memory
bl bx_r3
ldr r3, =0x0208FEF4 | 1
bx r3

return_to_208FEFA:
ldr r3, =0x0208FEFA | 1
bx r3


// still needed because function itself is not 0x1C bytes long
.global Bag_HasSpaceForItem_hook
Bag_HasSpaceForItem_hook:
ldr r5, =Bag_HasSpaceForItem_return_address
mov r6, lr
str r6, [r5]
pop {r5-r6}
bl Bag_HasSpaceForItem
ldr r1, =Bag_HasSpaceForItem_return_address
ldr r1, [r1]
mov pc, r1

.pool

Bag_HasSpaceForItem_return_address:
.word 0


// still needed because function itself is not 0x1C bytes long
.global Bag_HasItem_hook
Bag_HasItem_hook:
ldr r5, =Bag_HasItem_return_address
mov r6, lr
str r6, [r5]
pop {r5-r6}
bl Bag_HasItem
ldr r1, =Bag_HasItem_return_address
ldr r1, [r1]
mov pc, r1

.pool

Bag_HasItem_return_address:
.word 0


// still needed because function itself is not 0x1C bytes long
.global CanUseItemOnMonInParty_hook
CanUseItemOnMonInParty_hook:
ldr r5, =CanUseItemOnMonInParty_return_address
mov r6, lr
str r6, [r5]
pop {r5-r6}
bl CanUseItemOnMonInParty
ldr r1, =CanUseItemOnMonInParty_return_address
ldr r1, [r1]
mov pc, r1

.pool

CanUseItemOnMonInParty_return_address:
.word 0

.global PartyMenu_ItemUseFunc_LevelUpLearnMovesLoop_Case6_hook
PartyMenu_ItemUseFunc_LevelUpLearnMovesLoop_Case6_hook:
mov r0, r4
bl PartyMenu_ItemUseFunc_LevelUpLearnMovesLoop_Case6
ldr r1, =0x02081ea6 | 1
bx r1

.global PartyMenu_ItemUseFunc_ReuseItem_hook
PartyMenu_ItemUseFunc_ReuseItem_hook:
mov r0, r4
bl PartyMenu_ItemUseFunc_ReuseItem
ldr r3, =0x02081398 | 1
bx r3

.global ov14_021E61BC_hook
ov14_021E61BC_hook:
    push {r3, r4, r5, r6, lr}
    sub sp, #4

    add  r4, r1, #0
    add  r5, r0, #0

    ldr  r1, [r4, #4]
    ldr  r0, [r5, #8]
    sub  r1, #0x1e
    bl   0x02074644 // Party_GetMonByIndex

    // add  r0, r6, #0     // partyMon dans r0
    // mov r1, #163    // MON_DATA_HP
    // mov r2, #0      // r2 = null
    // bl   0x0206E540 // GetMonData
    // str  r0, [sp, #4] // met curHP dans le stack

    mov  r2, #0
    add  r1, sp, #0
    strb r2, [r1]
    add  r6, r0, #0     // partyMon dans r6
    movs r1, #187 // MON_DATA_MOOD
    add  r2, sp, #0
    bl   0x0206EC40 // SetMonData

    add  r0, r6, #0 // partyMon dans r0
    bl   0x02070DB0 // Mon_GetBoxMon
    add  r3, r0, #0 // boxMon dans r3

    //add  r0, r3, #0 // boxMon dans r0
    //mov  r1, #114 // MON_DATA_RESERVED_114
    //ldr  r2, [sp, #4] // prend curHP du stack
    //bl   0x0206ED70 // SetBoxMonData

    ldrb r1, [r5, #0x1f]
    ldr  r0, [r5, #4]
    ldr  r2, [r4, #8]
    bl   0x02073C6C // PCStorage_PlaceMonInBoxByIndexPair

    ldrb r1, [r5, #0x1f]
    ldr r2, [r4, #4]
    add  r0, r5, #0
    bl   0x021E6100 // ov14_021E6100

    ldrb r1, [r5, #0x1f]
    add  r0, r5, #0
    bl   0x021F4958 // ov14_021F4958

    ldrb r1, [r5, #0x1f]
    add  r0, r5, #0
    bl   0x021F4A20 // ov14_021F4A20

    add  sp, #4
    pop  {r3, r4, r5, r6, pc}