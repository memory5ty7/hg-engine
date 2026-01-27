.nds
.thumb

// Thankyou Drayano!
// Edits the palettes of modified TMs
// No palettes for fairy as yet, using psychic as placeholder in interim
// Between any two TMs we can skip 8 * (TM gap - 1) extra bytes (this is only relevant if in future more TMs are able to be added and bytes need to be skipped; or if you want to delete a TM for some reason. Otherwise no additional TM gap required)

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

// TM001 HIGH_HORSEPOWER
.skip 2
.halfword PALETTE_GROUND
.skip 4

// TM002 DRAGON_CLAW
.skip 2
.halfword PALETTE_DRAGON
.skip 4

// TM003 WATER_PULSE
.skip 2
.halfword PALETTE_WATER
.skip 4

// TM004 FEINT_ATTACK
.skip 2
.halfword PALETTE_DARK
.skip 4

// TM005 ROAR
.skip 2
.halfword PALETTE_FAIRY
.skip 4

// TM006 FIRE_PUNCH
.skip 2
.halfword PALETTE_FIRE
.skip 4

// TM007 THUNDER_PUNCH
.skip 2
.halfword PALETTE_ELECTRIC
.skip 4

// TM008 ICE_PUNCH
.skip 2
.halfword PALETTE_ICE
.skip 4

// TM009 BULLET_SEED
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM010 MAGICAL_LEAF
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM011 LIQUIDATION
.skip 2
.halfword PALETTE_WATER
.skip 4

// TM012 TAUNT
.skip 2
.halfword PALETTE_DARK
.skip 4

// TM013 ICE_BEAM
.skip 2
.halfword PALETTE_ICE
.skip 4

// TM014 BLIZZARD
.skip 2
.halfword PALETTE_ICE
.skip 4

// TM015 SEISMIC_TOSS
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// TM016 PSYBEAM
.skip 2
.halfword PALETTE_PSYCHIC
.skip 4

// TM017 PROTECT
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// TM018 BREAKING_SWIPE
.skip 2
.halfword PALETTE_DRAGON
.skip 4

// TM019 GIGA_DRAIN
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM020 SAFEGUARD
.skip 2
.halfword PALETTE_WATER
.skip 4

// TM021 TAILWIND
.skip 2
.halfword PALETTE_FLYING
.skip 4

// TM022 SOLARBEAM
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM023 SOLAR_BLADE
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM024 THUNDERBOLT
.skip 2
.halfword PALETTE_ELECTRIC
.skip 4

// TM025 THUNDER
.skip 2
.halfword PALETTE_ELECTRIC
.skip 4

// TM026 EARTHQUAKE
.skip 2
.halfword PALETTE_GROUND
.skip 4

// TM027 ICY_WIND
.skip 2
.halfword PALETTE_ICE
.skip 4

// TM028 HYDRO_PUMP
.skip 2
.halfword PALETTE_WATER
.skip 4

// TM029 PSYCHIC
.skip 2
.halfword PALETTE_PSYCHIC
.skip 4

// TM030 SHADOW_BALL
.skip 2
.halfword PALETTE_GHOST
.skip 4

// TM031 BRICK_BREAK
.skip 2
.halfword PALETTE_FIGHTING
.skip 4

// TM032 DOUBLE_TEAM
.skip 2
.halfword PALETTE_DRAGON
.skip 4

// TM033 REFLECT
.skip 2
.halfword PALETTE_POISON
.skip 4

// TM034 SHOCK_WAVE
.skip 2
.halfword PALETTE_ELECTRIC
.skip 4

// TM035 FLAMETHROWER
.skip 2
.halfword PALETTE_FIRE
.skip 4

// TM036 SLUDGE_BOMB
.skip 2
.halfword PALETTE_POISON
.skip 4

// TM037 SANDSTORM
.skip 2
.halfword PALETTE_DARK
.skip 4

// TM038 FIRE_BLAST
.skip 2
.halfword PALETTE_FIRE
.skip 4

// TM039 ROCK_TOMB
.skip 2
.halfword PALETTE_ROCK
.skip 4

// TM040 AERIAL_ACE
.skip 2
.halfword PALETTE_FLYING
.skip 4

// TM041 NIGHT_SHADE
.skip 2
.halfword PALETTE_GHOST
.skip 4

// TM042 FACADE
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// TM043 HYPER_VOICE
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// TM044 RAPID_SPIN
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// TM045 ATTRACT
.skip 2
.halfword PALETTE_WATER
.skip 4

// TM046 WEATHER_BALL
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// TM047 STEEL_WING
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM048 VOLT_SWITCH
.skip 2
.halfword PALETTE_ELECTRIC
.skip 4

// TM049 BODY_PRESS
.skip 2
.halfword PALETTE_FIGHTING
.skip 4

// TM050 OVERHEAT
.skip 2
.halfword PALETTE_FIRE
.skip 4

// TM051 ROOST
.skip 2
.halfword PALETTE_FLYING
.skip 4

// TM052 FOCUS_BLAST
.skip 2
.halfword PALETTE_FIGHTING
.skip 4

// TM053 ENERGY_BALL
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM054 ROCK_BLAST
.skip 2
.halfword PALETTE_ROCK
.skip 4

// TM055 HEAVY_SLAM
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM056 AURA_SPHERE
.skip 2
.halfword PALETTE_FIGHTING
.skip 4

// TM057 DUAL_WINGBEAT
.skip 2
.halfword PALETTE_FLYING
.skip 4

// TM058 ENDURE
.skip 2
.halfword PALETTE_WATER
.skip 4

// TM059 DRAGON_PULSE
.skip 2
.halfword PALETTE_DRAGON
.skip 4

// TM060 ICICLE_CRASH
.skip 2
.halfword PALETTE_ICE
.skip 4

// TM061 WILL_O_WISP
.skip 2
.halfword PALETTE_FIRE
.skip 4

// TM062 MOVE_BUG_BITE
.skip 2
.halfword PALETTE_BUG
.skip 4

// TM063 PSYCHIC_FANGS
.skip 2
.halfword PALETTE_PSYCHIC
.skip 4

// TM064 EXPLOSION
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// TM065 SHADOW_CLAW
.skip 2
.halfword PALETTE_GHOST
.skip 4

// TM066 PAYBACK
.skip 2
.halfword PALETTE_DARK
.skip 4

// TM067 SMART_STRIKE
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM068 EARTH_POWER
.skip 2
.halfword PALETTE_GROUND
.skip 4

// TM069 ZEN_HEADBUTT
.skip 2
.halfword PALETTE_PSYCHIC
.skip 4

// TM070 FLASH
.skip 2
.halfword PALETTE_FIGHTING
.skip 4

// TM071 STONE_EDGE
.skip 2
.halfword PALETTE_ROCK
.skip 4

// TM072 AVALANCHE
.skip 2
.halfword PALETTE_ICE
.skip 4

// TM073 THUNDER_WAVE
.skip 2
.halfword PALETTE_ELECTRIC
.skip 4

// TM074 GYRO_BALL
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM075 IRON_HEAD
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM076 STRUGGLE_BUG
.skip 2
.halfword PALETTE_BUG
.skip 4

// TM077 HURRICANE
.skip 2
.halfword PALETTE_FLYING
.skip 4

// TM078 FROST_BREATH
.skip 2
.halfword PALETTE_ICE
.skip 4

// TM079 DARK_PULSE
.skip 2
.halfword PALETTE_DARK
.skip 4

// TM080 ROCK_SLIDE
.skip 2
.halfword PALETTE_ROCK
.skip 4

// TM081 X_SCISSOR
.skip 2
.halfword PALETTE_BUG
.skip 4

// TM082 ELECTROWEB
.skip 2
.halfword PALETTE_ELECTRIC
.skip 4

// TM083 BULLDOZE
.skip 2
.halfword PALETTE_GROUND
.skip 4

// TM084 POISON_JAB
.skip 2
.halfword PALETTE_POISON
.skip 4

// TM085 DEFOG
.skip 2
.halfword PALETTE_FLYING
.skip 4

// TM086 GRASS_KNOT
.skip 2
.halfword PALETTE_GRASS
.skip 4

// TM087 DRAINING_KISS
.skip 2
.halfword PALETTE_FAIRY
.skip 4

// TM088 PLUCK
.skip 2
.halfword PALETTE_FLYING
.skip 4

// TM089 U_TURN
.skip 2
.halfword PALETTE_BUG
.skip 4

// TM090 PLAY_ROUGH
.skip 2
.halfword PALETTE_FAIRY
.skip 4

// TM091 FLASH_CANNON
.skip 2
.halfword PALETTE_STEEL
.skip 4

// TM092 DAZZLING_GLEAM
.skip 2
.halfword PALETTE_FAIRY
.skip 4

// HM001 CUT
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// HM002 FLY
.skip 2
.halfword PALETTE_FLYING
.skip 4

// HM003 SURF
.skip 2
.halfword PALETTE_WATER
.skip 4

// HM004 STRENGTH
.skip 2
.halfword PALETTE_NORMAL
.skip 4

// HM005 WHIRLPOOL
.skip 2
.halfword PALETTE_WATER
.skip 4

// HM006 ROCK_SMASH
.skip 2
.halfword PALETTE_FIGHTING
.skip 4

// HM007 WATERFALL
.skip 2
.halfword PALETTE_WATER
.skip 4

// HM008 ROCK_CLIMB
.skip 2
.halfword PALETTE_NORMAL
.skip 4

.close
