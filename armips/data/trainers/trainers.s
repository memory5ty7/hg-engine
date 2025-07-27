.nds
.thumb

.include "armips/include/constants.s"
.include "armips/include/macros.s"

.include "asm/include/abilities.inc"
.include "asm/include/items.inc"
.include "asm/include/moves.inc"
.include "asm/include/species.inc"

trainerdata 0, "None"
    trainermontype TRAINER_DATA_TYPE_NOTHING
    trainerclass TRAINERCLASS_NONE
    nummons 0
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags 0
    battletype SINGLE_BATTLE
    endentry

    party 0
        // mon 0
        ivs 0
        abilityslot 0
        level 0
        pokemon SPECIES_NONE
        ballseal 0
    endparty

trainerdata 70, "Phoebe"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_PHOEBE
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 70
        // mon 0
        ivs 255
        abilityslot 0
        level 70
        pokemon SPECIES_PALOSSAND
        item ITEM_PASSHO_BERRY
        move MOVE_SHADOW_BALL
        move MOVE_EARTH_POWER
        move MOVE_ENERGY_BALL
        move MOVE_ANCIENT_POWER
        ability ABILITY_WATER_COMPACTION
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 70
        pokemon SPECIES_CHI_YU
        item ITEM_LIFE_ORB
        move MOVE_FLAMETHROWER
        move MOVE_DARK_PULSE
        move MOVE_PROTECT
        move MOVE_PSYCHIC
        ability ABILITY_BEADS_OF_RUIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 70
        pokemon SPECIES_JELLICENT
        item ITEM_LEFTOVERS
        move MOVE_SCALD
        move MOVE_RECOVER
        move MOVE_SHADOW_BALL
        move MOVE_ICY_WIND
        ability ABILITY_WATER_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 70
        pokemon SPECIES_NIHILEGO
        item ITEM_POWER_HERB
        move MOVE_SLUDGE_BOMB
        move MOVE_METEOR_BEAM
        move MOVE_THUNDERBOLT
        move MOVE_DAZZLING_GLEAM
        ability ABILITY_BEAST_BOOST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 70
        pokemon SPECIES_SABLEYE
        item ITEM_SABLENITE
        move MOVE_KNOCK_OFF
        move MOVE_PROTECT
        move MOVE_SHADOW_CLAW
        move MOVE_FIRE_PUNCH
        ability ABILITY_PRANKSTER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

    endparty

trainerdata 71, "Juan"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_JUAN
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 71
        // mon 0
        ivs 255
        abilityslot 0
        level 71
        pokemon SPECIES_ABOMASNOW
        item ITEM_ABOMASITE
        move MOVE_BLIZZARD
        move MOVE_GIGA_DRAIN
        move MOVE_EARTHQUAKE
        move MOVE_FOCUS_BLAST
        ability ABILITY_SNOW_WARNING
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MILD
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 71
        pokemon SPECIES_KELDEO
        item ITEM_SAFETY_GOGGLES
        move MOVE_SCALD
        move MOVE_SECRET_SWORD
        move MOVE_CALM_MIND
        move MOVE_VACUUM_WAVE
        ability ABILITY_JUSTIFIED
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 71
        pokemon SPECIES_SNEASLER
        item ITEM_AIR_BALLOON
        move MOVE_CLOSE_COMBAT
        move MOVE_DIRE_CLAW
        move MOVE_U_TURN
        move MOVE_NIGHT_SLASH
        ability ABILITY_UNBURDEN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 71
        pokemon SPECIES_WALREIN
        item ITEM_LEFTOVERS
        move MOVE_SURF
        move MOVE_SUPER_FANG
        move MOVE_ROAR
        move MOVE_PROTECT
        ability ABILITY_ICE_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 71
        pokemon SPECIES_WEAVILE
        item ITEM_CHOICE_BAND
        move MOVE_ICICLE_CRASH
        move MOVE_KNOCK_OFF
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_PRESSURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 72, "Misty"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_MISTY
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 72
        // mon 0
        ivs 255
        abilityslot 0
        level 72
        pokemon SPECIES_SUICUNE
        item ITEM_LEFTOVERS
        move MOVE_SCALD
        move MOVE_ICE_BEAM
        move MOVE_TAILWIND
        move MOVE_PROTECT
        ability ABILITY_PRESSURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 72
        pokemon SPECIES_TOGEDEMARU
        item ITEM_SHUCA_BERRY
        move MOVE_ZING_ZAP
        move MOVE_FAKE_OUT
        move MOVE_HELPING_HAND
        move MOVE_SPIKY_SHIELD
        ability ABILITY_LIGHTNING_ROD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 72
        monwithform SPECIES_OGERPON, 1
        item ITEM_WELLSPRING_MASK
        move MOVE_IVY_CUDGEL
        move MOVE_POWER_WHIP
        move MOVE_KNOCK_OFF
        move MOVE_PLAY_ROUGH
        ability ABILITY_WATER_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 72
        pokemon SPECIES_TOGEKISS
        item ITEM_WACAN_BERRY
        move MOVE_AIR_SLASH
        move MOVE_DAZZLING_GLEAM
        move MOVE_FOLLOW_ME
        move MOVE_AURA_SPHERE
        ability ABILITY_SERENE_GRACE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 72
        pokemon SPECIES_BLASTOISE
        item ITEM_BLASTOISINITE
        move MOVE_SCALD
        move MOVE_FAKE_OUT
        move MOVE_FOLLOW_ME
        move MOVE_ICE_BEAM
        ability ABILITY_RAIN_DISH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

    endparty

trainerdata 73, "Nessa"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_NESSA
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 73
        // mon 0
        ivs 255
        abilityslot 0
        level 73
        pokemon SPECIES_TAPU_FINI
        item ITEM_TERRAIN_EXTENDER
        move MOVE_SCALD
        move MOVE_MOONBLAST
        move MOVE_NATURES_MADNESS
        move MOVE_PROTECT
        ability ABILITY_MISTY_SURGE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 73
        pokemon SPECIES_TORNADUS
        item ITEM_WACAN_BERRY
        move MOVE_BLEAKWIND_STORM
        move MOVE_TAILWIND
        move MOVE_TAUNT
        move MOVE_PROTECT
        ability ABILITY_PRANKSTER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 73
        pokemon SPECIES_SWAMPERT
        item ITEM_RINDO_BERRY
        move MOVE_WATERFALL
        move MOVE_HIGH_HORSEPOWER
        move MOVE_ICE_PUNCH
        move MOVE_HAMMER_ARM
        ability ABILITY_TORRENT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 73
        pokemon SPECIES_LAPRAS
        item ITEM_LEFTOVERS
        move MOVE_ICE_BEAM
        move MOVE_REST
        move MOVE_PSYCHIC
        move MOVE_DRAGON_PULSE
        ability ABILITY_HYDRATION
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 73
        pokemon SPECIES_DREDNAW
        item ITEM_WHITE_HERB
        move MOVE_LIQUIDATION
        move MOVE_ROCK_SLIDE
        move MOVE_SHELL_SMASH
        move MOVE_CRUNCH
        ability ABILITY_SWIFT_SWIM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 74, "Guzma"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_GUZMA
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 74
        // mon 0
        ivs 255
        abilityslot 0
        level 74
        pokemon SPECIES_GOLISOPOD
        item ITEM_MUSCLE_BAND
        move MOVE_FIRST_IMPRESSION
        move MOVE_LIQUIDATION
        move MOVE_LEECH_LIFE
        move MOVE_AQUA_JET
        ability ABILITY_EMERGENCY_EXIT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 74
        pokemon SPECIES_ARMALDO
        item ITEM_CHOICE_BAND
        move MOVE_STONE_EDGE
        move MOVE_EARTHQUAKE
        move MOVE_LIQUIDATION
        move MOVE_SUPERPOWER
        ability ABILITY_SWIFT_SWIM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 74
        pokemon SPECIES_GENESECT
        item ITEM_OCCA_BERRY
        move MOVE_BUG_BUZZ
        move MOVE_IRON_HEAD
        move MOVE_THUNDER
        move MOVE_ICE_BEAM
        ability ABILITY_DOWNLOAD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 74
        pokemon SPECIES_ARAQUANID
        item ITEM_MYSTIC_WATER
        move MOVE_LIQUIDATION
        move MOVE_LEECH_LIFE
        move MOVE_POISON_JAB
        move MOVE_CRUNCH
        ability ABILITY_WATER_BUBBLE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 74
        pokemon SPECIES_SCIZOR
        item ITEM_SCIZORITE
        move MOVE_BULLET_PUNCH
        move MOVE_SWORDS_DANCE
        move MOVE_ROOST
        move MOVE_SUPERPOWER
        ability ABILITY_LIGHT_METAL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

    endparty

trainerdata 75, "Lorelei"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_LORELEI
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 75
        // mon 0
        ivs 255
        abilityslot 0
        level 75
        pokemon SPECIES_ARTICUNO
        item ITEM_CHARTI_BERRY
        move MOVE_HURRICANE
        move MOVE_TAILWIND
        move MOVE_U_TURN
        move MOVE_WEATHER_BALL
        ability ABILITY_PRESSURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 75
        pokemon SPECIES_SLOWKING
        item ITEM_EJECT_BUTTON
        move MOVE_SCALD
        move MOVE_PSYCHIC
        move MOVE_ICE_BEAM
        move MOVE_FOCUS_BLAST
        ability ABILITY_REGENERATOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 75
        pokemon SPECIES_BEARTIC
        item ITEM_LIFE_ORB
        move MOVE_ICICLE_CRASH
        move MOVE_CLOSE_COMBAT
        move MOVE_SWORDS_DANCE
        move MOVE_EARTHQUAKE
        ability ABILITY_SWIFT_SWIM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 75
        pokemon SPECIES_JYNX
        item ITEM_WIDE_LENS
        move MOVE_ICE_BEAM
        move MOVE_PSYSHOCK
        move MOVE_LOVELY_KISS
        move MOVE_FOCUS_BLAST
        ability ABILITY_DRY_SKIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 75
        pokemon SPECIES_GALLADE
        item ITEM_GALLADITE
        move MOVE_CLOSE_COMBAT
        move MOVE_ZEN_HEADBUTT
        move MOVE_LEAF_BLADE
        move MOVE_SHADOW_SNEAK
        ability ABILITY_JUSTIFIED
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 76, "Marlon"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_MARLON
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 76
        // mon 0
        ivs 255
        abilityslot 0
        level 76
        monwithform SPECIES_SAMUROTT, 1
        item ITEM_SITRUS_BERRY
        move MOVE_CEASELESS_EDGE
        move MOVE_AQUA_CUTTER
        move MOVE_KNOCK_OFF
        move MOVE_AQUA_JET
        ability ABILITY_SHARPNESS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 76
        pokemon SPECIES_OVERQWIL
        item ITEM_FOCUS_SASH
        move MOVE_GUNK_SHOT
        move MOVE_CRUNCH
        move MOVE_LIQUIDATION
        move MOVE_DESTINY_BOND
        ability ABILITY_SWIFT_SWIM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 76
        pokemon SPECIES_SEISMITOAD
        item ITEM_RINDO_BERRY
        move MOVE_EARTHQUAKE
        move MOVE_LIQUIDATION
        move MOVE_KNOCK_OFF
        move MOVE_ICE_PUNCH
        ability ABILITY_WATER_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 76
        pokemon SPECIES_BASCULEGION
        item ITEM_CHOICE_BAND
        move MOVE_LIQUIDATION
        move MOVE_PHANTOM_FORCE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_ADAPTABILITY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 76
        pokemon SPECIES_SHARPEDO
        item ITEM_SHARPEDONITE
        move MOVE_CRUNCH
        move MOVE_PROTECT
        move MOVE_PSYCHIC_FANGS
        move MOVE_ICE_FANG
        ability ABILITY_ROUGH_SKIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 77, "Clair"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_CLAIR
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 77
        // mon 0
        ivs 255
        abilityslot 0
        level 77
        pokemon SPECIES_DRAGONITE
        item ITEM_YACHE_BERRY
        move MOVE_DRAGON_CLAW
        move MOVE_DUAL_WINGBEAT
        move MOVE_SUPERPOWER
        move MOVE_EXTREME_SPEED
        ability ABILITY_MULTISCALE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 77
        pokemon SPECIES_DRAGALGE
        item ITEM_EXPERT_BELT
        move MOVE_SLUDGE_BOMB
        move MOVE_HYDRO_PUMP
        move MOVE_THUNDER
        move MOVE_FOCUS_BLAST
        ability ABILITY_ADAPTABILITY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 77
        pokemon SPECIES_GOODRA
        item ITEM_LEFTOVERS
        move MOVE_DRAGON_PULSE
        move MOVE_THUNDER
        move MOVE_REST
        move MOVE_SLUDGE_BOMB
        ability ABILITY_HYDRATION
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 77
        pokemon SPECIES_KINGDRA
        item ITEM_ROSELI_BERRY
        move MOVE_DRAGON_PULSE
        move MOVE_SURF
        move MOVE_HURRICANE
        move MOVE_FLASH_CANNON
        ability ABILITY_SWIFT_SWIM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 77
        pokemon SPECIES_RAGING_BOLT
        item ITEM_MAGNET
        move MOVE_THUNDER
        move MOVE_DRAGON_PULSE
        move MOVE_THUNDERCLAP
        move MOVE_HYPER_VOICE
        ability ABILITY_PROTOSYNTHESIS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

    endparty

trainerdata 78, "Siebold"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_SIEBOLD
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 78
        // mon 0
        ivs 255
        abilityslot 0
        level 78
        pokemon SPECIES_BARBARACLE
        item ITEM_FOCUS_SASH
        move MOVE_LIQUIDATION
        move MOVE_STEALTH_ROCK
        move MOVE_SHELL_SMASH
        move MOVE_STONE_EDGE
        ability ABILITY_TOUGH_CLAWS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 78
        monwithform SPECIES_ARTICUNO, 1
        item ITEM_NONE
        move MOVE_HURRICANE
        move MOVE_FREEZING_GLARE
        move MOVE_U_TURN
        move MOVE_SHADOW_BALL
        ability ABILITY_COMPETITIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 78
        pokemon SPECIES_GRENINJA
        item ITEM_EXPERT_BELT
        move MOVE_SURF
        move MOVE_DARK_PULSE
        move MOVE_ICE_BEAM
        move MOVE_GUNK_SHOT
        ability ABILITY_PROTEAN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 78
        pokemon SPECIES_TENTACRUEL
        item ITEM_BLACK_SLUDGE
        move MOVE_SLUDGE_BOMB
        move MOVE_PROTECT
        move MOVE_GIGA_DRAIN
        move MOVE_ICE_BEAM
        ability ABILITY_RAIN_DISH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 78
        pokemon SPECIES_GYARADOS
        item ITEM_GYARADOSITE
        move MOVE_WATERFALL
        move MOVE_CRUNCH
        move MOVE_EARTHQUAKE
        move MOVE_IRON_HEAD
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 79, "Clemont"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_CLEMONT
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 79
        // mon 0
        ivs 255
        abilityslot 0
        level 79
        pokemon SPECIES_KILOWATTREL
        item ITEM_RED_CARD
        move MOVE_HURRICANE
        move MOVE_DISCHARGE
        move MOVE_U_TURN
        move MOVE_TAILWIND
        ability ABILITY_VOLT_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 79
        pokemon SPECIES_LANTURN
        item ITEM_LUM_BERRY
        move MOVE_DISCHARGE
        move MOVE_SCALD
        move MOVE_ICY_WIND
        move MOVE_DAZZLING_GLEAM
        ability ABILITY_VOLT_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 79
        pokemon SPECIES_THUNDURUS
        item ITEM_LIFE_ORB
        move MOVE_WILDBOLT_STORM
        move MOVE_WEATHER_BALL
        move MOVE_THUNDER_WAVE
        move MOVE_FLASH_CANNON
        ability ABILITY_PRANKSTER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 79
        pokemon SPECIES_HELIOLISK
        item ITEM_WISE_GLASSES
        move MOVE_RISING_VOLTAGE
        move MOVE_HYPER_VOICE
        move MOVE_WEATHER_BALL
        move MOVE_DRAGON_PULSE
        ability ABILITY_DRY_SKIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 79
        pokemon SPECIES_PIDGEOT
        item ITEM_PIDGEOTITE
        move MOVE_HURRICANE
        move MOVE_OMINOUS_WIND
        move MOVE_ROOST
        move MOVE_TAILWIND
        ability ABILITY_KEEN_EYE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

    endparty

trainerdata 80, "Hau"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_HAU
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 80
        // mon 0
        ivs 255
        abilityslot 0
        level 80
        pokemon SPECIES_IRON_HANDS
        item ITEM_SHELL_BELL
        move MOVE_WILD_CHARGE
        move MOVE_DRAIN_PUNCH
        move MOVE_FAKE_OUT
        move MOVE_HEAVY_SLAM
        ability ABILITY_QUARK_DRIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 80
        pokemon SPECIES_NOIVERN
        item ITEM_FOCUS_SASH
        move MOVE_HURRICANE
        move MOVE_DRACO_METEOR
        move MOVE_TAILWIND
        move MOVE_SHADOW_BALL
        ability ABILITY_INFILTRATOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 80
        monwithform SPECIES_RAICHU, 1
        item ITEM_LIFE_ORB
        move MOVE_RISING_VOLTAGE
        move MOVE_FAKE_OUT
        move MOVE_HELPING_HAND
        move MOVE_PSYCHIC
        ability ABILITY_SURGE_SURFER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 80
        pokemon SPECIES_PRIMARINA
        item ITEM_SITRUS_BERRY
        move MOVE_HYPER_VOICE
        move MOVE_MOONBLAST
        move MOVE_HELPING_HAND
        move MOVE_CHARM
        ability ABILITY_LIQUID_VOICE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 80
        pokemon SPECIES_VENUSAUR
        item ITEM_VENUSAURITE
        move MOVE_ENERGY_BALL
        move MOVE_SLUDGE_BOMB
        move MOVE_TERRAIN_PULSE
        move MOVE_EARTHQUAKE
        ability ABILITY_OVERGROW
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_RELAXED
        ballseal 0

    endparty

trainerdata 81, "Volkner"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_VOLKNER
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 81
        // mon 0
        ivs 255
        abilityslot 0
        level 81
        pokemon SPECIES_ZAPDOS
        item ITEM_LEFTOVERS
        move MOVE_HURRICANE
        move MOVE_RISING_VOLTAGE
        move MOVE_VOLT_SWITCH
        move MOVE_TAILWIND
        ability ABILITY_PRESSURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 81
        pokemon SPECIES_IRON_BUNDLE
        item ITEM_NEVER_MELT_ICE
        move MOVE_HYDRO_PUMP
        move MOVE_ICE_BEAM
        move MOVE_FLIP_TURN
        move MOVE_WHIRLPOOL
        ability ABILITY_QUARK_DRIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 81
        pokemon SPECIES_ELECTIVIRE
        item ITEM_SHELL_BELL
        move MOVE_SUPERCELL_SLAM
        move MOVE_CROSS_CHOP
        move MOVE_EARTHQUAKE
        move MOVE_ICE_PUNCH
        ability ABILITY_MOTOR_DRIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 81
        monwithform SPECIES_ROTOM, 5
        item ITEM_WHITE_HERB
        move MOVE_LEAF_STORM
        move MOVE_VOLT_SWITCH
        move MOVE_WILL_O_WISP
        move MOVE_DARK_PULSE
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 81
        pokemon SPECIES_MANECTRIC
        item ITEM_MANECTITE
        move MOVE_RISING_VOLTAGE
        move MOVE_SIGNAL_BEAM
        move MOVE_OVERHEAT
        move MOVE_VOLT_SWITCH
        ability ABILITY_LIGHTNING_ROD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 82, "Wallace"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_WALLACE
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 82
        // mon 0
        ivs 255
        abilityslot 0
        level 82
        pokemon SPECIES_KYOGRE
        item ITEM_WACAN_BERRY
        move MOVE_ORIGIN_PULSE
        move MOVE_THUNDER
        move MOVE_ICE_BEAM
        move MOVE_THUNDER_WAVE
        ability ABILITY_DRIZZLE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 82
        pokemon SPECIES_LUDICOLO
        item ITEM_EXPERT_BELT
        move MOVE_WEATHER_BALL
        move MOVE_GIGA_DRAIN
        move MOVE_FAKE_OUT
        move MOVE_ICE_BEAM
        ability ABILITY_SWIFT_SWIM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 82
        pokemon SPECIES_MANAPHY
        item ITEM_LEFTOVERS
        move MOVE_SCALD
        move MOVE_TAIL_GLOW
        move MOVE_REST
        move MOVE_ICE_BEAM
        ability ABILITY_HYDRATION
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 82
        monwithform SPECIES_GOODRA, 1
        item ITEM_SITRUS_BERRY
        move MOVE_DRAGON_PULSE
        move MOVE_FLASH_CANNON
        move MOVE_ACID_SPRAY
        move MOVE_THUNDER
        ability ABILITY_SAP_SIPPER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 82
        pokemon SPECIES_GOREBYSS
        item ITEM_FOCUS_SASH
        move MOVE_HYDRO_PUMP
        move MOVE_SHELL_SMASH
        move MOVE_ICE_BEAM
        move MOVE_SIGNAL_BEAM
        ability ABILITY_SWIFT_SWIM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 82
        pokemon SPECIES_SWAMPERT
        item ITEM_SWAMPERTITE
        move MOVE_WATERFALL
        move MOVE_EARTHQUAKE
        move MOVE_ICE_PUNCH
        move MOVE_SUPERPOWER
        ability ABILITY_TORRENT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 17, "Bea"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BEA
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 17
        // mon 0
        ivs 255
        abilityslot 0
        level 17
        pokemon SPECIES_CLOBBOPUS
        item ITEM_SITRUS_BERRY
        move MOVE_POWER_UP_PUNCH
        move MOVE_PAYBACK
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_TECHNICIAN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BRAVE
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 17
        pokemon SPECIES_FARFETCHD
        item ITEM_LEEK
        move MOVE_AIR_CUTTER
        move MOVE_KNOCK_OFF
        move MOVE_QUICK_ATTACK
        move MOVE_STEEL_WING
        ability ABILITY_INNER_FOCUS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 17
        pokemon SPECIES_COMBUSKEN
        item ITEM_SHELL_BELL
        move MOVE_FLAME_CHARGE
        move MOVE_DETECT
        move MOVE_DOUBLE_KICK
        move MOVE_THUNDER_PUNCH
        ability ABILITY_SPEED_BOOST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 18, "Nanu"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_NANU
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 18
        // mon 0
        ivs 255
        abilityslot 0
        level 18
        pokemon SPECIES_PAWNIARD
        item ITEM_BLACK_GLASSES
        move MOVE_SUCKER_PUNCH
        move MOVE_METAL_CLAW
        move MOVE_AERIAL_ACE
        move MOVE_ROCK_TOMB
        ability ABILITY_INNER_FOCUS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 18
        pokemon SPECIES_SABLEYE
        item ITEM_LUM_BERRY
        move MOVE_KNOCK_OFF
        move MOVE_WILL_O_WISP
        move MOVE_PROTECT
        move MOVE_FIRE_PUNCH
        ability ABILITY_KEEN_EYE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 18
        pokemon SPECIES_MURKROW
        item ITEM_WACAN_BERRY
        move MOVE_PURSUIT
        move MOVE_THUNDER_WAVE
        move MOVE_ROOST
        move MOVE_AERIAL_ACE
        ability ABILITY_PRANKSTER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 19, "Flannery"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_FLANNERY
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 19
        // mon 0
        ivs 255
        abilityslot 0
        level 19
        pokemon SPECIES_TORKOAL
        item ITEM_SITRUS_BERRY
        move MOVE_FIRE_SPIN
        move MOVE_YAWN
        move MOVE_PROTECT
        move MOVE_GYRO_BALL
        ability ABILITY_DROUGHT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_SASSY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 19
        pokemon SPECIES_SUNFLORA
        item ITEM_BIG_ROOT
        move MOVE_GIGA_DRAIN
        move MOVE_WEATHER_BALL
        move MOVE_GROWTH
        move MOVE_NONE
        ability ABILITY_CHLOROPHYLL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 19
        pokemon SPECIES_CHARMELEON
        item ITEM_SHELL_BELL
        move MOVE_FIRE_FANG
        move MOVE_DRAGON_BREATH
        move MOVE_THUNDER_PUNCH
        move MOVE_AERIAL_ACE
        ability ABILITY_SOLAR_POWER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_NAUGHTY
        ballseal 0

    endparty

trainerdata 20, "Roxie"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_ROXIE
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 20
        // mon 0
        ivs 255
        abilityslot 0
        level 20
        pokemon SPECIES_NIDORINA
        item ITEM_AIR_BALLOON
        move MOVE_POISON_TAIL
        move MOVE_TOXIC_SPIKES
        move MOVE_BULLDOZE
        move MOVE_DOUBLE_KICK
        ability ABILITY_POISON_POINT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 20
        monwithform SPECIES_LINOONE, 1
        item ITEM_TOXIC_ORB
        move MOVE_HEADBUTT
        move MOVE_KNOCK_OFF
        move MOVE_TAUNT
        move MOVE_PIN_MISSILE
        ability ABILITY_QUICK_FEET
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 20
        pokemon SPECIES_WHIRLIPEDE
        item ITEM_BLACK_SLUDGE
        move MOVE_BUG_BITE
        move MOVE_VENOSHOCK
        move MOVE_IRON_DEFENSE
        move MOVE_ROLLOUT
        ability ABILITY_SPEED_BOOST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_LAX
        ballseal 0

    endparty

trainerdata 21, "Surge"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_SURGE
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 21
        // mon 0
        ivs 255
        abilityslot 0
        level 21
        pokemon SPECIES_LUXIO
        item ITEM_AIR_BALLOON
        move MOVE_SPARK
        move MOVE_ELECTRIC_TERRAIN
        move MOVE_ICE_FANG
        move MOVE_BITE
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 21
        monwithform SPECIES_VOLTORB, 1
        item ITEM_MIRACLE_SEED
        move MOVE_ENERGY_BALL
        move MOVE_REFLECT
        move MOVE_LIGHT_SCREEN
        move MOVE_VOLT_SWITCH
        ability ABILITY_SOUNDPROOF
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 21
        monwithform SPECIES_GRAVELER, 1
        item ITEM_WEAKNESS_POLICY
        move MOVE_THUNDER_PUNCH
        move MOVE_ROCK_BLAST
        move MOVE_BULLDOZE
        move MOVE_FIRE_PUNCH
        ability ABILITY_MAGNET_PULL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 21
        pokemon SPECIES_RAICHU
        item ITEM_SHUCA_BERRY
        move MOVE_THUNDERBOLT
        move MOVE_GRASS_KNOT
        move MOVE_FAKE_OUT
        move MOVE_NASTY_PLOT
        ability ABILITY_STATIC
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 22, "Roark"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_ROARK
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 22
        // mon 0
        ivs 255
        abilityslot 0
        level 22
        pokemon SPECIES_NOSEPASS
        item ITEM_SITRUS_BERRY
        move MOVE_POWER_GEM
        move MOVE_STEALTH_ROCK
        move MOVE_THUNDER_WAVE
        move MOVE_SANDSTORM
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 22
        pokemon SPECIES_LARVITAR
        item ITEM_FLAME_ORB
        move MOVE_ROCK_SLIDE
        move MOVE_DRAGON_DANCE
        move MOVE_BULLDOZE
        move MOVE_BITE
        ability ABILITY_GUTS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 22
        pokemon SPECIES_CRANIDOS
        item ITEM_MUSCLE_BAND
        move MOVE_ROCK_TOMB
        move MOVE_HEADBUTT
        move MOVE_ROCK_SMASH
        move MOVE_PURSUIT
        ability ABILITY_MOLD_BREAKER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 23, "Byron"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BYRON
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 23
        // mon 0
        ivs 255
        abilityslot 0
        level 23
        pokemon SPECIES_BRONZOR
        item ITEM_LIGHT_CLAY
        move MOVE_CONFUSION
        move MOVE_REFLECT
        move MOVE_LIGHT_SCREEN
        move MOVE_RAIN_DANCE
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 23
        pokemon SPECIES_SHIELDON
        item ITEM_METAL_COAT
        move MOVE_IRON_HEAD
        move MOVE_METAL_BURST
        move MOVE_COUNTER
        move MOVE_TAUNT
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BRAVE
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 23
        pokemon SPECIES_LAIRON
        item ITEM_WEAKNESS_POLICY
        move MOVE_ROCK_TOMB
        move MOVE_METAL_CLAW
        move MOVE_BULLDOZE
        move MOVE_AERIAL_ACE
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 24, "Allister"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_ALLISTER
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 24
        // mon 0
        ivs 255
        abilityslot 0
        level 24
        monwithform SPECIES_YAMASK, 1
        item ITEM_SITRUS_BERRY
        move MOVE_HEX
        move MOVE_DISABLE
        move MOVE_WILL_O_WISP
        move MOVE_EARTH_POWER
        ability ABILITY_MUMMY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 24
        monwithform SPECIES_CORSOLA, 1
        item ITEM_LEFTOVERS
        move MOVE_HEX
        move MOVE_ANCIENT_POWER
        move MOVE_DISABLE
        move MOVE_WILL_O_WISP
        ability ABILITY_CURSED_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 24
        pokemon SPECIES_HAUNTER
        item ITEM_WIDE_LENS
        move MOVE_HEX
        move MOVE_HYPNOSIS
        move MOVE_MEAN_LOOK
        move MOVE_DREAM_EATER
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 25, "Brycen"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BRYCEN
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 25
        // mon 0
        ivs 255
        abilityslot 0
        level 25
        pokemon SPECIES_SNOVER
        item ITEM_OCCA_BERRY
        move MOVE_AVALANCHE
        move MOVE_GIGA_DRAIN
        move MOVE_LIGHT_SCREEN
        move MOVE_ICE_SHARD
        ability ABILITY_SNOW_WARNING
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_RELAXED
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 25
        pokemon SPECIES_SEALEO
        item ITEM_CHESTO_BERRY
        move MOVE_ICE_BALL
        move MOVE_BRINE
        move MOVE_REST
        move MOVE_ROLLOUT
        ability ABILITY_ICE_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 25
        pokemon SPECIES_SNEASEL
        item ITEM_MUSCLE_BAND
        move MOVE_ICE_PUNCH
        move MOVE_KNOCK_OFF
        move MOVE_AERIAL_ACE
        move MOVE_METAL_CLAW
        ability ABILITY_INNER_FOCUS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 25
        pokemon SPECIES_CRYOGONAL
        item ITEM_ROCKY_HELMET
        move MOVE_AURORA_BEAM
        move MOVE_ANCIENT_POWER
        move MOVE_IRON_DEFENSE
        move MOVE_WATER_PULSE
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

    endparty

trainerdata 26, "Riley"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_RILEY
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 26
        // mon 0
        ivs 255
        abilityslot 0
        level 26
        pokemon SPECIES_HONEDGE
        item ITEM_FOCUS_SASH
        move MOVE_GYRO_BALL
        move MOVE_TOXIC
        move MOVE_SHADOW_SNEAK
        move MOVE_BRICK_BREAK
        ability ABILITY_NO_GUARD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BRAVE
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 26
        pokemon SPECIES_POLIWHIRL
        item ITEM_WACAN_BERRY
        move MOVE_BUBBLE_BEAM
        move MOVE_BRICK_BREAK
        move MOVE_ICE_PUNCH
        move MOVE_BULLDOZE
        ability ABILITY_WATER_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_LONELY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 26
        pokemon SPECIES_GABITE
        item ITEM_ROCKY_HELMET
        move MOVE_BREAKING_SWIPE
        move MOVE_BULLDOZE
        move MOVE_SAND_TOMB
        move MOVE_FIRE_FANG
        ability ABILITY_ROUGH_SKIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 26
        pokemon SPECIES_METANG
        item ITEM_OCCA_BERRY
        move MOVE_BULLET_PUNCH
        move MOVE_CONFUSION
        move MOVE_MAGNET_RISE
        move MOVE_POWER_UP_PUNCH
        ability ABILITY_CLEAR_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_NAUGHTY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 26
        pokemon SPECIES_ABSOL
        item ITEM_BLACK_GLASSES
        move MOVE_PURSUIT
        move MOVE_SLASH
        move MOVE_AERIAL_ACE
        move MOVE_ROCK_SMASH
        ability ABILITY_JUSTIFIED
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 26
        pokemon SPECIES_LUCARIO
        item ITEM_BLACK_BELT
        move MOVE_FORCE_PALM
        move MOVE_METAL_CLAW
        move MOVE_BITE
        move MOVE_VACUUM_WAVE
        ability ABILITY_JUSTIFIED
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        ballseal 0

    endparty

trainerdata 59, "Marnie"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ADDITIONAL_FLAGS | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_MARNIE
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 59
        // mon 0
        ivs 255
        abilityslot 0
        level 59
        pokemon SPECIES_OBSTAGOON
        item ITEM_SILK_SCARF
        move MOVE_FACADE
        move MOVE_KNOCK_OFF
        move MOVE_ICE_PUNCH
        move MOVE_FIRE_PUNCH
        ability ABILITY_GUTS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        additionalflags TRAINER_DATA_EXTRA_TYPE_STATUS
        status 0x10
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 59
        pokemon SPECIES_GRANBULL
        item ITEM_CHOICE_BAND
        move MOVE_PLAY_ROUGH
        move MOVE_EARTHQUAKE
        move MOVE_FIRE_PUNCH
        move MOVE_CLOSE_COMBAT
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        additionalflags 0
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 59
        pokemon SPECIES_BEWEAR
        item ITEM_CHOPLE_BERRY
        move MOVE_DOUBLE_EDGE
        move MOVE_SWORDS_DANCE
        move MOVE_DRAIN_PUNCH
        move MOVE_DARKEST_LARIAT
        ability ABILITY_FLUFFY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        additionalflags 0
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 59
        pokemon SPECIES_HOOPA
        item ITEM_COLBUR_BERRY
        move MOVE_PSYCHIC_NOISE
        move MOVE_SHADOW_BALL
        move MOVE_CALM_MIND
        move MOVE_FOCUS_BLAST
        ability ABILITY_FRISK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        additionalflags 0
        ballseal 0

    endparty

trainerdata 60, "Larry"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ADDITIONAL_FLAGS | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_LARRY
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 60
        // mon 0
        ivs 255
        abilityslot 0
        level 60
        pokemon SPECIES_CYCLIZAR
        item ITEM_QUICK_CLAW
        move MOVE_DRACO_METEOR
        move MOVE_SHED_TAIL
        move MOVE_KNOCK_OFF
        move MOVE_U_TURN
        ability ABILITY_REGENERATOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        additionalflags 0
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 60
        pokemon SPECIES_SILVALLY
        item ITEM_STEEL_MEMORY
        move MOVE_MULTI_ATTACK
        move MOVE_FLAMETHROWER
        move MOVE_WORK_UP
        move MOVE_PSYCHIC_FANGS
        ability ABILITY_RKS_SYSTEM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        additionalflags 0
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 60
        pokemon SPECIES_SWELLOW
        item ITEM_SILK_SCARF
        move MOVE_FACADE
        move MOVE_BRAVE_BIRD
        move MOVE_ROOST
        move MOVE_PURSUIT
        ability ABILITY_GUTS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        additionalflags TRAINER_DATA_EXTRA_TYPE_STATUS
        status 0x10
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 60
        pokemon SPECIES_URSALUNA
        item ITEM_ROCKY_HELMET
        move MOVE_FACADE
        move MOVE_HEADLONG_RUSH
        move MOVE_SWORDS_DANCE
        move MOVE_FIRE_PUNCH
        ability ABILITY_GUTS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        additionalflags TRAINER_DATA_EXTRA_TYPE_STATUS
        status 0x10
        ballseal 0

    endparty

trainerdata 61, "Brandon"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BRANDON
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 61
        // mon 0
        ivs 255
        abilityslot 0
        level 61
        pokemon SPECIES_REGIELEKI
        item ITEM_LIGHT_CLAY
        move MOVE_THUNDERBOLT
        move MOVE_REFLECT
        move MOVE_LIGHT_SCREEN
        move MOVE_EXPLOSION
        ability ABILITY_TRANSISTOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 61
        pokemon SPECIES_REGICE
        item ITEM_SITRUS_BERRY
        move MOVE_ICE_BEAM
        move MOVE_FOCUS_BLAST
        move MOVE_ICY_WIND
        move MOVE_ANCIENT_POWER
        ability ABILITY_CLEAR_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 61
        pokemon SPECIES_REGISTEEL
        item ITEM_CHESTO_BERRY
        move MOVE_BODY_PRESS
        move MOVE_REST
        move MOVE_IRON_DEFENSE
        move MOVE_HAMMER_ARM
        ability ABILITY_CLEAR_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 61
        pokemon SPECIES_REGIDRAGO
        item ITEM_WHITE_HERB
        move MOVE_DRACO_METEOR
        move MOVE_EARTH_POWER
        move MOVE_FOCUS_ENERGY
        move MOVE_PROTECT
        ability ABILITY_DRAGONS_MAW
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 62, "Candice"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_CANDICE
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 62
        // mon 0
        ivs 255
        abilityslot 0
        level 62
        pokemon SPECIES_FROSLASS
        item ITEM_BRIGHT_POWDER
        move MOVE_BLIZZARD
        move MOVE_SPIKES
        move MOVE_THUNDER_WAVE
        move MOVE_SHADOW_BALL
        ability ABILITY_SNOW_CLOAK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 62
        pokemon SPECIES_ARCTOVISH
        item ITEM_LIFE_ORB
        move MOVE_LIQUIDATION
        move MOVE_ICICLE_CRASH
        move MOVE_STONE_EDGE
        move MOVE_CRUNCH
        ability ABILITY_SLUSH_RUSH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 62
        pokemon SPECIES_MAMOSWINE
        item ITEM_FOCUS_SASH
        move MOVE_EARTHQUAKE
        move MOVE_ICICLE_CRASH
        move MOVE_STONE_EDGE
        move MOVE_ICE_SHARD
        ability ABILITY_SNOW_CLOAK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 62
        pokemon SPECIES_ARCTOZOLT
        item ITEM_LEFTOVERS
        move MOVE_BLIZZARD
        move MOVE_THUNDERBOLT
        move MOVE_SURF
        move MOVE_ANCIENT_POWER
        ability ABILITY_SLUSH_RUSH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 63, "Caitlin"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ADDITIONAL_FLAGS | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_CAITLIN
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 63
        // mon 0
        ivs 255
        abilityslot 0
        level 63
        pokemon SPECIES_MR_RIME
        item ITEM_LIGHT_CLAY
        move MOVE_BLIZZARD
        move MOVE_REFLECT
        move MOVE_LIGHT_SCREEN
        move MOVE_DAZZLING_GLEAM
        ability ABILITY_ICE_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        additionalflags 0
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 63
        pokemon SPECIES_SIGILYPH
        item ITEM_LEFTOVERS
        move MOVE_STORED_POWER
        move MOVE_COSMIC_POWER
        move MOVE_ROOST
        move MOVE_ICE_BEAM
        ability ABILITY_MAGIC_GUARD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        additionalflags TRAINER_DATA_EXTRA_TYPE_STATUS
        status 0x10
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 63
        monwithform SPECIES_ENAMORUS, 1
        item ITEM_LIFE_ORB
        move MOVE_MOONBLAST
        move MOVE_CALM_MIND
        move MOVE_EARTH_POWER
        move MOVE_MYSTICAL_FIRE
        ability ABILITY_OVERCOAT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        additionalflags 0
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 63
        pokemon SPECIES_REUNICLUS
        item ITEM_SITRUS_BERRY
        move MOVE_PSYSHOCK
        move MOVE_FOCUS_BLAST
        move MOVE_CALM_MIND
        move MOVE_RECOVER
        ability ABILITY_MAGIC_GUARD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        additionalflags 0
        ballseal 0

    endparty

trainerdata 64, "Grusha"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_GRUSHA
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 64
        // mon 0
        ivs 255
        abilityslot 0
        level 64
        pokemon SPECIES_CHIEN_PAO
        item ITEM_FOCUS_SASH
        move MOVE_ICICLE_CRASH
        move MOVE_CRUNCH
        move MOVE_RUINATION
        move MOVE_ICE_SHARD
        ability ABILITY_SWORD_OF_RUIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 64
        pokemon SPECIES_WYRDEER
        item ITEM_SHELL_BELL
        move MOVE_ZEN_HEADBUTT
        move MOVE_HELPING_HAND
        move MOVE_HIGH_HORSEPOWER
        move MOVE_WILD_CHARGE
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 64
        pokemon SPECIES_KOMMO_O
        item ITEM_SITRUS_BERRY
        move MOVE_BREAKING_SWIPE
        move MOVE_BRICK_BREAK
        move MOVE_IRON_HEAD
        move MOVE_POISON_JAB
        ability ABILITY_OVERCOAT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 64
        pokemon SPECIES_BAXCALIBUR
        item ITEM_NEVER_MELT_ICE
        move MOVE_ICICLE_SPEAR
        move MOVE_DRAGON_CLAW
        move MOVE_AQUA_TAIL
        move MOVE_IRON_HEAD
        ability ABILITY_THERMAL_EXCHANGE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 64
        pokemon SPECIES_GLALIE
        item ITEM_GLALITITE
        move MOVE_DOUBLE_EDGE
        move MOVE_CRUNCH
        move MOVE_EARTHQUAKE
        move MOVE_IRON_HEAD
        ability ABILITY_INNER_FOCUS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 65, "Burnet"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BURNET
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 65
        // mon 0
        ivs 255
        abilityslot 0
        level 65
        monwithform SPECIES_TORNADUS, 1
        item ITEM_WIDE_LENS
        move MOVE_BLEAKWIND_STORM
        move MOVE_U_TURN
        move MOVE_FOCUS_BLAST
        move MOVE_KNOCK_OFF
        ability ABILITY_REGENERATOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 65
        monwithform SPECIES_THUNDURUS, 1
        item ITEM_CHOICE_SPECS
        move MOVE_VOLT_SWITCH
        move MOVE_SLUDGE_BOMB
        move MOVE_FOCUS_BLAST
        move MOVE_DARK_PULSE
        ability ABILITY_VOLT_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 65
        pokemon SPECIES_LANDORUS
        item ITEM_YACHE_BERRY
        move MOVE_EARTH_POWER
        move MOVE_FOCUS_BLAST
        move MOVE_PSYCHIC
        move MOVE_GRASS_KNOT
        ability ABILITY_SHEER_FORCE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

    endparty

trainerdata 66, "Koga"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_KOGA
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 66
        // mon 0
        ivs 255
        abilityslot 0
        level 66
        pokemon SPECIES_VENOMOTH
        item ITEM_LIFE_ORB
        move MOVE_BUG_BUZZ
        move MOVE_QUIVER_DANCE
        move MOVE_SLUDGE_BOMB
        move MOVE_ENERGY_BALL
        ability ABILITY_TINTED_LENS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 66
        pokemon SPECIES_KARTANA
        item ITEM_FOCUS_SASH
        move MOVE_LEAF_BLADE
        move MOVE_SWORDS_DANCE
        move MOVE_SACRED_SWORD
        move MOVE_SMART_STRIKE
        ability ABILITY_BEAST_BOOST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 66
        pokemon SPECIES_NAGANADEL
        item ITEM_EXPERT_BELT
        move MOVE_DRAGON_PULSE
        move MOVE_SLUDGE_WAVE
        move MOVE_FIRE_BLAST
        move MOVE_THUNDERBOLT
        ability ABILITY_BEAST_BOOST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 66
        pokemon SPECIES_BEEDRILL
        item ITEM_BEEDRILLITE
        move MOVE_POISON_JAB
        move MOVE_X_SCISSOR
        move MOVE_KNOCK_OFF
        move MOVE_DRILL_RUN
        ability ABILITY_SWARM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 67, "Spenser"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_SPENSER
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 67
        // mon 0
        ivs 255
        abilityslot 0
        level 67
        pokemon SPECIES_BRAMBLEGHAST
        item ITEM_COLBUR_BERRY
        move MOVE_POWER_WHIP
        move MOVE_POLTERGEIST
        move MOVE_SKITTER_SMACK
        move MOVE_SHADOW_SNEAK
        ability ABILITY_WIND_RIDER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 67
        monwithform SPECIES_URSHIFU, 1
        item ITEM_MUSCLE_BAND
        move MOVE_SURGING_STRIKES
        move MOVE_CLOSE_COMBAT
        move MOVE_PROTECT
        move MOVE_ICE_PUNCH
        ability ABILITY_UNSEEN_FIST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 67
        pokemon SPECIES_GENGAR
        item ITEM_WIDE_LENS
        move MOVE_SHADOW_BALL
        move MOVE_SLUDGE_BOMB
        move MOVE_HYPNOSIS
        move MOVE_FOCUS_BLAST
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 67
        pokemon SPECIES_IRON_THORNS
        item ITEM_CHOICE_BAND
        move MOVE_STONE_EDGE
        move MOVE_WILD_CHARGE
        move MOVE_FIRE_PUNCH
        move MOVE_VOLT_SWITCH
        ability ABILITY_QUARK_DRIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 67
        pokemon SPECIES_PINSIR
        item ITEM_PINSIRITE
        move MOVE_DOUBLE_EDGE
        move MOVE_SWORDS_DANCE
        move MOVE_CLOSE_COMBAT
        move MOVE_QUICK_ATTACK
        ability ABILITY_HYPER_CUTTER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 68, "Winona"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_WINONA
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 68
        // mon 0
        ivs 255
        abilityslot 0
        level 68
        pokemon SPECIES_STARAPTOR
        item ITEM_SHELL_BELL
        move MOVE_BRAVE_BIRD
        move MOVE_DOUBLE_EDGE
        move MOVE_U_TURN
        move MOVE_CLOSE_COMBAT
        ability ABILITY_RECKLESS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 68
        monwithform SPECIES_SHAYMIN, 1
        item ITEM_CHOICE_SCARF
        move MOVE_SEED_FLARE
        move MOVE_AIR_SLASH
        move MOVE_EARTH_POWER
        move MOVE_DAZZLING_GLEAM
        ability ABILITY_SERENE_GRACE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 68
        pokemon SPECIES_VOLCARONA
        item ITEM_FOCUS_SASH
        move MOVE_HEAT_WAVE
        move MOVE_BUG_BUZZ
        move MOVE_QUIVER_DANCE
        move MOVE_GIGA_DRAIN
        ability ABILITY_FLAME_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 68
        pokemon SPECIES_EMPOLEON
        item ITEM_LEFTOVERS
        move MOVE_SURF
        move MOVE_FLASH_CANNON
        move MOVE_ICE_BEAM
        move MOVE_ROOST
        ability ABILITY_COMPETITIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 68
        pokemon SPECIES_ALTARIA
        item ITEM_ALTARIANITE
        move MOVE_RETURN
        move MOVE_EARTHQUAKE
        move MOVE_DRAGON_DANCE
        move MOVE_ROOST
        ability ABILITY_NATURAL_CURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 69, "Zinnia"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_ZINNIA
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 69
        // mon 0
        ivs 255
        abilityslot 0
        level 69
        pokemon SPECIES_RAYQUAZA
        item ITEM_YACHE_BERRY
        move MOVE_DRAGON_ASCENT
        move MOVE_DRAGON_DANCE
        move MOVE_EXTREME_SPEED
        move MOVE_V_CREATE
        ability ABILITY_AIR_LOCK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 69
        pokemon SPECIES_AGGRON
        item ITEM_AIR_BALLOON
        move MOVE_HEAD_SMASH
        move MOVE_HEAVY_SLAM
        move MOVE_AQUA_TAIL
        move MOVE_EARTHQUAKE
        ability ABILITY_ROCK_HEAD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 69
        pokemon SPECIES_GYARADOS
        item ITEM_WACAN_BERRY
        move MOVE_WATERFALL
        move MOVE_DRAGON_DANCE
        move MOVE_ICE_FANG
        move MOVE_EARTHQUAKE
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 69
        pokemon SPECIES_ALTARIA
        item ITEM_LIFE_ORB
        move MOVE_BRAVE_BIRD
        move MOVE_HEAT_WAVE
        move MOVE_ROOST
        move MOVE_WILL_O_WISP
        ability ABILITY_NATURAL_CURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_NAUGHTY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 69
        pokemon SPECIES_CHARIZARD
        item ITEM_CHARTI_BERRY
        move MOVE_FLAMETHROWER
        move MOVE_AIR_SLASH
        move MOVE_SCORCHING_SANDS
        move MOVE_DRAGON_PULSE
        ability ABILITY_BLAZE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 69
        pokemon SPECIES_SALAMENCE
        item ITEM_LUM_BERRY
        move MOVE_OUTRAGE
        move MOVE_DUAL_WINGBEAT
        move MOVE_DRAGON_DANCE
        move MOVE_EARTHQUAKE
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 48, "Poppy"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ADDITIONAL_FLAGS | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_POPPY
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 48
        // mon 0
        ivs 255
        abilityslot 0
        level 48
        pokemon SPECIES_TINKATON
        item ITEM_AIR_BALLOON
        move MOVE_GIGATON_HAMMER
        move MOVE_STEALTH_ROCK
        move MOVE_THUNDER_WAVE
        move MOVE_KNOCK_OFF
        ability ABILITY_MOLD_BREAKER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        additionalflags 0
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 48
        pokemon SPECIES_MILOTIC
        item ITEM_LEFTOVERS
        move MOVE_SCALD
        move MOVE_RECOVER
        move MOVE_ICE_BEAM
        move MOVE_FLIP_TURN
        ability ABILITY_MARVEL_SCALE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        additionalflags TRAINER_DATA_EXTRA_TYPE_STATUS
        status 0x10
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 48
        pokemon SPECIES_MAWILE
        item ITEM_MAWILITE
        move MOVE_PLAY_ROUGH
        move MOVE_SUCKER_PUNCH
        move MOVE_THUNDER_PUNCH
        move MOVE_ICE_FANG
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        additionalflags 0
        ballseal 0

    endparty

trainerdata 49, "Noland"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_NOLAND
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 49
        // mon 0
        ivs 255
        abilityslot 0
        level 49
        pokemon SPECIES_MOLTRES
        item ITEM_LEFTOVERS
        move MOVE_HEAT_WAVE
        move MOVE_TAILWIND
        move MOVE_AIR_SLASH
        move MOVE_SCORCHING_SANDS
        ability ABILITY_FLAME_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 49
        pokemon SPECIES_ARCHALUDON
        item ITEM_POWER_HERB
        move MOVE_FLASH_CANNON
        move MOVE_DRAGON_PULSE
        move MOVE_ELECTRO_SHOT
        move MOVE_AURA_SPHERE
        ability ABILITY_STALWART
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 49
        pokemon SPECIES_BLASTOISE
        item ITEM_WACAN_BERRY
        move MOVE_HYDRO_PUMP
        move MOVE_FOLLOW_ME
        move MOVE_FAKE_OUT
        move MOVE_ICE_BEAM
        ability ABILITY_TORRENT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_QUIET
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 49
        monwithform SPECIES_ZAPDOS, 1
        item ITEM_PROTECTIVE_PADS
        move MOVE_THUNDEROUS_KICK
        move MOVE_DRILL_PECK
        move MOVE_DETECT
        move MOVE_KNOCK_OFF
        ability ABILITY_DEFIANT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 50, "Rika"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_RIKA
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 50
        // mon 0
        ivs 255
        abilityslot 0
        level 50
        pokemon SPECIES_QUAGSIRE
        item ITEM_RINDO_BERRY
        move MOVE_SURF
        move MOVE_ICY_WIND
        move MOVE_YAWN
        move MOVE_PROTECT
        ability ABILITY_WATER_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 50
        pokemon SPECIES_CLODSIRE
        item ITEM_BLACK_SLUDGE
        move MOVE_POISON_JAB
        move MOVE_HIGH_HORSEPOWER
        move MOVE_RECOVER
        move MOVE_ROCK_SLIDE
        ability ABILITY_WATER_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 50
        pokemon SPECIES_STUNFISK
        item ITEM_CHOICE_SPECS
        move MOVE_DISCHARGE
        move MOVE_MUDDY_WATER
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_STATIC
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 50
        pokemon SPECIES_KROOKODILE
        item ITEM_MUSCLE_BAND
        move MOVE_CRUNCH
        move MOVE_HIGH_HORSEPOWER
        move MOVE_FIRE_FANG
        move MOVE_DRAGON_CLAW
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 51, "Roxanne"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_ROXANNE
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 51
        // mon 0
        ivs 255
        abilityslot 0
        level 51
        pokemon SPECIES_GIGALITH
        item ITEM_BRIGHT_POWDER
        move MOVE_STONE_EDGE
        move MOVE_STEALTH_ROCK
        move MOVE_EARTHQUAKE
        move MOVE_EXPLOSION
        ability ABILITY_SAND_FORCE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 51
        pokemon SPECIES_DRACOZOLT
        item ITEM_SHELL_BELL
        move MOVE_OUTRAGE
        move MOVE_WILD_CHARGE
        move MOVE_IRON_TAIL
        move MOVE_FIRE_FANG
        ability ABILITY_SAND_RUSH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 51
        pokemon SPECIES_PROBOPASS
        item ITEM_POWER_HERB
        move MOVE_METEOR_BEAM
        move MOVE_FLASH_CANNON
        move MOVE_EARTH_POWER
        move MOVE_DAZZLING_GLEAM
        ability ABILITY_MAGNET_PULL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 51
        pokemon SPECIES_CLOYSTER
        item ITEM_WHITE_HERB
        move MOVE_RAZOR_SHELL
        move MOVE_SHELL_SMASH
        move MOVE_DRILL_RUN
        move MOVE_ICE_SHARD
        ability ABILITY_OVERCOAT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

    endparty

trainerdata 52, "Lenora"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_LENORA
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 52
        // mon 0
        ivs 255
        abilityslot 0
        level 52
        pokemon SPECIES_CLEFABLE
        item ITEM_ROCKY_HELMET
        move MOVE_MOONBLAST
        move MOVE_SOFT_BOILED
        move MOVE_TOXIC
        move MOVE_STEALTH_ROCK
        ability ABILITY_MAGIC_GUARD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 52
        pokemon SPECIES_STOUTLAND
        item ITEM_CHOICE_BAND
        move MOVE_RETURN
        move MOVE_SUPERPOWER
        move MOVE_PLAY_ROUGH
        move MOVE_CRUNCH
        ability ABILITY_SAND_RUSH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 52
        pokemon SPECIES_CARRACOSTA
        item ITEM_WHITE_HERB
        move MOVE_STONE_EDGE
        move MOVE_SHELL_SMASH
        move MOVE_AQUA_JET
        move MOVE_ICE_BEAM
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_NAUGHTY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 52
        pokemon SPECIES_HOUNDSTONE
        item ITEM_SPELL_TAG
        move MOVE_POLTERGEIST
        move MOVE_PLAY_ROUGH
        move MOVE_WILL_O_WISP
        move MOVE_SHADOW_SNEAK
        ability ABILITY_SAND_RUSH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 53, "Molayne"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_MOLAYNE
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 53
        // mon 0
        ivs 255
        abilityslot 0
        level 53
        monwithform SPECIES_DUGTRIO, 1
        item ITEM_BRIGHT_POWDER
        move MOVE_EARTHQUAKE
        move MOVE_IRON_HEAD
        move MOVE_SUBSTITUTE
        move MOVE_STEALTH_ROCK
        ability ABILITY_SAND_VEIL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 53
        pokemon SPECIES_DURANT
        item ITEM_LIFE_ORB
        move MOVE_FIRST_IMPRESSION
        move MOVE_IRON_HEAD
        move MOVE_SUPERPOWER
        move MOVE_ROCK_SLIDE
        ability ABILITY_HUSTLE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 53
        pokemon SPECIES_DUGTRIO
        item ITEM_CHOICE_BAND
        move MOVE_EARTHQUAKE
        move MOVE_PURSUIT
        move MOVE_ROCK_SLIDE
        move MOVE_NONE
        ability ABILITY_ARENA_TRAP
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 53
        pokemon SPECIES_METAGROSS
        item ITEM_AIR_BALLOON
        move MOVE_METEOR_MASH
        move MOVE_ZEN_HEADBUTT
        move MOVE_ICE_PUNCH
        move MOVE_BULLET_PUNCH
        ability ABILITY_CLEAR_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 54, "Aarune"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_AARUNE
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 54
        // mon 0
        ivs 255
        abilityslot 0
        level 54
        pokemon SPECIES_GASTRODON
        item ITEM_RINDO_BERRY
        move MOVE_SCALD
        move MOVE_EARTH_POWER
        move MOVE_ICY_WIND
        move MOVE_PROTECT
        ability ABILITY_STORM_DRAIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 54
        pokemon SPECIES_CAMERUPT
        item ITEM_QUICK_CLAW
        move MOVE_ERUPTION
        move MOVE_EARTH_POWER
        move MOVE_ROCK_SLIDE
        move MOVE_WILL_O_WISP
        ability ABILITY_SOLID_ROCK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_QUIET
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 54
        pokemon SPECIES_FLYGON
        item ITEM_EXPERT_BELT
        move MOVE_DRAGON_PULSE
        move MOVE_EARTH_POWER
        move MOVE_BUG_BUZZ
        move MOVE_FLAMETHROWER
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 54
        pokemon SPECIES_SANDSLASH
        item ITEM_SCOPE_LENS
        move MOVE_DRILL_RUN
        move MOVE_NIGHT_SLASH
        move MOVE_POISON_JAB
        move MOVE_SLASH
        ability ABILITY_SAND_RUSH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 54
        pokemon SPECIES_AERODACTYL
        item ITEM_AERODACTYLITE
        move MOVE_ROCK_SLIDE
        move MOVE_DUAL_WINGBEAT
        move MOVE_PROTECT
        move MOVE_ICE_FANG
        ability ABILITY_UNNERVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 55, "Drasna"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_DRASNA
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 55
        // mon 0
        ivs 255
        abilityslot 0
        level 55
        pokemon SPECIES_DRUDDIGON
        item ITEM_ROCKY_HELMET
        move MOVE_DRAGON_TAIL
        move MOVE_EARTHQUAKE
        move MOVE_TOXIC
        move MOVE_PROTECT
        ability ABILITY_MOLD_BREAKER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 55
        pokemon SPECIES_STEELIX
        item ITEM_QUICK_CLAW
        move MOVE_HEAVY_SLAM
        move MOVE_EARTHQUAKE
        move MOVE_ROAR
        move MOVE_AQUA_TAIL
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 55
        pokemon SPECIES_GARCHOMP
        item ITEM_LEFTOVERS
        move MOVE_EARTHQUAKE
        move MOVE_DRAGON_CLAW
        move MOVE_FIRE_FANG
        move MOVE_POISON_JAB
        ability ABILITY_ROUGH_SKIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 55
        pokemon SPECIES_RAMPARDOS
        item ITEM_CHOICE_BAND
        move MOVE_HEAD_SMASH
        move MOVE_EARTHQUAKE
        move MOVE_ZEN_HEADBUTT
        move MOVE_FIRE_PUNCH
        ability ABILITY_MOLD_BREAKER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 55
        pokemon SPECIES_SHELGON
        item ITEM_EVIOLITE
        move MOVE_OUTRAGE
        move MOVE_DRAGON_DANCE
        move MOVE_ZEN_HEADBUTT
        move MOVE_ROCK_SLIDE
        ability ABILITY_OVERCOAT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

    endparty

trainerdata 56, "Aaron"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_AARON
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 56
        // mon 0
        ivs 255
        abilityslot 0
        level 56
        pokemon SPECIES_LOKIX
        item ITEM_EJECT_BUTTON
        move MOVE_FIRST_IMPRESSION
        move MOVE_KNOCK_OFF
        move MOVE_U_TURN
        move MOVE_AXE_KICK
        ability ABILITY_TINTED_LENS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 56
        pokemon SPECIES_SHUCKLE
        item ITEM_LEFTOVERS
        move MOVE_GYRO_BALL
        move MOVE_STICKY_WEB
        move MOVE_TOXIC
        move MOVE_PROTECT
        ability ABILITY_CONTRARY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 56
        pokemon SPECIES_SCIZOR
        item ITEM_CHOICE_BAND
        move MOVE_BULLET_PUNCH
        move MOVE_U_TURN
        move MOVE_DUAL_WINGBEAT
        move MOVE_CLOSE_COMBAT
        ability ABILITY_TECHNICIAN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 56
        pokemon SPECIES_DRAPION
        item ITEM_SHUCA_BERRY
        move MOVE_POISON_JAB
        move MOVE_KNOCK_OFF
        move MOVE_EARTHQUAKE
        move MOVE_AQUA_TAIL
        ability ABILITY_BATTLE_ARMOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 56
        pokemon SPECIES_HERACROSS
        item ITEM_HERACRONITE
        move MOVE_CLOSE_COMBAT
        move MOVE_PIN_MISSILE
        move MOVE_SWORDS_DANCE
        move MOVE_ROCK_BLAST
        ability ABILITY_MOXIE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 57, "Acerola"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_ACEROLA
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 57
        // mon 0
        ivs 255
        abilityslot 0
        level 57
        pokemon SPECIES_GOLURK
        item ITEM_PUNCHING_GLOVE
        move MOVE_EARTHQUAKE
        move MOVE_SHADOW_PUNCH
        move MOVE_ICE_PUNCH
        move MOVE_THUNDER_PUNCH
        ability ABILITY_IRON_FIST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 57
        monwithform SPECIES_DECIDUEYE, 1
        item ITEM_CHOICE_SCARF
        move MOVE_TRIPLE_ARROWS
        move MOVE_LEAF_BLADE
        move MOVE_U_TURN
        move MOVE_BRAVE_BIRD
        ability ABILITY_SCRAPPY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 57
        pokemon SPECIES_MIMIKYU
        item ITEM_RED_CARD
        move MOVE_PLAY_ROUGH
        move MOVE_SWORDS_DANCE
        move MOVE_SHADOW_CLAW
        move MOVE_SHADOW_SNEAK
        ability ABILITY_DISGUISE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 57
        monwithform SPECIES_TYPHLOSION, 1
        item ITEM_LIFE_ORB
        move MOVE_FLAMETHROWER
        move MOVE_SHADOW_BALL
        move MOVE_CALM_MIND
        move MOVE_WILL_O_WISP
        ability ABILITY_BLAZE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 57
        pokemon SPECIES_BANETTE
        item ITEM_BANETTITE
        move MOVE_SHADOW_CLAW
        move MOVE_GUNK_SHOT
        move MOVE_KNOCK_OFF
        move MOVE_DESTINY_BOND
        ability ABILITY_INSOMNIA
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 58, "Olivia"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_OLIVIA
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 58
        // mon 0
        ivs 255
        abilityslot 0
        level 58
        pokemon SPECIES_LYCANROC
        item ITEM_FOCUS_SASH
        move MOVE_STONE_EDGE
        move MOVE_ROAR
        move MOVE_ENDEAVOR
        move MOVE_ACCELEROCK
        ability ABILITY_SAND_RUSH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 58
        pokemon SPECIES_CRADILY
        item ITEM_LEFTOVERS
        move MOVE_GIGA_DRAIN
        move MOVE_TOXIC
        move MOVE_RECOVER
        move MOVE_PROTECT
        ability ABILITY_STORM_DRAIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 58
        pokemon SPECIES_EXCADRILL
        item ITEM_AIR_BALLOON
        move MOVE_EARTHQUAKE
        move MOVE_IRON_HEAD
        move MOVE_SWORDS_DANCE
        move MOVE_ROCK_SLIDE
        ability ABILITY_SAND_RUSH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 58
        pokemon SPECIES_REGIROCK
        item ITEM_PUNCHING_GLOVE
        move MOVE_ROCK_SLIDE
        move MOVE_DRAIN_PUNCH
        move MOVE_THUNDER_PUNCH
        move MOVE_ICE_PUNCH
        ability ABILITY_CLEAR_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 58
        pokemon SPECIES_MANDIBUZZ
        item ITEM_ROCKY_HELMET
        move MOVE_KNOCK_OFF
        move MOVE_ROOST
        move MOVE_PROTECT
        move MOVE_WHIRLWIND
        ability ABILITY_OVERCOAT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 58
        pokemon SPECIES_AGGRON
        item ITEM_AGGRONITE
        move MOVE_HEAVY_SLAM
        move MOVE_EARTHQUAKE
        move MOVE_FIRE_PUNCH
        move MOVE_REST
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

    endparty

trainerdata 97, "Sada"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_SADA
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 97
        // mon 0
        ivs 255
        abilityslot 0
        level 96
        pokemon SPECIES_KORAIDON
        item ITEM_LIFE_ORB
        move MOVE_OUTRAGE
        move MOVE_CLOSE_COMBAT
        move MOVE_FLARE_BLITZ
        move MOVE_SHADOW_CLAW
        ability ABILITY_ORICHALCUM_PULSE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 96
        pokemon SPECIES_FLUTTER_MANE
        item ITEM_CHOICE_SCARF
        move MOVE_SHADOW_BALL
        move MOVE_MOONBLAST
        move MOVE_PSYSHOCK
        move MOVE_POWER_GEM
        ability ABILITY_PROTOSYNTHESIS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 96
        pokemon SPECIES_GREAT_TUSK
        item ITEM_ROCKY_HELMET
        move MOVE_HEADLONG_RUSH
        move MOVE_CLOSE_COMBAT
        move MOVE_KNOCK_OFF
        move MOVE_FIRE_FANG
        ability ABILITY_PROTOSYNTHESIS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 96
        pokemon SPECIES_AERODACTYL
        item ITEM_FOCUS_SASH
        move MOVE_STONE_EDGE
        move MOVE_DUAL_WINGBEAT
        move MOVE_EARTHQUAKE
        move MOVE_THUNDER_FANG
        ability ABILITY_ROCK_HEAD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 96
        monwithform SPECIES_LILLIGANT, 1
        item ITEM_LIFE_ORB
        move MOVE_SOLAR_BLADE
        move MOVE_CLOSE_COMBAT
        move MOVE_TRIPLE_AXEL
        move MOVE_POISON_JAB
        ability ABILITY_CHLOROPHYLL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 96
        pokemon SPECIES_CAMERUPT
        item ITEM_CAMERUPTITE
        move MOVE_FIRE_BLAST
        move MOVE_EARTH_POWER
        move MOVE_SOLAR_BEAM
        move MOVE_TOXIC
        ability ABILITY_SOLID_ROCK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

    endparty

trainerdata 98, "Diantha"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_DIANTHA
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 98
        // mon 0
        ivs 255
        abilityslot 0
        level 98
        pokemon SPECIES_DIANCIE
        item ITEM_ROCKY_HELMET
        move MOVE_DIAMOND_STORM
        move MOVE_MOONBLAST
        move MOVE_STEALTH_ROCK
        move MOVE_SCORCHING_SANDS
        ability ABILITY_CLEAR_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 98
        pokemon SPECIES_ZYGARDE
        item ITEM_LUM_BERRY
        move MOVE_THOUSAND_WAVES
        move MOVE_DRAGON_DANCE
        move MOVE_REST
        move MOVE_BREAKING_SWIPE
        ability ABILITY_AURA_BREAK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 98
        pokemon SPECIES_DELPHOX
        item ITEM_LIFE_ORB
        move MOVE_MYSTICAL_FIRE
        move MOVE_PSYSHOCK
        move MOVE_NASTY_PLOT
        move MOVE_DAZZLING_GLEAM
        ability ABILITY_BLAZE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 98
        pokemon SPECIES_XERNEAS
        item ITEM_POWER_HERB
        move MOVE_MOONBLAST
        move MOVE_GEOMANCY
        move MOVE_THUNDERBOLT
        move MOVE_PSYCHIC
        ability ABILITY_FAIRY_AURA
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 98
        pokemon SPECIES_HAWLUCHA
        item ITEM_WHITE_HERB
        move MOVE_ACROBATICS
        move MOVE_CLOSE_COMBAT
        move MOVE_SWORDS_DANCE
        move MOVE_FIRE_PUNCH
        ability ABILITY_UNBURDEN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 98
        pokemon SPECIES_GARDEVOIR
        item ITEM_GARDEVOIRITE
        move MOVE_PSYSHOCK
        move MOVE_HYPER_VOICE
        move MOVE_FOCUS_BLAST
        move MOVE_WILL_O_WISP
        ability ABILITY_TRACE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 99, "Turo"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_TURO
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 99
        // mon 0
        ivs 255
        abilityslot 0
        level 99
        pokemon SPECIES_MIRAIDON
        item ITEM_WHITE_HERB
        move MOVE_THUNDER
        move MOVE_DRAGON_PULSE
        move MOVE_U_TURN
        move MOVE_OVERHEAT
        ability ABILITY_HADRON_ENGINE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 99
        pokemon SPECIES_IRON_CROWN
        item ITEM_CHOICE_SPECS
        move MOVE_TACHYON_CUTTER
        move MOVE_PSYCHIC_NOISE
        move MOVE_FOCUS_BLAST
        move MOVE_VOLT_SWITCH
        ability ABILITY_QUARK_DRIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 99
        monwithform SPECIES_ROTOM, 2
        item ITEM_RINDO_BERRY
        move MOVE_HYDRO_PUMP
        move MOVE_VOLT_SWITCH
        move MOVE_WILL_O_WISP
        move MOVE_REFLECT
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 99
        pokemon SPECIES_PORYGON_Z
        item ITEM_WISE_GLASSES
        move MOVE_HYPER_BEAM
        move MOVE_THUNDERBOLT
        move MOVE_ICE_BEAM
        move MOVE_SHADOW_BALL
        ability ABILITY_ADAPTABILITY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 99
        pokemon SPECIES_IRON_VALIANT
        item ITEM_LIFE_ORB
        move MOVE_MOONBLAST
        move MOVE_CLOSE_COMBAT
        move MOVE_KNOCK_OFF
        move MOVE_SHADOW_BALL
        ability ABILITY_QUARK_DRIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_NAIVE
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 99
        pokemon SPECIES_AMPHAROS
        item ITEM_AMPHAROSITE
        move MOVE_DRAGON_PULSE
        move MOVE_THUNDERBOLT
        move MOVE_FOCUS_BLAST
        move MOVE_SIGNAL_BEAM
        ability ABILITY_STATIC
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

    endparty

trainerdata 100, "Steven"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_SHINY_LOCK | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_STEVEN
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 100
        // mon 0
        ivs 255
        abilityslot 0
        level 100
        pokemon SPECIES_MELMETAL
        item ITEM_PUNCHING_GLOVE
        move MOVE_DOUBLE_IRON_BASH
        move MOVE_THUNDER_WAVE
        move MOVE_THUNDER_PUNCH
        move MOVE_EARTHQUAKE
        ability ABILITY_IRON_FIST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        shinylock 0
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 100
        monwithform SPECIES_DEOXYS, 2
        item ITEM_ROCKY_HELMET
        move MOVE_NIGHT_SHADE
        move MOVE_COSMIC_POWER
        move MOVE_RECOVER
        move MOVE_KNOCK_OFF
        ability ABILITY_PRESSURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        shinylock 0
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 100
        pokemon SPECIES_ZAMAZENTA
        item ITEM_LEFTOVERS
        move MOVE_BODY_PRESS
        move MOVE_IRON_DEFENSE
        move MOVE_CRUNCH
        move MOVE_PSYCHIC_FANGS
        ability ABILITY_DAUNTLESS_SHIELD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        shinylock 0
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 100
        pokemon SPECIES_DIALGA
        item ITEM_ADAMANT_ORB
        move MOVE_ROAR_OF_TIME
        move MOVE_FLASH_CANNON
        move MOVE_EARTH_POWER
        move MOVE_FLAMETHROWER
        ability ABILITY_PRESSURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        shinylock 0
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 100
        pokemon SPECIES_IRON_LEAVES
        item ITEM_TANGA_BERRY
        move MOVE_LEAF_BLADE
        move MOVE_PSYBLADE
        move MOVE_CLOSE_COMBAT
        move MOVE_WILD_CHARGE
        ability ABILITY_QUARK_DRIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        shinylock 0
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 100
        pokemon SPECIES_METAGROSS
        item ITEM_METAGROSSITE
        move MOVE_METEOR_MASH
        move MOVE_ICE_PUNCH
        move MOVE_THUNDER_PUNCH
        move MOVE_EARTHQUAKE
        ability ABILITY_CLEAR_BODY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        shinylock 1
        ballseal 0

    endparty

trainerdata 27, "Chuck"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_CHUCK
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 27
        // mon 0
        ivs 255
        abilityslot 0
        level 27
        pokemon SPECIES_HITMONTOP
        item ITEM_EJECT_BUTTON
        move MOVE_TRIPLE_KICK
        move MOVE_FAKE_OUT
        move MOVE_PURSUIT
        move MOVE_BULLET_PUNCH
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 27
        pokemon SPECIES_GRAPPLOCT
        item ITEM_BINDING_BAND
        move MOVE_ROCK_SMASH
        move MOVE_WHIRLPOOL
        move MOVE_DETECT
        move MOVE_MUD_SHOT
        ability ABILITY_TECHNICIAN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_RELAXED
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 27
        pokemon SPECIES_POLIWRATH
        item ITEM_SHELL_BELL
        move MOVE_POWER_UP_PUNCH
        move MOVE_HYPNOSIS
        move MOVE_POISON_JAB
        move MOVE_ICE_PUNCH
        ability ABILITY_WATER_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 28, "Elesa"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_ELESA
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 28
        // mon 0
        ivs 255
        abilityslot 0
        level 28
        pokemon SPECIES_EMOLGA
        item ITEM_CHOICE_SCARF
        move MOVE_VOLT_SWITCH
        move MOVE_U_TURN
        move MOVE_DUAL_WINGBEAT
        move MOVE_ENERGY_BALL
        ability ABILITY_STATIC
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 28
        pokemon SPECIES_MAGNETON
        item ITEM_SHUCA_BERRY
        move MOVE_FLASH_CANNON
        move MOVE_THUNDERBOLT
        move MOVE_TRI_ATTACK
        move MOVE_MAGNET_RISE
        ability ABILITY_MAGNET_PULL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 28
        pokemon SPECIES_DEDENNE
        item ITEM_SITRUS_BERRY
        move MOVE_NUZZLE
        move MOVE_U_TURN
        move MOVE_CHARM
        move MOVE_SEED_BOMB
        ability ABILITY_CHEEK_POUCH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

    endparty

trainerdata 29, "Fantina"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_FANTINA
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 29
        // mon 0
        ivs 255
        abilityslot 0
        level 29
        pokemon SPECIES_POLTEAGEIST
        item ITEM_COLBUR_BERRY
        move MOVE_HEX
        move MOVE_GIGA_DRAIN
        move MOVE_NASTY_PLOT
        move MOVE_WILL_O_WISP
        ability ABILITY_WEAK_ARMOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 29
        pokemon SPECIES_ROTOM
        item ITEM_EJECT_BUTTON
        move MOVE_HEX
        move MOVE_THUNDER_WAVE
        move MOVE_REFLECT
        move MOVE_LIGHT_SCREEN
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 29
        pokemon SPECIES_SPIRITOMB
        item ITEM_BIG_ROOT
        move MOVE_HEX
        move MOVE_HYPNOSIS
        move MOVE_DREAM_EATER
        move MOVE_PURSUIT
        ability ABILITY_PRESSURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_QUIET
        ballseal 0

    endparty

trainerdata 30, "Cheryl"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_CHERYL
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 30
        // mon 0
        ivs 255
        abilityslot 0
        level 30
        pokemon SPECIES_DRIFBLIM
        item ITEM_SITRUS_BERRY
        move MOVE_OMINOUS_WIND
        move MOVE_STOCKPILE
        move MOVE_BATON_PASS
        move MOVE_WILL_O_WISP
        ability ABILITY_UNBURDEN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 30
        pokemon SPECIES_GROVYLE
        item ITEM_GRASSY_SEED
        move MOVE_SEED_BOMB
        move MOVE_THUNDER_PUNCH
        move MOVE_BRICK_BREAK
        move MOVE_AERIAL_ACE
        ability ABILITY_UNBURDEN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 30
        pokemon SPECIES_BLISSEY
        item ITEM_LEFTOVERS
        move MOVE_SEISMIC_TOSS
        move MOVE_PROTECT
        move MOVE_CHARM
        move MOVE_TOXIC
        ability ABILITY_NATURAL_CURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

    endparty

trainerdata 31, "Kabu"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_KABU
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 31
        // mon 0
        ivs 255
        abilityslot 0
        level 31
        pokemon SPECIES_NINETALES
        item ITEM_BINDING_BAND
        move MOVE_FIRE_SPIN
        move MOVE_DISABLE
        move MOVE_CONFUSE_RAY
        move MOVE_SOLAR_BEAM
        ability ABILITY_DROUGHT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 31
        monwithform SPECIES_SAWSBUCK, 1
        item ITEM_BIG_ROOT
        move MOVE_HORN_LEECH
        move MOVE_TAKE_DOWN
        move MOVE_HIGH_HORSEPOWER
        move MOVE_GRASSY_GLIDE
        ability ABILITY_CHLOROPHYLL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 31
        pokemon SPECIES_CENTISKORCH
        item ITEM_CHARTI_BERRY
        move MOVE_SKITTER_SMACK
        move MOVE_FIRE_FANG
        move MOVE_COIL
        move MOVE_THUNDER_FANG
        ability ABILITY_FLASH_FIRE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 32, "Burgh"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BURGH
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 32
        // mon 0
        ivs 255
        abilityslot 0
        level 32
        pokemon SPECIES_CRUSTLE
        item ITEM_CUSTAP_BERRY
        move MOVE_ROCK_BLAST
        move MOVE_STEALTH_ROCK
        move MOVE_BUG_BITE
        move MOVE_AERIAL_ACE
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BRAVE
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 32
        pokemon SPECIES_ACCELGOR
        item ITEM_GRASSY_SEED
        move MOVE_LEECH_LIFE
        move MOVE_GIGA_DRAIN
        move MOVE_DRAIN_PUNCH
        move MOVE_WATER_SHURIKEN
        ability ABILITY_UNBURDEN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_NAIVE
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 32
        pokemon SPECIES_LEAVANNY
        item ITEM_FOCUS_SASH
        move MOVE_LEAF_BLADE
        move MOVE_SWORDS_DANCE
        move MOVE_SKITTER_SMACK
        move MOVE_GRASSY_GLIDE
        ability ABILITY_SWARM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 33, "Brassius"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BRASSIUS
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 33
        // mon 0
        ivs 255
        abilityslot 0
        level 33
        pokemon SPECIES_AMOONGUSS
        item ITEM_BLACK_SLUDGE
        move MOVE_GIGA_DRAIN
        move MOVE_SPORE
        move MOVE_SLUDGE_BOMB
        move MOVE_HEX
        ability ABILITY_REGENERATOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 33
        pokemon SPECIES_SUDOWOODO
        item ITEM_MUSCLE_BAND
        move MOVE_ROCK_SLIDE
        move MOVE_COUNTER
        move MOVE_FIRE_PUNCH
        move MOVE_ICE_PUNCH
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 33
        pokemon SPECIES_TREVENANT
        item ITEM_SITRUS_BERRY
        move MOVE_SHADOW_CLAW
        move MOVE_HORN_LEECH
        move MOVE_WILL_O_WISP
        move MOVE_DRAIN_PUNCH
        ability ABILITY_HARVEST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 33
        pokemon SPECIES_PARASECT
        item ITEM_FOCUS_SASH
        move MOVE_X_SCISSOR
        move MOVE_SPORE
        move MOVE_SWORDS_DANCE
        move MOVE_BRICK_BREAK
        ability ABILITY_DRY_SKIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 34, "Janine"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_JANINE
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 34
        // mon 0
        ivs 255
        abilityslot 0
        level 34
        pokemon SPECIES_ARIADOS
        item ITEM_SCOPE_LENS
        move MOVE_PIN_MISSILE
        move MOVE_CROSS_POISON
        move MOVE_TOXIC_SPIKES
        move MOVE_SUCKER_PUNCH
        ability ABILITY_SNIPER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 34
        pokemon SPECIES_QWILFISH
        item ITEM_SALAC_BERRY
        move MOVE_AQUA_TAIL
        move MOVE_POISON_JAB
        move MOVE_SWORDS_DANCE
        move MOVE_CRUNCH
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 34
        pokemon SPECIES_SKUNTANK
        item ITEM_SHUCA_BERRY
        move MOVE_POISON_JAB
        move MOVE_PURSUIT
        move MOVE_SCREECH
        move MOVE_FLAMETHROWER
        ability ABILITY_AFTERMATH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_NAUGHTY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 34
        pokemon SPECIES_CROBAT
        item ITEM_BLACK_SLUDGE
        move MOVE_FLY
        move MOVE_PROTECT
        move MOVE_TOXIC
        move MOVE_ROOST
        ability ABILITY_INFILTRATOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 35, "Bugsy"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BUGSY
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 35
        // mon 0
        ivs 255
        abilityslot 0
        level 35
        pokemon SPECIES_FORRETRESS
        item ITEM_OCCA_BERRY
        move MOVE_BUG_BITE
        move MOVE_TOXIC_SPIKES
        move MOVE_STEALTH_ROCK
        move MOVE_DRILL_RUN
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 35
        pokemon SPECIES_VIBRAVA
        item ITEM_WISE_GLASSES
        move MOVE_SCORCHING_SANDS
        move MOVE_DRAGON_BREATH
        move MOVE_AIR_SLASH
        move MOVE_U_TURN
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_NAIVE
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 35
        pokemon SPECIES_VIKAVOLT
        item ITEM_MAGNET
        move MOVE_BUG_BUZZ
        move MOVE_THUNDERBOLT
        move MOVE_ENERGY_BALL
        move MOVE_AIR_SLASH
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 35
        pokemon SPECIES_KLEAVOR
        item ITEM_RED_CARD
        move MOVE_STONE_AXE
        move MOVE_SLASH
        move MOVE_ACROBATICS
        move MOVE_BRICK_BREAK
        ability ABILITY_SHARPNESS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 36, "Gardenia"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_GARDENIA
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 36
        // mon 0
        ivs 255
        abilityslot 0
        level 36
        pokemon SPECIES_TORTERRA
        item ITEM_ROCKY_HELMET
        move MOVE_GIGA_DRAIN
        move MOVE_SCORCHING_SANDS
        move MOVE_STEALTH_ROCK
        move MOVE_CRUNCH
        ability ABILITY_OVERGROW
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_RELAXED
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 36
        pokemon SPECIES_BRELOOM
        item ITEM_TOXIC_ORB
        move MOVE_DRAIN_PUNCH
        move MOVE_SEED_BOMB
        move MOVE_THUNDER_PUNCH
        move MOVE_MACH_PUNCH
        ability ABILITY_POISON_HEAL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 36
        pokemon SPECIES_GOGOAT
        item ITEM_BIG_ROOT
        move MOVE_HORN_LEECH
        move MOVE_BODY_SLAM
        move MOVE_HIGH_HORSEPOWER
        move MOVE_AERIAL_ACE
        ability ABILITY_GRASS_PELT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 36
        pokemon SPECIES_GOURGEIST
        item ITEM_GRASSY_SEED
        move MOVE_GIGA_DRAIN
        move MOVE_LEECH_SEED
        move MOVE_MYSTICAL_FIRE
        move MOVE_LIGHT_SCREEN
        ability ABILITY_INSOMNIA
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 36
        pokemon SPECIES_ROSERADE
        item ITEM_BLACK_SLUDGE
        move MOVE_GIGA_DRAIN
        move MOVE_POISON_JAB
        move MOVE_SLEEP_POWDER
        move MOVE_EXTRASENSORY
        ability ABILITY_NATURAL_CURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 36
        pokemon SPECIES_SCEPTILE
        item ITEM_SCEPTILITE
        move MOVE_GRASSY_GLIDE
        move MOVE_DUAL_CHOP
        move MOVE_NIGHT_SLASH
        move MOVE_ROCK_TOMB
        ability ABILITY_OVERGROW
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 101, "Oak"
    trainermontype TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_ITEMS | TRAINER_DATA_TYPE_ADDITIONAL_FLAGS | TRAINER_DATA_TYPE_IV_EV_SET | 0
    trainerclass TRAINERCLASS_OAK
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 101
        // mon 0
        ivs 255
        abilityslot 0
        level 1
        pokemon SPECIES_RATTATA
        item ITEM_SILK_SCARF
        move MOVE_QUICK_ATTACK
        move MOVE_NONE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_GUTS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        additionalflags TRAINER_DATA_EXTRA_TYPE_STATUS
        status 0x10
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 1
        pokemon SPECIES_BULBASAUR
        item ITEM_MIRACLE_SEED
        move MOVE_LEAFAGE
        move MOVE_NONE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_OVERGROW
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        additionalflags 0
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 1
        pokemon SPECIES_CHARMANDER
        item ITEM_CHARCOAL
        move MOVE_EMBER
        move MOVE_NONE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_BLAZE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        additionalflags 0
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 1
        pokemon SPECIES_SQUIRTLE
        item ITEM_MYSTIC_WATER
        move MOVE_BUBBLE
        move MOVE_NONE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_TORRENT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        additionalflags 0
        ballseal 0

    endparty

trainerdata 2, "Bianca"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BIANCA
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 2
        // mon 0
        ivs 255
        abilityslot 0
        level 2
        pokemon SPECIES_LILLIPUP
        item ITEM_MUSCLE_BAND
        move MOVE_TACKLE
        move MOVE_FIRE_FANG
        move MOVE_ICE_FANG
        move MOVE_THUNDER_FANG
        ability ABILITY_VITAL_SPIRIT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 2
        pokemon SPECIES_PATRAT
        item ITEM_BLACK_GLASSES
        move MOVE_TACKLE
        move MOVE_BITE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_ANALYTIC
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BRAVE
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 2
        pokemon SPECIES_PIDOVE
        item ITEM_SCOPE_LENS
        move MOVE_AIR_CUTTER
        move MOVE_QUICK_ATTACK
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_SUPER_LUCK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 3, "Tierno"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_TIERNO
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 3
        // mon 0
        ivs 255
        abilityslot 0
        level 3
        pokemon SPECIES_PANSAGE
        item ITEM_SALAC_BERRY
        move MOVE_BULLET_SEED
        move MOVE_HONE_CLAWS
        move MOVE_ROCK_TOMB
        move MOVE_LOW_SWEEP
        ability ABILITY_GLUTTONY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 3
        pokemon SPECIES_CORPHISH
        item ITEM_MYSTIC_WATER
        move MOVE_AQUA_JET
        move MOVE_VICE_GRIP
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_ADAPTABILITY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 3
        pokemon SPECIES_FLETCHLING
        item ITEM_SHARP_BEAK
        move MOVE_AERIAL_ACE
        move MOVE_ROOST
        move MOVE_EMBER
        move MOVE_STEEL_WING
        ability ABILITY_GALE_WINGS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 4, "Wally"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_WALLY
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 4
        // mon 0
        ivs 255
        abilityslot 0
        level 4
        pokemon SPECIES_RALTS
        item ITEM_BIG_ROOT
        move MOVE_CONFUSION
        move MOVE_HYPNOSIS
        move MOVE_DREAM_EATER
        move MOVE_NONE
        ability ABILITY_SYNCHRONIZE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 4
        pokemon SPECIES_MAGNEMITE
        item ITEM_MAGNET
        move MOVE_THUNDER_SHOCK
        move MOVE_SONIC_BOOM
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_MAGNET_PULL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 4
        pokemon SPECIES_MARILL
        item ITEM_LUM_BERRY
        move MOVE_AQUA_JET
        move MOVE_ROLLOUT
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_HUGE_POWER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

    endparty

trainerdata 5, "Tcheren"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_TCHEREN
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 5
        // mon 0
        ivs 255
        abilityslot 0
        level 5
        pokemon SPECIES_MINCCINO
        item ITEM_KINGS_ROCK
        move MOVE_TAIL_SLAP
        move MOVE_BULLET_SEED
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_SKILL_LINK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 5
        pokemon SPECIES_COTTONEE
        item ITEM_BIG_ROOT
        move MOVE_MEGA_DRAIN
        move MOVE_STUN_SPORE
        move MOVE_CHARM
        move MOVE_LEECH_SEED
        ability ABILITY_PRANKSTER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 5
        pokemon SPECIES_SANDSHREW
        item ITEM_SOFT_SAND
        move MOVE_BULLDOZE
        move MOVE_ROLLOUT
        move MOVE_FURY_CUTTER
        move MOVE_NONE
        ability ABILITY_SAND_RUSH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 6, "Lillie"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_LILLIE
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 6
        // mon 0
        ivs 255
        abilityslot 0
        level 6
        pokemon SPECIES_CUTIEFLY
        item ITEM_FOCUS_BAND
        move MOVE_DRAINING_KISS
        move MOVE_STICKY_WEB
        move MOVE_STUN_SPORE
        move MOVE_REFLECT
        ability ABILITY_SHIELD_DUST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 6
        pokemon SPECIES_POPPLIO
        item ITEM_METRONOME
        move MOVE_ECHOED_VOICE
        move MOVE_NONE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_LIQUID_VOICE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 6
        pokemon SPECIES_VULPIX
        item ITEM_BERRY_JUICE
        move MOVE_INCINERATE
        move MOVE_OMINOUS_WIND
        move MOVE_QUICK_ATTACK
        move MOVE_NONE
        ability ABILITY_FLASH_FIRE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        ballseal 0

    endparty

trainerdata 7, "Milo"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_MILO
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 7
        // mon 0
        ivs 255
        abilityslot 0
        level 7
        pokemon SPECIES_GROOKEY
        item ITEM_MIRACLE_SEED
        move MOVE_GRASSY_GLIDE
        move MOVE_FAKE_OUT
        move MOVE_U_TURN
        move MOVE_NONE
        ability ABILITY_GRASSY_SURGE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 7
        pokemon SPECIES_BONSLY
        item ITEM_HARD_STONE
        move MOVE_ROCK_TOMB
        move MOVE_FLAIL
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 7
        pokemon SPECIES_GOSSIFLEUR
        item ITEM_BERRY_JUICE
        move MOVE_GRASSY_GLIDE
        move MOVE_CHARM
        move MOVE_ATTRACT
        move MOVE_LEECH_SEED
        ability ABILITY_EFFECT_SPORE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

    endparty

trainerdata 8, "Ilima"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ADDITIONAL_FLAGS | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_ILIMA
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 8
        // mon 0
        ivs 255
        abilityslot 0
        level 8
        pokemon SPECIES_SMEARGLE
        item ITEM_CHOPLE_BERRY
        move MOVE_ACROBATICS
        move MOVE_SPORE
        move MOVE_STICKY_WEB
        move MOVE_STEALTH_ROCK
        ability ABILITY_OWN_TEMPO
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        additionalflags 0
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 8
        pokemon SPECIES_YUNGOOS
        item ITEM_SILK_SCARF
        move MOVE_LAST_RESORT
        move MOVE_SUPER_FANG
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_ADAPTABILITY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        additionalflags 0
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 8
        pokemon SPECIES_TAILLOW
        item ITEM_SHARP_BEAK
        move MOVE_FACADE
        move MOVE_WING_ATTACK
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_GUTS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        additionalflags TRAINER_DATA_EXTRA_TYPE_STATUS
        status 0x10
        ballseal 0

    endparty

trainerdata 9, "Lisia"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_LISIA
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 9
        // mon 0
        ivs 255
        abilityslot 0
        level 9
        pokemon SPECIES_SWABLU
        item ITEM_WACAN_BERRY
        move MOVE_DISARMING_VOICE
        move MOVE_GUST
        move MOVE_TWISTER
        move MOVE_NONE
        ability ABILITY_CLOUD_NINE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 9
        pokemon SPECIES_MINUN
        item ITEM_BERRY_JUICE
        move MOVE_SHOCK_WAVE
        move MOVE_SWIFT
        move MOVE_FAKE_OUT
        move MOVE_CHARM
        ability ABILITY_VOLT_ABSORB
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_RELAXED
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 9
        pokemon SPECIES_FEEBAS
        item ITEM_CHOICE_BAND
        move MOVE_WATERFALL
        move MOVE_DOUBLE_EDGE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_ADAPTABILITY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 10, "Viola"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_VIOLA
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 10
        // mon 0
        ivs 255
        abilityslot 0
        level 10
        pokemon SPECIES_SURSKIT
        item ITEM_DAMP_ROCK
        move MOVE_BUBBLE_BEAM
        move MOVE_RAIN_DANCE
        move MOVE_STICKY_WEB
        move MOVE_MUD_SHOT
        ability ABILITY_SWIFT_SWIM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 10
        pokemon SPECIES_DWEBBLE
        item ITEM_LIECHI_BERRY
        move MOVE_BUG_BITE
        move MOVE_ROCK_TOMB
        move MOVE_STEALTH_ROCK
        move MOVE_BULLDOZE
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 10
        pokemon SPECIES_VIVILLON
        item ITEM_CHARTI_BERRY
        move MOVE_STRUGGLE_BUG
        move MOVE_GUST
        move MOVE_SLEEP_POWDER
        move MOVE_MEGA_DRAIN
        ability ABILITY_COMPOUND_EYES
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 11, "Barry"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BARRY
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 11
        // mon 0
        ivs 255
        abilityslot 0
        level 11
        pokemon SPECIES_STARLY
        item ITEM_FOCUS_SASH
        move MOVE_WING_ATTACK
        move MOVE_QUICK_ATTACK
        move MOVE_ENDEAVOR
        move MOVE_NONE
        ability ABILITY_KEEN_EYE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 11
        pokemon SPECIES_RIOLU
        item ITEM_BLACK_BELT
        move MOVE_VACUUM_WAVE
        move MOVE_NASTY_PLOT
        move MOVE_BITE
        move MOVE_NONE
        ability ABILITY_PRANKSTER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_RASH
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 11
        pokemon SPECIES_MUNCHLAX
        item ITEM_GANLON_BERRY
        move MOVE_TACKLE
        move MOVE_BELLY_DRUM
        move MOVE_BITE
        move MOVE_NONE
        ability ABILITY_GLUTTONY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

    endparty

trainerdata 12, "Erika"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_ERIKA
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 12
        // mon 0
        ivs 255
        abilityslot 0
        level 12
        pokemon SPECIES_ODDISH
        item ITEM_HEAT_ROCK
        move MOVE_SOLAR_BEAM
        move MOVE_SUNNY_DAY
        move MOVE_CUT
        move MOVE_NONE
        ability ABILITY_CHLOROPHYLL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 12
        pokemon SPECIES_EXEGGCUTE
        item ITEM_ORAN_BERRY
        move MOVE_CONFUSION
        move MOVE_BULLET_SEED
        move MOVE_LEECH_SEED
        move MOVE_SUNNY_DAY
        ability ABILITY_HARVEST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_RELAXED
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 12
        pokemon SPECIES_TANGELA
        item ITEM_BIG_ROOT
        move MOVE_GIGA_DRAIN
        move MOVE_ANCIENT_POWER
        move MOVE_SLEEP_POWDER
        move MOVE_SHOCK_WAVE
        ability ABILITY_CHLOROPHYLL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

    endparty

trainerdata 13, "Tulip"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_TULIP
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 13
        // mon 0
        ivs 255
        abilityslot 0
        level 13
        pokemon SPECIES_FLABEBE
        item ITEM_LIGHT_CLAY
        move MOVE_DISARMING_VOICE
        move MOVE_CHILLING_WATER
        move MOVE_LIGHT_SCREEN
        move MOVE_HELPING_HAND
        ability ABILITY_FLOWER_VEIL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 13
        pokemon SPECIES_ROSELIA
        item ITEM_BLACK_SLUDGE
        move MOVE_MAGICAL_LEAF
        move MOVE_VENOSHOCK
        move MOVE_SLEEP_POWDER
        move MOVE_SWIFT
        ability ABILITY_POISON_POINT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 13
        pokemon SPECIES_SOLOSIS
        item ITEM_TWISTED_SPOON
        move MOVE_PSYBEAM
        move MOVE_SWIFT
        move MOVE_THUNDER_WAVE
        move MOVE_NIGHT_SHADE
        ability ABILITY_MAGIC_GUARD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

    endparty

trainerdata 14, "Mallow"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_MALLOW
    nummons 3
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 14
        // mon 0
        ivs 255
        abilityslot 0
        level 14
        pokemon SPECIES_BOUNSWEET
        item ITEM_POWER_HERB
        move MOVE_SOLAR_BEAM
        move MOVE_BOUNCE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_LEAF_GUARD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MILD
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 14
        pokemon SPECIES_TRUMBEAK
        item ITEM_MUSCLE_BAND
        move MOVE_PLUCK
        move MOVE_FURY_ATTACK
        move MOVE_ROCK_SMASH
        move MOVE_TAILWIND
        ability ABILITY_KEEN_EYE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 14
        pokemon SPECIES_COMFEY
        item ITEM_BIG_ROOT
        move MOVE_DRAINING_KISS
        move MOVE_GIGA_DRAIN
        move MOVE_CHARM
        move MOVE_LIGHT_SCREEN
        ability ABILITY_TRIAGE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

    endparty

trainerdata 15, "Brock"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BROCK
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 15
        // mon 0
        ivs 255
        abilityslot 0
        level 15
        pokemon SPECIES_OMANYTE
        item ITEM_RINDO_BERRY
        move MOVE_ROCK_TOMB
        move MOVE_WHIRLPOOL
        move MOVE_STEALTH_ROCK
        move MOVE_ICY_WIND
        ability ABILITY_SHELL_ARMOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_RELAXED
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 15
        pokemon SPECIES_CROAGUNK
        item ITEM_MUSCLE_BAND
        move MOVE_ROCK_SMASH
        move MOVE_PURSUIT
        move MOVE_FAKE_OUT
        move MOVE_ICE_PUNCH
        ability ABILITY_DRY_SKIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 15
        pokemon SPECIES_ONIX
        item ITEM_CUSTAP_BERRY
        move MOVE_ROCK_TOMB
        move MOVE_BULLDOZE
        move MOVE_DRAGON_TAIL
        move MOVE_ROCK_SMASH
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 15
        pokemon SPECIES_LILEEP
        item ITEM_LEFTOVERS
        move MOVE_GIGA_DRAIN
        move MOVE_ANCIENT_POWER
        move MOVE_CONFUSE_RAY
        move MOVE_BRINE
        ability ABILITY_STORM_DRAIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

    endparty

trainerdata 16, "Whitney"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_WHITNEY
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 16
        // mon 0
        ivs 255
        abilityslot 0
        level 16
        pokemon SPECIES_CLEFAIRY
        item ITEM_ROCKY_HELMET
        move MOVE_DISARMING_VOICE
        move MOVE_SING
        move MOVE_CHARM
        move MOVE_ICY_WIND
        ability ABILITY_MAGIC_GUARD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 16
        pokemon SPECIES_STUFFUL
        item ITEM_MUSCLE_BAND
        move MOVE_FORCE_PALM
        move MOVE_FACADE
        move MOVE_BRUTAL_SWING
        move MOVE_AERIAL_ACE
        ability ABILITY_FLUFFY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 16
        pokemon SPECIES_SNUBBULL
        item ITEM_EXPERT_BELT
        move MOVE_FIRE_FANG
        move MOVE_ICE_FANG
        move MOVE_THUNDER_FANG
        move MOVE_NONE
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 16
        pokemon SPECIES_JIGGLYPUFF
        item ITEM_METRONOME
        move MOVE_ECHOED_VOICE
        move MOVE_DISARMING_VOICE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_COMPETITIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 16
        pokemon SPECIES_TOGETIC
        item ITEM_LUM_BERRY
        move MOVE_AIR_CUTTER
        move MOVE_ANCIENT_POWER
        move MOVE_YAWN
        move MOVE_TAILWIND
        ability ABILITY_SERENE_GRACE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 16
        pokemon SPECIES_MILTANK
        item ITEM_CHOPLE_BERRY
        move MOVE_STOMP
        move MOVE_ROLLOUT
        move MOVE_ATTRACT
        move MOVE_HEART_STAMP
        ability ABILITY_SCRAPPY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_IMPISH
        ballseal 0

    endparty

trainerdata 83, "Bertha"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BERTHA
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 83
        // mon 0
        ivs 255
        abilityslot 0
        level 83
        pokemon SPECIES_HIPPOWDON
        item ITEM_SITRUS_BERRY
        move MOVE_EARTHQUAKE
        move MOVE_STEALTH_ROCK
        move MOVE_SLACK_OFF
        move MOVE_WHIRLWIND
        ability ABILITY_SAND_STREAM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CALM
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 83
        pokemon SPECIES_CELESTEELA
        item ITEM_LEFTOVERS
        move MOVE_HEAVY_SLAM
        move MOVE_PROTECT
        move MOVE_LEECH_SEED
        move MOVE_FLAMETHROWER
        ability ABILITY_BEAST_BOOST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_SASSY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 83
        pokemon SPECIES_DRACOVISH
        item ITEM_CHOICE_BAND
        move MOVE_LIQUIDATION
        move MOVE_OUTRAGE
        move MOVE_EARTHQUAKE
        move MOVE_ZEN_HEADBUTT
        ability ABILITY_SAND_RUSH
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 83
        pokemon SPECIES_IRON_BOULDER
        item ITEM_MUSCLE_BAND
        move MOVE_MIGHTY_CLEAVE
        move MOVE_EARTHQUAKE
        move MOVE_SWORDS_DANCE
        move MOVE_CLOSE_COMBAT
        ability ABILITY_QUARK_DRIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 83
        pokemon SPECIES_STEELIX
        item ITEM_STEELIXITE
        move MOVE_GYRO_BALL
        move MOVE_EARTHQUAKE
        move MOVE_CURSE
        move MOVE_PROTECT
        ability ABILITY_STURDY
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BRAVE
        ballseal 0

    endparty

trainerdata 84, "Agatha"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_AGATHA
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 84
        // mon 0
        ivs 255
        abilityslot 0
        level 84
        pokemon SPECIES_GLIMMORA
        item ITEM_FOCUS_SASH
        move MOVE_SLUDGE_WAVE
        move MOVE_TOXIC_SPIKES
        move MOVE_EARTH_POWER
        move MOVE_DAZZLING_GLEAM
        ability ABILITY_CORROSION
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 84
        pokemon SPECIES_MARSHADOW
        item ITEM_LIFE_ORB
        move MOVE_POLTERGEIST
        move MOVE_LOW_KICK
        move MOVE_ROCK_TOMB
        move MOVE_SHADOW_SNEAK
        ability ABILITY_TECHNICIAN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 84
        pokemon SPECIES_HONCHKROW
        item ITEM_BLACK_GLASSES
        move MOVE_PURSUIT
        move MOVE_BRAVE_BIRD
        move MOVE_U_TURN
        move MOVE_SUPERPOWER
        ability ABILITY_MOXIE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 84
        pokemon SPECIES_ANNIHILAPE
        item ITEM_PUNCHING_GLOVE
        move MOVE_DRAIN_PUNCH
        move MOVE_BULK_UP
        move MOVE_SHADOW_PUNCH
        move MOVE_THUNDER_PUNCH
        ability ABILITY_DEFIANT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 84
        pokemon SPECIES_GENGAR
        item ITEM_GENGARITE
        move MOVE_SHADOW_BALL
        move MOVE_SLUDGE_WAVE
        move MOVE_FOCUS_BLAST
        move MOVE_ICY_WIND
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 85, "Blaine"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BLAINE
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 85
        // mon 0
        ivs 255
        abilityslot 0
        level 85
        monwithform SPECIES_ARCANINE, 1
        item ITEM_MUSCLE_BAND
        move MOVE_FLARE_BLITZ
        move MOVE_HEAD_SMASH
        move MOVE_MORNING_SUN
        move MOVE_EXTREME_SPEED
        ability ABILITY_ROCK_HEAD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 85
        pokemon SPECIES_EXEGGUTOR
        item ITEM_LIFE_ORB
        move MOVE_SOLAR_BEAM
        move MOVE_PSYSHOCK
        move MOVE_SLEEP_POWDER
        move MOVE_SYNTHESIS
        ability ABILITY_CHLOROPHYLL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 85
        monwithform SPECIES_MOLTRES, 1
        item ITEM_SITRUS_BERRY
        move MOVE_FIERY_WRATH
        move MOVE_AIR_SLASH
        move MOVE_U_TURN
        move MOVE_TAILWIND
        ability ABILITY_BERSERK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 85
        pokemon SPECIES_BLAZIKEN
        item ITEM_SHELL_BELL
        move MOVE_FLARE_BLITZ
        move MOVE_CLOSE_COMBAT
        move MOVE_PROTECT
        move MOVE_EARTHQUAKE
        ability ABILITY_SPEED_BOOST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 85
        pokemon SPECIES_IRON_MOTH
        item ITEM_EXPERT_BELT
        move MOVE_FIERY_DANCE
        move MOVE_SLUDGE_WAVE
        move MOVE_SOLAR_BEAM
        move MOVE_DAZZLING_GLEAM
        ability ABILITY_QUARK_DRIVE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 86, "Buck"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BUCK
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 86
        // mon 0
        ivs 255
        abilityslot 0
        level 86
        pokemon SPECIES_DARMANITAN
        item ITEM_CHOICE_SCARF
        move MOVE_FLARE_BLITZ
        move MOVE_U_TURN
        move MOVE_EARTHQUAKE
        move MOVE_ROCK_SLIDE
        ability ABILITY_SHEER_FORCE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 86
        pokemon SPECIES_CLAYDOL
        item ITEM_LEFTOVERS
        move MOVE_SCORCHING_SANDS
        move MOVE_PSYCHIC
        move MOVE_STEALTH_ROCK
        move MOVE_EXPLOSION
        ability ABILITY_LEVITATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_RELAXED
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 86
        pokemon SPECIES_TANGROWTH
        item ITEM_LIFE_ORB
        move MOVE_SOLAR_BLADE
        move MOVE_SLEEP_POWDER
        move MOVE_EARTHQUAKE
        move MOVE_GROWTH
        ability ABILITY_CHLOROPHYLL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 86
        pokemon SPECIES_HEATRAN
        item ITEM_AIR_BALLOON
        move MOVE_MAGMA_STORM
        move MOVE_FLASH_CANNON
        move MOVE_EARTH_POWER
        move MOVE_DRAGON_PULSE
        ability ABILITY_FLASH_FIRE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 86
        monwithform SPECIES_DARMANITAN, 1
        item ITEM_CHOICE_BAND
        move MOVE_ICICLE_CRASH
        move MOVE_FLARE_BLITZ
        move MOVE_EARTHQUAKE
        move MOVE_U_TURN
        ability ABILITY_GORILLA_TACTICS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

    endparty

trainerdata 87, "Kiawe"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_KIAWE
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype DOUBLE_BATTLE
    endentry

    party 87
        // mon 0
        ivs 255
        abilityslot 0
        level 87
        pokemon SPECIES_TAPU_BULU
        item ITEM_CHOICE_BAND
        move MOVE_WOOD_HAMMER
        move MOVE_SUPERPOWER
        move MOVE_STONE_EDGE
        move MOVE_HORN_LEECH
        ability ABILITY_GRASSY_SURGE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 87
        pokemon SPECIES_INCINEROAR
        item ITEM_FIGY_BERRY
        move MOVE_FLARE_BLITZ
        move MOVE_FAKE_OUT
        move MOVE_KNOCK_OFF
        move MOVE_U_TURN
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 87
        pokemon SPECIES_ZARUDE
        item ITEM_MUSCLE_BAND
        move MOVE_SOLAR_BLADE
        move MOVE_KNOCK_OFF
        move MOVE_U_TURN
        move MOVE_GRASSY_GLIDE
        ability ABILITY_LEAF_GUARD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 87
        monwithform SPECIES_MAROWAK, 1
        item ITEM_THICK_CLUB
        move MOVE_SHADOW_BONE
        move MOVE_FLARE_BLITZ
        move MOVE_WILL_O_WISP
        move MOVE_THUNDER_PUNCH
        ability ABILITY_ROCK_HEAD
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 87
        pokemon SPECIES_TERRAKION
        item ITEM_SHUCA_BERRY
        move MOVE_STONE_EDGE
        move MOVE_CLOSE_COMBAT
        move MOVE_HIGH_HORSEPOWER
        move MOVE_POISON_JAB
        ability ABILITY_JUSTIFIED
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 88, "Raihan"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_RAIHAN
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 88
        // mon 0
        ivs 255
        abilityslot 0
        level 88
        pokemon SPECIES_TURTONATOR
        item ITEM_WHITE_HERB
        move MOVE_FIRE_BLAST
        move MOVE_SHELL_SMASH
        move MOVE_DRACO_METEOR
        move MOVE_FLASH_CANNON
        ability ABILITY_SHELL_ARMOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 88
        monwithform SPECIES_EXEGGUTOR, 1
        item ITEM_SITRUS_BERRY
        move MOVE_DRACO_METEOR
        move MOVE_SOLAR_BEAM
        move MOVE_FLAMETHROWER
        move MOVE_PSYSHOCK
        ability ABILITY_HARVEST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 88
        pokemon SPECIES_RHYPERIOR
        item ITEM_MUSCLE_BAND
        move MOVE_EARTHQUAKE
        move MOVE_STONE_EDGE
        move MOVE_MEGAHORN
        move MOVE_FIRE_PUNCH
        ability ABILITY_SOLID_ROCK
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 88
        pokemon SPECIES_SALAZZLE
        item ITEM_AIR_BALLOON
        move MOVE_OVERHEAT
        move MOVE_SLUDGE_WAVE
        move MOVE_FAKE_OUT
        move MOVE_DRAGON_PULSE
        ability ABILITY_CORROSION
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 88
        monwithform SPECIES_CHARIZARD, 1
        item ITEM_CHARIZARDITE_X
        move MOVE_FLARE_BLITZ
        move MOVE_DRAGON_CLAW
        move MOVE_DRAGON_DANCE
        move MOVE_EARTHQUAKE
        ability ABILITY_BLAZE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 89, "Malva"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_MALVA
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 89
        // mon 0
        ivs 255
        abilityslot 0
        level 89
        pokemon SPECIES_TALONFLAME
        item ITEM_SHELL_BELL
        move MOVE_BRAVE_BIRD
        move MOVE_FLARE_BLITZ
        move MOVE_TAILWIND
        move MOVE_U_TURN
        ability ABILITY_GALE_WINGS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 89
        pokemon SPECIES_SANDY_SHOCKS
        item ITEM_AIR_BALLOON
        move MOVE_EARTH_POWER
        move MOVE_VOLT_SWITCH
        move MOVE_FLASH_CANNON
        move MOVE_TRI_ATTACK
        ability ABILITY_PROTOSYNTHESIS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 89
        pokemon SPECIES_CHANDELURE
        item ITEM_EXPERT_BELT
        move MOVE_FIRE_BLAST
        move MOVE_SHADOW_BALL
        move MOVE_CALM_MIND
        move MOVE_SOLAR_BEAM
        ability ABILITY_FLASH_FIRE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 89
        pokemon SPECIES_VIRIZION
        item ITEM_FOCUS_SASH
        move MOVE_SOLAR_BLADE
        move MOVE_CLOSE_COMBAT
        move MOVE_SWORDS_DANCE
        move MOVE_STONE_EDGE
        ability ABILITY_JUSTIFIED
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 89
        pokemon SPECIES_HOUNDOOM
        item ITEM_HOUNDOOMINITE
        move MOVE_FIRE_BLAST
        move MOVE_DARK_PULSE
        move MOVE_NASTY_PLOT
        move MOVE_SOLAR_BEAM
        ability ABILITY_FLASH_FIRE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 90, "Flint"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_FLINT
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 90
        // mon 0
        ivs 255
        abilityslot 0
        level 90
        pokemon SPECIES_INFERNAPE
        item ITEM_FOCUS_SASH
        move MOVE_FIRE_BLAST
        move MOVE_CLOSE_COMBAT
        move MOVE_SOLAR_BEAM
        move MOVE_GUNK_SHOT
        ability ABILITY_BLAZE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 90
        pokemon SPECIES_VICTREEBEL
        item ITEM_LIFE_ORB
        move MOVE_SOLAR_BLADE
        move MOVE_SLUDGE_BOMB
        move MOVE_SLEEP_POWDER
        move MOVE_WEATHER_BALL
        ability ABILITY_CHLOROPHYLL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_HASTY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 90
        pokemon SPECIES_ENTEI
        item ITEM_MUSCLE_BAND
        move MOVE_SACRED_FIRE
        move MOVE_SOLAR_BEAM
        move MOVE_EXTREME_SPEED
        move MOVE_STONE_EDGE
        ability ABILITY_PRESSURE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 90
        pokemon SPECIES_BRUTE_BONNET
        item ITEM_SITRUS_BERRY
        move MOVE_CRUNCH
        move MOVE_SPORE
        move MOVE_SOLAR_BEAM
        move MOVE_CLOSE_COMBAT
        ability ABILITY_PROTOSYNTHESIS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_NAUGHTY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 90
        pokemon SPECIES_BLAZIKEN
        item ITEM_BLAZIKENITE
        move MOVE_CLOSE_COMBAT
        move MOVE_SWORDS_DANCE
        move MOVE_FLARE_BLITZ
        move MOVE_PROTECT
        ability ABILITY_SPEED_BOOST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 91, "Karen"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_KAREN
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 91
        // mon 0
        ivs 255
        abilityslot 0
        level 91
        pokemon SPECIES_UMBREON
        item ITEM_LEFTOVERS
        move MOVE_DARK_PULSE
        move MOVE_REFLECT
        move MOVE_LIGHT_SCREEN
        move MOVE_CONFUSE_RAY
        ability ABILITY_SYNCHRONIZE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 91
        pokemon SPECIES_TING_LU
        item ITEM_SITRUS_BERRY
        move MOVE_EARTHQUAKE
        move MOVE_RUINATION
        move MOVE_WHIRLWIND
        move MOVE_STEALTH_ROCK
        ability ABILITY_VESSEL_OF_RUIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_CAREFUL
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 91
        pokemon SPECIES_TOXAPEX
        item ITEM_BLACK_SLUDGE
        move MOVE_SCALD
        move MOVE_BANEFUL_BUNKER
        move MOVE_RECOVER
        move MOVE_ICE_BEAM
        ability ABILITY_REGENERATOR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_BOLD
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 91
        pokemon SPECIES_MEOWSCARADA
        item ITEM_BRIGHT_POWDER
        move MOVE_FLOWER_TRICK
        move MOVE_KNOCK_OFF
        move MOVE_TRIPLE_AXEL
        move MOVE_U_TURN
        ability ABILITY_PROTEAN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 91
        pokemon SPECIES_ABSOL
        item ITEM_ABSOLITE
        move MOVE_PURSUIT
        move MOVE_SUPERPOWER
        move MOVE_PLAY_ROUGH
        move MOVE_MEGAHORN
        ability ABILITY_JUSTIFIED
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 92, "Giovanni"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ADDITIONAL_FLAGS | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_GIOVANNI
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 92
        // mon 0
        ivs 255
        abilityslot 0
        level 92
        pokemon SPECIES_TYRANITAR
        item ITEM_TYRANITARITE
        move MOVE_STONE_EDGE
        move MOVE_STEALTH_ROCK
        move MOVE_EARTHQUAKE
        move MOVE_CRUNCH
        ability ABILITY_SAND_STREAM
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        additionalflags 0
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 92
        pokemon SPECIES_NIDOKING
        item ITEM_LIFE_ORB
        move MOVE_SLUDGE_WAVE
        move MOVE_EARTH_POWER
        move MOVE_ICE_BEAM
        move MOVE_FLAMETHROWER
        ability ABILITY_SHEER_FORCE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        additionalflags 0
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 92
        pokemon SPECIES_YVELTAL
        item ITEM_LEFTOVERS
        move MOVE_DARK_PULSE
        move MOVE_OBLIVION_WING
        move MOVE_TAUNT
        move MOVE_TOXIC
        ability ABILITY_DARK_AURA
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MILD
        additionalflags 0
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 92
        pokemon SPECIES_PERRSERKER
        item ITEM_MUSCLE_BAND
        move MOVE_IRON_HEAD
        move MOVE_FAKE_OUT
        move MOVE_U_TURN
        move MOVE_PLAY_ROUGH
        ability ABILITY_TOUGH_CLAWS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        additionalflags 0
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 92
        pokemon SPECIES_GLISCOR
        item ITEM_YACHE_BERRY
        move MOVE_EARTHQUAKE
        move MOVE_FACADE
        move MOVE_PROTECT
        move MOVE_SWORDS_DANCE
        ability ABILITY_POISON_HEAL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        additionalflags TRAINER_DATA_EXTRA_TYPE_STATUS
        status 0x8
        ballseal 0

    endparty

trainerdata 93, "N"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_N
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 93
        // mon 0
        ivs 255
        abilityslot 0
        level 93
        pokemon SPECIES_VICTINI
        item ITEM_WIDE_LENS
        move MOVE_V_CREATE
        move MOVE_BOLT_STRIKE
        move MOVE_U_TURN
        move MOVE_ZEN_HEADBUTT
        ability ABILITY_VICTORY_STAR
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 93
        pokemon SPECIES_ARCHEOPS
        item ITEM_BRIGHT_POWDER
        move MOVE_HEAD_SMASH
        move MOVE_DUAL_WINGBEAT
        move MOVE_EARTHQUAKE
        move MOVE_DRAGON_CLAW
        ability ABILITY_DEFEATIST
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 93
        monwithform SPECIES_ZOROARK, 1
        item ITEM_AIR_BALLOON
        move MOVE_SHADOW_BALL
        move MOVE_FOCUS_BLAST
        move MOVE_FLAMETHROWER
        move MOVE_U_TURN
        ability ABILITY_ILLUSION
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 93
        pokemon SPECIES_RESHIRAM
        item ITEM_CHOICE_SPECS
        move MOVE_BLUE_FLARE
        move MOVE_DRACO_METEOR
        move MOVE_EARTH_POWER
        move MOVE_SHADOW_BALL
        ability ABILITY_TURBOBLAZE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 93
        pokemon SPECIES_LUCARIO
        item ITEM_LUCARIONITE
        move MOVE_METEOR_MASH
        move MOVE_CLOSE_COMBAT
        move MOVE_ICE_PUNCH
        move MOVE_BULLET_PUNCH
        ability ABILITY_JUSTIFIED
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 94, "Green"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_GREEN
    nummons 5
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 94
        // mon 0
        ivs 255
        abilityslot 0
        level 94
        monwithform SPECIES_CHARIZARD, 2
        item ITEM_CHARIZARDITE_Y
        move MOVE_FIRE_BLAST
        move MOVE_SOLAR_BEAM
        move MOVE_ROOST
        move MOVE_TAILWIND
        ability ABILITY_SOLAR_POWER
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 94
        pokemon SPECIES_WALKING_WAKE
        item ITEM_WHITE_HERB
        move MOVE_DRACO_METEOR
        move MOVE_HYDRO_STEAM
        move MOVE_FLAMETHROWER
        move MOVE_FLIP_TURN
        ability ABILITY_PROTOSYNTHESIS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 94
        pokemon SPECIES_VENUSAUR
        item ITEM_LIFE_ORB
        move MOVE_SOLAR_BEAM
        move MOVE_EARTH_POWER
        move MOVE_SYNTHESIS
        move MOVE_GROWTH
        ability ABILITY_CHLOROPHYLL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 94
        pokemon SPECIES_ARCANINE
        item ITEM_SHELL_BELL
        move MOVE_FLARE_BLITZ
        move MOVE_WILD_CHARGE
        move MOVE_EXTREME_SPEED
        move MOVE_MORNING_SUN
        ability ABILITY_FLASH_FIRE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 94
        pokemon SPECIES_SCREAM_TAIL
        item ITEM_LEFTOVERS
        move MOVE_PSYCHIC_NOISE
        move MOVE_DAZZLING_GLEAM
        move MOVE_PROTECT
        move MOVE_BOOMBURST
        ability ABILITY_PROTOSYNTHESIS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

    endparty

trainerdata 95, "Benga"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_BENGA
    nummons 6
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 95
        // mon 0
        ivs 255
        abilityslot 0
        level 95
        pokemon SPECIES_GROUDON
        item ITEM_WHITE_HERB
        move MOVE_PRECIPICE_BLADES
        move MOVE_STEALTH_ROCK
        move MOVE_OVERHEAT
        move MOVE_DRAGON_PULSE
        ability ABILITY_DROUGHT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_RELAXED
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 95
        pokemon SPECIES_EMBOAR
        item ITEM_SHELL_BELL
        move MOVE_FLARE_BLITZ
        move MOVE_CLOSE_COMBAT
        move MOVE_WILD_CHARGE
        move MOVE_SUCKER_PUNCH
        ability ABILITY_RECKLESS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 95
        pokemon SPECIES_SCOVILLAIN
        item ITEM_LIFE_ORB
        move MOVE_FIRE_BLAST
        move MOVE_SOLAR_BEAM
        move MOVE_GROWTH
        move MOVE_GIGA_DRAIN
        ability ABILITY_CHLOROPHYLL
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_TIMID
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 95
        monwithform SPECIES_LANDORUS, 1
        item ITEM_ROCKY_HELMET
        move MOVE_EARTHQUAKE
        move MOVE_STONE_EDGE
        move MOVE_OUTRAGE
        move MOVE_U_TURN
        ability ABILITY_INTIMIDATE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

        // mon 4
        ivs 255
        abilityslot 0
        level 95
        pokemon SPECIES_SLITHER_WING
        item ITEM_EJECT_BUTTON
        move MOVE_CLOSE_COMBAT
        move MOVE_FIRST_IMPRESSION
        move MOVE_FLARE_BLITZ
        move MOVE_WILD_CHARGE
        ability ABILITY_PROTOSYNTHESIS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        ballseal 0

        // mon 5
        ivs 255
        abilityslot 0
        level 95
        pokemon SPECIES_GARCHOMP
        item ITEM_GARCHOMPITE
        move MOVE_DRACO_METEOR
        move MOVE_EARTHQUAKE
        move MOVE_FIRE_BLAST
        move MOVE_STONE_EDGE
        ability ABILITY_ROUGH_SKIN
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        ballseal 0

    endparty

trainerdata 1, "Oak"
    trainermontype TRAINER_DATA_TYPE_IV_EV_SET | TRAINER_DATA_TYPE_MOVES | TRAINER_DATA_TYPE_ADDITIONAL_FLAGS | TRAINER_DATA_TYPE_ABILITY | TRAINER_DATA_TYPE_NATURE_SET | TRAINER_DATA_TYPE_ITEMS | 0
    trainerclass TRAINERCLASS_OAK
    nummons 4
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    item ITEM_NONE
    aiflags F_PRIORITIZE_SUPER_EFFECTIVE | F_EVALUATE_ATTACKS | F_EXPERT_ATTACKS | 0
    battletype SINGLE_BATTLE
    endentry

    party 1
        // mon 0
        ivs 255
        abilityslot 0
        level 1
        pokemon SPECIES_RATTATA
        item ITEM_SILK_SCARF
        move MOVE_QUICK_ATTACK
        move MOVE_NONE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_GUTS
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_JOLLY
        additionalflags TRAINER_DATA_EXTRA_TYPE_STATUS
        status 0x10
        ballseal 0

        // mon 1
        ivs 255
        abilityslot 0
        level 1
        pokemon SPECIES_BULBASAUR
        item ITEM_MIRACLE_SEED
        move MOVE_LEAFAGE
        move MOVE_NONE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_OVERGROW
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_ADAMANT
        additionalflags 0
        ballseal 0

        // mon 2
        ivs 255
        abilityslot 0
        level 1
        pokemon SPECIES_CHARMANDER
        item ITEM_CHARCOAL
        move MOVE_EMBER
        move MOVE_NONE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_BLAZE
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        additionalflags 0
        ballseal 0

        // mon 3
        ivs 255
        abilityslot 0
        level 1
        pokemon SPECIES_SQUIRTLE
        item ITEM_MYSTIC_WATER
        move MOVE_BUBBLE
        move MOVE_NONE
        move MOVE_NONE
        move MOVE_NONE
        ability ABILITY_TORRENT
        setivs 31, 31, 31, 31, 31, 31
        setevs 0, 0, 0, 0, 0, 0
        nature NATURE_MODEST
        additionalflags 0
        ballseal 0

    endparty
