.nds
.thumb

// TM Palette change ASM by Drayano60

.open "base/arm9.bin", 0x02000000

PALETTE_FIGHTING equ 398
PALETTE_DRAGON equ 399
PALETTE_WATER equ 400
PALETTE_PSYCHIC equ 401
PALETTE_NORMAL equ 402
PALETTE_POISON equ 403
PALETTE_ICE equ 404
PALETTE_GRASS equ 405
PALETTE_FIRE equ 406
PALETTE_DARK equ 407
PALETTE_STEEL equ 408
PALETTE_ELECTRIC equ 409
PALETTE_GROUND equ 410
PALETTE_GHOST equ 411
PALETTE_ROCK equ 412
PALETTE_FLYING equ 413
PALETTE_BUG equ 610

PALETTE_FAIRY equ 401   

// Start of TM Palette Table
.org 0x02100BD6

// TM01
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// TM02
.skip 2
.halfword PALETTE_DRAGON
.skip 4

// TM03
.skip 2
.halfword PALETTE_WATER
.skip 4

// TM04
.skip 2
.halfword PALETTE_FIGHTING
.skip 4

// TM05
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// TM06
.skip 2
.halfword PALETTE_GROUND
.skip 4

// TM07
.skip 2
.halfword PALETTE_DARK
.skip 4

// TM08
.skip 2
.halfword PALETTE_FAIRY
.skip 4

// TM09
.skip 2
.halfword PALETTE_FIGHTING
.skip 4

// TM10
.skip 2
.halfword PALETTE_WATER
.skip 4

// TM11
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM12
.skip 2
.halfword PALETTE_WATER
.skip 4

// TM13
.skip 2
.halfword PALETTE_ICE
.skip 4

// TM14
.skip 2
.halfword PALETTE_DRAGON
.skip 4

// TM15
.skip 2
.halfword PALETTE_FIRE
.skip 4

// TM16
.skip 2
.halfword PALETTE_ELECTRIC
.skip 4

// TM17
.skip 2
.halfword PALETTE_ICE
.skip 4

// TM18
.skip 2
.halfword PALETTE_FIGHTING
.skip 4

// TM19
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM20
.skip 2
.halfword PALETTE_FAIRY
.skip 4

// TM21
.skip 2
.halfword PALETTE_GHOST
.skip 4

// TM22
.skip 2
.halfword PALETTE_BUG
.skip 4

// TM23
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM24
.skip 2
.halfword PALETTE_ELECTRIC
.skip 4

// TM25
.skip 2
.halfword PALETTE_FLYING
.skip 4

// TM26
.skip 2
.halfword PALETTE_GROUND
.skip 4

// TM27
.skip 2
.halfword PALETTE_POISON
.skip 4

// TM28
.skip 2
.halfword PALETTE_BUG
.skip 4

// TM29
.skip 2
.halfword PALETTE_PSYCHIC
.skip 4

// TM30
.skip 2
.halfword PALETTE_GHOST
.skip 4

// TM31
.skip 2
.halfword PALETTE_FIGHTING
.skip 4

// TM32
.skip 2
.halfword PALETTE_ICE
.skip 4

// TM33
.skip 2
.halfword PALETTE_PSYCHIC
.skip 4

// TM34
.skip 2
.halfword PALETTE_DRAGON
.skip 4

// TM35
.skip 2
.halfword PALETTE_FIRE
.skip 4

// TM36
.skip 2
.halfword PALETTE_BUG
.skip 4

// TM37
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM38
.skip 2
.halfword PALETTE_GROUND
.skip 4

// TM39
.skip 2
.halfword PALETTE_ROCK
.skip 4

// TM40
.skip 2
.halfword PALETTE_FLYING
.skip 4

// TM41
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM42
.skip 2
.halfword PALETTE_FIRE
.skip 4

// TM43
.skip 2
.halfword PALETTE_ELECTRIC
.skip 4

// TM44
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM45
.skip 2
.halfword PALETTE_GHOST
.skip 4

// TM46
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM47
.skip 2
.halfword PALETTE_POISON
.skip 4

// TM48
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM49
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM50
.skip 2
.halfword PALETTE_ROCK
.skip 4

.close
