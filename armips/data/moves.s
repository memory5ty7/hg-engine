.nds
.thumb

.include "armips/include/macros.s"
.include "armips/include/constants.s"
.include "armips/include/config.s"
.include "armips/include/movemacros.s"

.include "asm/include/debug.inc"
.include "asm/include/moves.inc"
.include "asm/include/move_effects.inc"

movedata MOVE_NONE, "-"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 0
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags 0x00
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_NONE, "\n\n\n\n"

movedata MOVE_POUND, "Écras'Face"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_NORMAL
    accuracy 100
    pp 35
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_POUND, "Ecrase l’ennemi\navec les pattes\navant, la queue, etc."

movedata MOVE_KARATE_CHOP, "Poing Karaté"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_FIGHTING
    accuracy 100
    pp 25
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_KARATE_CHOP, "L’ennemi est tranché\nviolemment. Taux de\ncritiques élevé."

movedata MOVE_DOUBLE_SLAP, "Torgnoles"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 15
    type TYPE_NORMAL
    accuracy 85
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_DOUBLE_SLAP, "Gifle rapidement\nl’ennemi de 2 à 5 fois\nd’affilée."

movedata MOVE_COMET_PUNCH, "Poing Comète"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 18
    type TYPE_NORMAL
    accuracy 85
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_COMET_PUNCH, "Une tornade de coups\nde poing qui frappe de\n2 à 5 fois d’affilée."

movedata MOVE_MEGA_PUNCH, "Ultimapoing"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_NORMAL
    accuracy 85
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_MEGA_PUNCH, "L’ennemi reçoit un\ncoup de poing d’une\npuissance incroyable."

movedata MOVE_PAY_DAY, "Jackpot"
    battleeffect MOVE_EFFECT_INCREASE_PRIZE_MONEY
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_PAY_DAY, "Des pièces sont\nlancées sur l’ennemi.\nPermet d’obtenir de\nl’argent à la fin du\ncombat."

movedata MOVE_FIRE_PUNCH, "Poing Feu"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_FIRE
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FIRE_PUNCH, "Un coup de poing\nenflammé vient\nfrapper l’ennemi. Peut\nle brûler."

movedata MOVE_ICE_PUNCH, "Poing Glace"
    battleeffect MOVE_EFFECT_FREEZE_HIT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_ICE
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ICE_PUNCH, "Un coup de poing glacé\nvient frapper\nl’ennemi. Peut le\ngeler."

movedata MOVE_THUNDER_PUNCH, "Poing Éclair"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_ELECTRIC
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_THUNDER_PUNCH, "Un coup de poing\nélectrique vient\nfrapper l’ennemi. Peut\nle paralyser."

movedata MOVE_SCRATCH, "Griffe"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_NORMAL
    accuracy 100
    pp 35
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SCRATCH, "Lacère l’ennemi avec\ndes griffes acérées\npour lui infliger des\ndégâts."

movedata MOVE_VICE_GRIP, "Force Poigne"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 55
    type TYPE_NORMAL
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_VICE_GRIP, "De gigantesques\nbarres se saisissent\nde l’ennemi pour\nl’écraser."

movedata MOVE_GUILLOTINE, "Guillotine"
    battleeffect MOVE_EFFECT_ONE_HIT_KO
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 30
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_ALL_SAME_JUDGE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GUILLOTINE, "De méchantes pinces\nlacèrent l’ennemi, le\nmettant K.O. sur le\ncoup s’il est touché."

movedata MOVE_RAZOR_WIND, "Coupe-Vent"
    battleeffect MOVE_EFFECT_CHARGE_TURN_HIGH_CRIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_UNIQUE_JUDGE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RAZOR_WIND, "Attaque en 2 tours.\nDes lames de vent\nfrappent l’ennemi au\n2⁴ tour. Taux de\ncritiques élevé."

movedata MOVE_SWORDS_DANCE, "Danse Lames"
    battleeffect MOVE_EFFECT_ATK_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SWORDS_DANCE, "Danse frénétique qui\nexalte l’esprit\ncombatif. Augmente\nconsidérablement\nl’Attaque du lanceur."

movedata MOVE_CUT, "Coupe"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_NORMAL
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CUT, "Coupe l’ennemi avec\ndes lames ou des\ngriffes. Hors combat,\npermet de couper des\narbres fins."

movedata MOVE_GUST, "Tornade"
    battleeffect MOVE_EFFECT_DOUBLE_DAMAGE_FLY_OR_BOUNCE
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_FLYING
    accuracy 100
    pp 35
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_GUST, "Le lanceur bat des\nailes pour générer\nune bourrasque qui\nblesse l’ennemi."

movedata MOVE_WING_ATTACK, "Cru-Ailes"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FLYING
    accuracy 100
    pp 35
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_WING_ATTACK, "L’ennemi est frappé\npar de larges ailes\ndéployées pour\ninfliger des dégâts."

movedata MOVE_WHIRLWIND, "Cyclone"
    battleeffect MOVE_EFFECT_FORCE_SWITCH
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority -6
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal APPEAL_ALL_SAME_JUDGE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_WHIRLWIND, "Ejecte le Pokémon\nennemi et le remplace\npar un autre. Dans la\nnature, met fin au\ncombat."

movedata MOVE_FLY, "Vol"
    battleeffect MOVE_EFFECT_FLY
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_FLYING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_UNIQUE_JUDGE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FLY, "Le lanceur s’envole\nau 1¹ tour et frappe\nau 2⁴. Permet aussi\nd’être porté dans une\nville connue."

movedata MOVE_BIND, "Étreinte"
    battleeffect MOVE_EFFECT_BIND_HIT
    pss SPLIT_PHYSICAL
    basepower 15
    type TYPE_NORMAL
    accuracy 85
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BIND, "Ligote l’ennemi avec\nles tentacules ou le\ncorps pour l’écraser\ndurant 2 à 5 tours."

movedata MOVE_SLAM, "Souplesse"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_NORMAL
    accuracy 75
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SLAM, "Fouette l’ennemi\navec la queue, une\nliane, etc. pour\ninfliger des dégâts."

movedata MOVE_VINE_WHIP, "Fouet Lianes"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 45
    type TYPE_GRASS
    accuracy 100
    pp 25
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_VINE_WHIP, "Fouette l’ennemi avec\nde fines lianes pour\ninfliger des dégâts."

movedata MOVE_STOMP, "Écrasement"
    battleeffect MOVE_EFFECT_FLINCH_MINIMIZE_DOUBLE_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_STOMP, "Ecrase l’ennemi avec\nun énorme pied. Peut\naussi l’apeurer."

movedata MOVE_DOUBLE_KICK, "Double Pied"
    battleeffect MOVE_EFFECT_HIT_TWICE
    pss SPLIT_PHYSICAL
    basepower 30
    type TYPE_FIGHTING
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DOUBLE_KICK, "Deux coups de pied\nqui frappent l’ennemi\ndeux fois d’affilée."

movedata MOVE_MEGA_KICK, "Ultimawashi"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_NORMAL
    accuracy 75
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MEGA_KICK, "Un coup de pied\nsuperpuissant et\nintense qui frappe\nl’ennemi."

movedata MOVE_JUMP_KICK, "Pied Sauté"
    battleeffect MOVE_EFFECT_CRASH_ON_MISS
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_FIGHTING
    accuracy 95
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_JUMP_KICK, "Le lanceur s’envole\npour décocher un\ncoup de pied sauté.\nS’il échoue, le\nlanceur se blesse."

movedata MOVE_ROLLING_KICK, "Mawashi Geri"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FIGHTING
    accuracy 85
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ROLLING_KICK, "Le lanceur effectue\nun coup de pied\ntournoyant et\nextrêmement rapide."

movedata MOVE_SAND_ATTACK, "Jet de Sable"
    battleeffect MOVE_EFFECT_ACC_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GROUND
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SAND_ATTACK, "Lance du sable au\nvisage de l’ennemi\npour baisser sa\nprécision."

movedata MOVE_HEADBUTT, "Coup d'Boule"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_HEADBUTT, "Le lanceur donne un\ncoup de tête. Peut\napeurer l’ennemi.\nPeut faire tomber des\nPokémon des arbres."

movedata MOVE_HORN_ATTACK, "Koud'Korne"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_NORMAL
    accuracy 100
    pp 25
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HORN_ATTACK, "Frappe l’ennemi d’un\ncoup de corne pointue\npour infliger des\ndégâts."

movedata MOVE_FURY_ATTACK, "Furie"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 15
    type TYPE_NORMAL
    accuracy 85
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FURY_ATTACK, "Frappe l’ennemi 2 à 5\nfois d’affilée avec un\nbec ou une corne."

movedata MOVE_HORN_DRILL, "Empal'Korne"
    battleeffect MOVE_EFFECT_ONE_HIT_KO
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 30
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_ALL_SAME_JUDGE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HORN_DRILL, "Un coup de corne en\nvrille qui empale\nl’ennemi, le mettant\nK.O. sur le coup s’il\nest touché."

movedata MOVE_TACKLE, "Charge"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_NORMAL
    accuracy 100
    pp 35
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_TACKLE, "Le lanceur charge\nl’ennemi et le percute\nde tout son corps."

movedata MOVE_BODY_SLAM, "Plaquage"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BODY_SLAM, "Le lanceur se laisse\ntomber sur l’ennemi\nde tout son poids.\nPeut le paralyser."

movedata MOVE_WRAP, "Ligotage"
    battleeffect MOVE_EFFECT_BIND_HIT
    pss SPLIT_PHYSICAL
    basepower 15
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_WRAP, "Le lanceur ligote\nl’ennemi avec des\nlianes ou son corps\npour l’écraser durant\n2 à 5 tours."

movedata MOVE_TAKE_DOWN, "Bélier"
    battleeffect MOVE_EFFECT_RECOIL_QUARTER
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_NORMAL
    accuracy 85
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_TAKE_DOWN, "Une charge violente\nqui blesse aussi\nlégèrement le\nlanceur."

movedata MOVE_THRASH, "Mania"
    battleeffect MOVE_EFFECT_CONTINUE_AND_CONFUSE_SELF
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_RANDOM_OPPONENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_THRASH, "Une attaque furieuse\nqui dure de 2 à 3\ntours. Le lanceur\ndevient confus."

movedata MOVE_DOUBLE_EDGE, "Damoclès"
    battleeffect MOVE_EFFECT_RECOIL_THIRD
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_ALL_SAME_JUDGE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_DOUBLE_EDGE, "Une dangereuse\ncharge. Inflige aussi\ndes dégâts assez\nimportants au\nlanceur."

movedata MOVE_TAIL_WHIP, "Mimi-Queue"
    battleeffect MOVE_EFFECT_DEF_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_TAIL_WHIP, "Le lanceur remue son\nadorable queue pour\ntromper la vigilance\nde l’ennemi et baisser\nsa Défense."

movedata MOVE_POISON_STING, "Dard-Venin"
    battleeffect MOVE_EFFECT_POISON_HIT
    pss SPLIT_PHYSICAL
    basepower 15
    type TYPE_POISON
    accuracy 100
    pp 35
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_POISON_STING, "Un dard toxique qui\ntransperce l’ennemi.\nPeut aussi\nl’empoisonner."

movedata MOVE_TWINEEDLE, "Double Dard"
    battleeffect MOVE_EFFECT_POISON_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 25
    type TYPE_BUG
    accuracy 100
    pp 20
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TWINEEDLE, "Un double coup de\ndards qui transperce\nl’ennemi. Peut aussi\nl’empoisonner."

movedata MOVE_PIN_MISSILE, "Dard-Nuée"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 25
    type TYPE_BUG
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PIN_MISSILE, "Envoie une rafale de\ndards. Peut toucher\nde 2 à 5 fois."

movedata MOVE_LEER, "Groz'Yeux"
    battleeffect MOVE_EFFECT_DEF_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LEER, "Le lanceur fait les\ngros yeux à l’ennemi\npour l’intimider et\nbaisser sa Défense."

movedata MOVE_BITE, "Morsure"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_DARK
    accuracy 100
    pp 25
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BITE, "L’ennemi est mordu\npar de tranchantes\ncanines. Peut\nl’apeurer."

movedata MOVE_GROWL, "Rugissement"
    battleeffect MOVE_EFFECT_ATK_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 40
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_GROWL, "Le lanceur pousse un\ncri tout mimi pour\ntromper la vigilance\nde l’ennemi et baisser\nson Attaque."

movedata MOVE_ROAR, "Hurlement"
    battleeffect MOVE_EFFECT_FORCE_SWITCH
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy DEBUG_NEEDS_TESTING ? 0 : 100 // come back to check accuracyless later
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority -6
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ROAR, "Effraie le Pokémon\nennemi et le remplace\npar un autre. Dans la\nnature, met fin au\ncombat."

movedata MOVE_SING, "Berceuse"
    battleeffect MOVE_EFFECT_STATUS_SLEEP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 55
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SING, "Une berceuse plonge\nl’ennemi dans un\nprofond sommeil."

movedata MOVE_SUPERSONIC, "Ultrason"
    battleeffect MOVE_EFFECT_STATUS_CONFUSE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 55
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SUPERSONIC, "Le lanceur produit\nd’étranges ondes\nsonores qui\nrendent confus."

movedata MOVE_SONIC_BOOM, "Sonic Boom"
    battleeffect MOVE_EFFECT_10_DAMAGE_FLAT
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SONIC_BOOM, "Une onde de choc\ndestructrice qui\ninflige toujours 20 PV\nde dégâts."

movedata MOVE_DISABLE, "Entrave"
    battleeffect MOVE_EFFECT_DISABLE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_DISABLE, "Empêche l’ennemi\nd’employer à nouveau\nsa dernière attaque.\nDure plusieurs tours."

movedata MOVE_ACID, "Acide"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_POISON
    accuracy 100
    pp 30
    effectchance 10
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_ACID, "Le lanceur attaque\nl’ennemi avec un jet\nd’acide corrosif. Peut\naussi baisser la Déf.\nSpé. de l’ennemi."

movedata MOVE_EMBER, "Flammèche"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_FIRE
    accuracy 100
    pp 25
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_EMBER, "L’ennemi est attaqué\npar de faibles\nflammes. Peut aussi le\nbrûler."

movedata MOVE_FLAMETHROWER, "Lance-Flammes"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_FIRE
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FLAMETHROWER, "L’ennemi reçoit un\ntorrent de flammes.\nPeut aussi le brûler."

movedata MOVE_MIST, "Brume"
    battleeffect MOVE_EFFECT_PREVENT_STAT_REDUCTION
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ICE
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MIST, "Une brume blanche\nenveloppe l’équipe du\nlanceur et empêche la\nréduction des stats\npour 5 tours."

movedata MOVE_WATER_GUN, "Pistolet à O"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_WATER
    accuracy 100
    pp 25
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_WATER_GUN, "De l’eau est projetée\nsur l’ennemi en arc de\ncercle."

movedata MOVE_HYDRO_PUMP, "Hydrocanon"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 110
    type TYPE_WATER
    accuracy 80
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_HYDRO_PUMP, "Un puissant jet d’eau\nest dirigé sur\nl’ennemi."

movedata MOVE_SURF, "Surf"
    battleeffect MOVE_EFFECT_DOUBLE_DAMAGE_DIVE
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_WATER
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SURF, "Une énorme vague\ns’abat sur le champ\nde bataille. Permet\naussi de voyager sur\nl’eau."

movedata MOVE_ICE_BEAM, "Laser Glace"
    battleeffect MOVE_EFFECT_FREEZE_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_ICE
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ICE_BEAM, "Un rayon de glace\nfrappe l’ennemi. Peut\naussi le geler."

movedata MOVE_BLIZZARD, "Blizzard"
    battleeffect MOVE_EFFECT_BLIZZARD
    pss SPLIT_SPECIAL
    basepower 110
    type TYPE_ICE
    accuracy 70
    pp 5
    effectchance 10
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_BLIZZARD, "Une violente tempête\nde neige est\ndéclenchée sur\nl’ennemi. Peut aussi\nle geler."

movedata MOVE_PSYBEAM, "Rafale Psy"
    battleeffect MOVE_EFFECT_CONFUSE_HIT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_PSYCHIC
    accuracy 100
    pp 20
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_PSYBEAM, "Un étrange rayon\nfrappe l’ennemi. Peut\naussi le rendre\nconfus."

movedata MOVE_BUBBLE_BEAM, "Bulles d'O"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_WATER
    accuracy 100
    pp 20
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_NEXT_TURN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_BUBBLE_BEAM, "Des bulles sont\nenvoyées avec\npuissance sur\nl’ennemi. Peut aussi\nbaisser sa Vitesse."

movedata MOVE_AURORA_BEAM, "Onde Boréale"
    battleeffect MOVE_EFFECT_LOWER_ATTACK_HIT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_ICE
    accuracy 100
    pp 20
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_AURORA_BEAM, "Envoie un rayon\narc-en-ciel sur\nl’ennemi. Peut aussi\nbaisser son Attaque."

movedata MOVE_HYPER_BEAM, "Ultralaser"
    battleeffect MOVE_EFFECT_RECHARGE_AFTER
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HYPER_BEAM, "Projette un puissant\nrayon sur l’ennemi. Le\nlanceur doit se\nreposer au tour\nsuivant."

movedata MOVE_PECK, "Picpic"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 35
    type TYPE_FLYING
    accuracy 100
    pp 35
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PECK, "Frappe l’ennemi d’un\nbec pointu ou d’une\ncorne pour infliger\ndes dégâts."

movedata MOVE_DRILL_PECK, "Bec Vrille"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_FLYING
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRILL_PECK, "Une attaque utilisant\nle bec comme une\nperceuse."

movedata MOVE_SUBMISSION, "Sacrifice"
    battleeffect MOVE_EFFECT_RECOIL_QUARTER
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_FIGHTING
    accuracy 80
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SUBMISSION, "Le lanceur agrippe\nl’ennemi et l’écrase\nau sol. Blesse aussi\nlégèrement le\nlanceur."

movedata MOVE_LOW_KICK, "Balayage"
    battleeffect MOVE_EFFECT_INCREASE_POWER_WITH_WEIGHT
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_FIGHTING
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_LOW_KICK, "Un puissant coup de\npied bas qui fauche\nl’ennemi. Il est plus\nefficace contre les\nennemis lourds."

movedata MOVE_COUNTER, "Riposte"
    battleeffect MOVE_EFFECT_COUNTER
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_FIGHTING
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority -5
    flags FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_COUNTER, "Une riposte qui\ncontre toute attaque\nphysique en infligeant\nle double de dégâts."

movedata MOVE_SEISMIC_TOSS, "Frappe Atlas"
    battleeffect MOVE_EFFECT_LEVEL_DAMAGE_FLAT
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_FIGHTING
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SEISMIC_TOSS, "L’ennemi est projeté\ngrâce au pouvoir de\nla gravité. Inflige des\ndégâts équivalents au\nniveau du lanceur."

movedata MOVE_STRENGTH, "Force"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_STRENGTH, "Le lanceur cogne\nl’ennemi de toute sa\nforce. Permet aussi\nde déplacer des\nrochers."

movedata MOVE_ABSORB, "Vole-Vie"
    battleeffect MOVE_EFFECT_RECOVER_HALF_DAMAGE_DEALT
    pss SPLIT_SPECIAL
    basepower 20
    type TYPE_GRASS
    accuracy 100
    pp 25
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_ABSORB, "Une attaque\nqui convertit la\nmoitié des dégâts\ninfligés en PV."

movedata MOVE_MEGA_DRAIN, "Méga-Sangsue"
    battleeffect MOVE_EFFECT_RECOVER_HALF_DAMAGE_DEALT
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_GRASS
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_MEGA_DRAIN, "Une attaque\nqui convertit la\nmoitié des dégâts\ninfligés en PV."

movedata MOVE_LEECH_SEED, "Vampigraine"
    battleeffect MOVE_EFFECT_STATUS_LEECH_SEED
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 90
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_LEECH_SEED, "Une graine est semée\nsur l’ennemi. A chaque\ntour, elle lui dérobe\ndes PV que le lanceur\nrécupère."

movedata MOVE_GROWTH, "Croissance"
    battleeffect MOVE_EFFECT_SP_ATK_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_GROWTH, "Le corps du lanceur\nse développe.\nAugmente l’Atq. Spé."

movedata MOVE_RAZOR_LEAF, "Tranch'Herbe"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 55
    type TYPE_GRASS
    accuracy 100
    pp 25
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RAZOR_LEAF, "Des feuilles aiguisées\ncomme des rasoirs\nentaillent l’ennemi.\nTaux de critiques\nélevé."

movedata MOVE_SOLAR_BEAM, "Lance-Soleil"
    battleeffect MOVE_EFFECT_CHARGE_TURN_SUN_SKIPS
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_UNIQUE_JUDGE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SOLAR_BEAM, "Absorbe la lumière\nau premier tour et\nenvoie un rayon\npuissant au tour\nsuivant."

movedata MOVE_POISON_POWDER, "Poudre Toxik"
    battleeffect MOVE_EFFECT_STATUS_POISON
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 75
    pp 35
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_POISON_POWDER, "Une poudre toxique\nest lâchée sur\nl’ennemi. Peut\nl’empoisonner."

movedata MOVE_STUN_SPORE, "Para-Spore"
    battleeffect MOVE_EFFECT_STATUS_PARALYZE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 75
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_STUN_SPORE, "Le lanceur répand\nsur l’ennemi une\npoudre qui peut le\nparalyser."

movedata MOVE_SLEEP_POWDER, "Poudre Dodo"
    battleeffect MOVE_EFFECT_STATUS_SLEEP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 75
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SLEEP_POWDER, "Le lanceur répand une\npoudre soporifique\nsur l’ennemi. Peut\nl’endormir."

movedata MOVE_PETAL_DANCE, "Danse Fleurs"
    battleeffect MOVE_EFFECT_CONTINUE_AND_CONFUSE_SELF
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_RANDOM_OPPONENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_PETAL_DANCE, "Le lanceur attaque en\nprojetant des pétales\npendant 2 à 3 tours\navant de céder à\nla confusion."

movedata MOVE_STRING_SHOT, "Sécrétion"
    battleeffect MOVE_EFFECT_SPEED_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_BUG
    accuracy 100
    pp 40
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_STRING_SHOT, "Le lanceur crache de\nla soie pour ligoter\nl’ennemi. Peut baisser\nla Vitesse de l’ennemi."

movedata MOVE_DRAGON_RAGE, "Draco-Rage"
    battleeffect MOVE_EFFECT_40_DAMAGE_FLAT
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_DRAGON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRAGON_RAGE, "Une onde de choc\ndestructrice qui\ninflige toujours 40 PV\nde dégâts."

movedata MOVE_FIRE_SPIN, "Danse Flammes"
    battleeffect MOVE_EFFECT_BIND_HIT
    pss SPLIT_SPECIAL
    basepower 35
    type TYPE_FIRE
    accuracy 85
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FIRE_SPIN, "Un tourbillon de\nflammes emprisonne\nl’ennemi pendant 2 à 5\ntours."

movedata MOVE_THUNDER_SHOCK, "Éclair"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_ELECTRIC
    accuracy 100
    pp 30
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_THUNDER_SHOCK, "Une décharge\nélectrique tombe sur\nl’ennemi. Peut aussi le\nparalyser."

movedata MOVE_THUNDERBOLT, "Tonnerre"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_ELECTRIC
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_THUNDERBOLT, "Une grosse décharge\nélectrique tombe sur\nl’ennemi. Peut aussi le\nparalyser."

movedata MOVE_THUNDER_WAVE, "Cage Éclair"
    battleeffect MOVE_EFFECT_STATUS_PARALYZE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ELECTRIC
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_THUNDER_WAVE, "Un faible choc\nélectrique frappe\nl’ennemi. Si l’attaque\ntouche, l’ennemi est\nparalysé."

movedata MOVE_THUNDER, "Fatal-Foudre"
    battleeffect MOVE_EFFECT_THUNDER // accuracy in rain & sun handled in other_battle_calculators.c
    pss SPLIT_SPECIAL
    basepower 110
    type TYPE_ELECTRIC
    accuracy 70
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_THUNDER, "La foudre tombe sur\nl’ennemi pour lui\ninfliger des dégâts.\nPeut aussi le\nparalyser."

movedata MOVE_ROCK_THROW, "Jet-Pierres"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_ROCK
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ROCK_THROW, "Le lanceur lâche une\npierre sur l’ennemi."

movedata MOVE_EARTHQUAKE, "Séisme"
    battleeffect MOVE_EFFECT_DOUBLE_DAMAGE_DIG
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_EARTHQUAKE, "Le lanceur provoque\nun tremblement de\nterre touchant tous\nles autres Pokémon\nau combat."

movedata MOVE_FISSURE, "Abîme"
    battleeffect MOVE_EFFECT_ONE_HIT_KO
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_GROUND
    accuracy 30
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_ALL_SAME_JUDGE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_FISSURE, "Le lanceur fait tomber\nl’ennemi dans une\ncrevasse. Si cette\nattaque réussit, elle\nmet K.O. sur le coup."

movedata MOVE_DIG, "Tunnel"
    battleeffect MOVE_EFFECT_DIG
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_UNIQUE_JUDGE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_DIG, "Le lanceur creuse au\n1¹ tour et frappe au\n2⁴. Permet aussi de\ns’échapper d’un\ndonjon."

movedata MOVE_TOXIC, "Toxik"
    battleeffect MOVE_EFFECT_STATUS_BADLY_POISON
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_TOXIC, "Empoisonne gravement\nl’ennemi. Les dégâts\ndus au poison\naugmentent à chaque\ntour."

movedata MOVE_CONFUSION, "Choc Mental"
    battleeffect MOVE_EFFECT_CONFUSE_HIT
    pss SPLIT_SPECIAL
    basepower 50
    type TYPE_PSYCHIC
    accuracy 100
    pp 25
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_CONFUSION, "Une faible vague\ntélékinésique frappe\nl’ennemi. Peut aussi\nle plonger dans la\nconfusion."

movedata MOVE_PSYCHIC, "Psyko"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_PSYCHIC, "Une puissante force\ntélékinésique frappe\nl’ennemi. Peut aussi\nfaire baisser sa Déf.\nSpé."

movedata MOVE_HYPNOSIS, "Hypnose"
    battleeffect MOVE_EFFECT_STATUS_SLEEP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 60
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_HYPNOSIS, "Le lanceur hypnotise\nl’ennemi pour le\nplonger dans un\nprofond sommeil."

movedata MOVE_MEDITATE, "Yoga"
    battleeffect MOVE_EFFECT_ATK_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MEDITATE, "Le lanceur médite\npour éveiller son\npouvoir latent et\naugmenter son\nAttaque."

movedata MOVE_AGILITY, "Hâte"
    battleeffect MOVE_EFFECT_SPEED_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_SNATCH
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_AGILITY, "Le lanceur se relaxe\net allège son corps\npour augmenter\nconsidérablement sa\nVitesse."

movedata MOVE_QUICK_ATTACK, "Vive-attaque"
    battleeffect MOVE_EFFECT_PRIORITY_1
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_NORMAL
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_QUICK_ATTACK, "Le lanceur fonce sur\nl’ennemi si rapidement\nqu’on parvient à peine\nà le discerner. Frappe\nen premier."

movedata MOVE_RAGE, "Frénésie"
    battleeffect MOVE_EFFECT_RAISE_ATK_WHEN_HIT
    pss SPLIT_PHYSICAL
    basepower 20
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RAGE, "Une fois activée,\ncette capacité gagne\nen efficacité à mesure\nque le lanceur subit\ndes dégâts."

movedata MOVE_TELEPORT, "Téléport"
    battleeffect MOVE_EFFECT_FLEE_FROM_WILD_BATTLE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority -6
    flags 0
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TELEPORT, "Permet de fuir un\nPokémon sauvage.\nPermet aussi de\nrevenir au dernier\nCentre Pokémon."

movedata MOVE_NIGHT_SHADE, "Ombre Nocturne"
    battleeffect MOVE_EFFECT_LEVEL_DAMAGE_FLAT
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_GHOST
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_NIGHT_SHADE, "Le lanceur invoque\nun mirage. Inflige des\ndégâts équivalents\nau niveau du lanceur."

movedata MOVE_MIMIC, "Copie"
    battleeffect MOVE_EFFECT_COPY_MOVE_FOR_BATTLE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_MIMIC, "Le lanceur imite la\ndernière capacité\nutilisée par l’ennemi,\npeut l’utiliser pour\nle reste du combat."

movedata MOVE_SCREECH, "Grincement"
    battleeffect MOVE_EFFECT_DEF_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 85
    pp 40
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SCREECH, "Cri strident qui baisse\nbeaucoup la Défense\nennemie."

movedata MOVE_DOUBLE_TEAM, "Reflet"
    battleeffect MOVE_EFFECT_EVA_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DOUBLE_TEAM, "Le lanceur se déplace\nsi vite qu’il crée des\ncopies illusoires de\nlui, augmentant\nson esquive."

movedata MOVE_RECOVER, "Soin"
    battleeffect MOVE_EFFECT_RESTORE_HALF_HP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_RECOVER, "Un soin qui permet au\nlanceur de récupérer\njusqu’à la moitié de\nses PV max."

movedata MOVE_HARDEN, "Armure"
    battleeffect MOVE_EFFECT_DEF_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_HARDEN, "Le lanceur contracte\ntous ses muscles pour\naugmenter sa\nDéfense."

movedata MOVE_MINIMIZE, "Lilliput"
    battleeffect MOVE_EFFECT_EVA_UP_2_MINIMIZE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_MINIMIZE, "Le lanceur comprime\nson corps pour se\nfaire tout petit et\naugmenter son\nesquive."

movedata MOVE_SMOKESCREEN, "Brouillard"
    battleeffect MOVE_EFFECT_ACC_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SMOKESCREEN, "Le lanceur disperse\nun nuage d’encre ou\nde fumée. Réduit la\nprécision de l’ennemi."

movedata MOVE_CONFUSE_RAY, "Onde Folie"
    battleeffect MOVE_EFFECT_STATUS_CONFUSE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GHOST
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_CONFUSE_RAY, "Un rayon sinistre\nqui plonge l’ennemi\ndans un état de\nconfusion."

movedata MOVE_WITHDRAW, "Repli"
    battleeffect MOVE_EFFECT_DEF_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_WATER
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_WITHDRAW, "Le lanceur se\nrecroqueville dans sa\ncarapace, ce qui\naugmente sa Défense."

movedata MOVE_DEFENSE_CURL, "Boul'Armure"
    battleeffect MOVE_EFFECT_DEF_UP_DOUBLE_ROLLOUT_POWER
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_DEFENSE_CURL, "Le lanceur s’enroule\npour cacher ses\npoints faibles, ce qui\naugmente sa Défense."

movedata MOVE_BARRIER, "Bouclier"
    battleeffect MOVE_EFFECT_DEF_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BARRIER, "Le lanceur érige un\nmur solide qui\naugmente fortement\nsa Défense."

movedata MOVE_LIGHT_SCREEN, "Mur Lumière"
    battleeffect MOVE_EFFECT_SET_LIGHT_SCREEN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_LIGHT_SCREEN, "Un fabuleux mur de\nlumière qui réduit les\ndégâts causés par les\nattaques spéciales\ndurant 5 tours."

movedata MOVE_HAZE, "Buée Noire"
    battleeffect MOVE_EFFECT_RESET_STAT_CHANGES
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ICE
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags 0
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_HAZE, "Un brouillard qui\nannule les \nchangements\nde stats de tous les\nPokémon au combat."

movedata MOVE_REFLECT, "Protection"
    battleeffect MOVE_EFFECT_SET_REFLECT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_REFLECT, "Un fabuleux mur de\nlumière qui réduit les\ndégâts causés par les\nattaques physiques\ndurant 5 tours."

movedata MOVE_FOCUS_ENERGY, "Puissance"
    battleeffect MOVE_EFFECT_CRIT_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FOCUS_ENERGY, "Le lanceur prend une\nprofonde respiration\net se concentre pour\naugmenter son taux\nde critiques."

movedata MOVE_BIDE, "Patience"
    battleeffect MOVE_EFFECT_BIDE
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 1
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BIDE, "Le lanceur encaisse\nles coups durant 2\ntours et réplique en\ninfligeant le double\ndes dégâts subis."

movedata MOVE_METRONOME, "Métronome"
    battleeffect MOVE_EFFECT_CALL_RANDOM_MOVE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority 0
    flags FLAG_KEEP_HP_BAR
    appeal APPEAL_RANDOMIZE_NEXT_TURN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_METRONOME, "Agite un doigt et\nstimule le cerveau\npour utiliser presque\nn’importe quelle\ncapacité au hasard."

movedata MOVE_MIRROR_MOVE, "Mimique"
    battleeffect MOVE_EFFECT_COPY_MOVE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FLYING
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority 0
    flags FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_MIRROR_MOVE, "Le lanceur contre\nl’attaque de l’ennemi\navec la même\nattaque."

movedata MOVE_SELF_DESTRUCT, "Destruction"
    battleeffect MOVE_EFFECT_HALVE_DEFENSE
    pss SPLIT_PHYSICAL
    basepower 200
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_ALL_SAME_JUDGE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SELF_DESTRUCT, "Le lanceur explose\nen blessant tous les\nautres Pokémon au\ncombat. Le lanceur\ntombe K.O."

movedata MOVE_EGG_BOMB, "Bombe Œuf"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_NORMAL
    accuracy 75
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_EGG_BOMB, "De toutes ses forces,\nle lanceur jette un\ngros œuf sur l’ennemi\npour lui infliger des\ndégâts."

movedata MOVE_LICK, "Léchouille"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_PHYSICAL
    basepower 30
    type TYPE_GHOST
    accuracy 100
    pp 30
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_LICK, "Un grand coup de\nlangue qui inflige des\ndégâts à l’ennemi.\nPeut aussi le\nparalyser."

movedata MOVE_SMOG, "Purédpois"
    battleeffect MOVE_EFFECT_POISON_HIT
    pss SPLIT_SPECIAL
    basepower 30
    type TYPE_POISON
    accuracy 70
    pp 20
    effectchance 40
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SMOG, "Le lanceur attaque à\nl’aide d’une éruption\nde gaz répugnants.\nPeut aussi\nempoisonner l’ennemi."

movedata MOVE_SLUDGE, "Détritus"
    battleeffect MOVE_EFFECT_POISON_HIT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_POISON
    accuracy 100
    pp 20
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SLUDGE, "Des détritus toxiques\nsont projetés sur\nl’ennemi. Peut aussi\nl’empoisonner."

movedata MOVE_BONE_CLUB, "Massd'Os"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_GROUND
    accuracy 85
    pp 20
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BONE_CLUB, "Le lanceur frappe\nl’ennemi à grands\ncoups d’os. Peut\naussi apeurer\nl’ennemi."

movedata MOVE_FIRE_BLAST, "Déflagration"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 110
    type TYPE_FIRE
    accuracy 85
    pp 5
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FIRE_BLAST, "Un déluge de flammes\nardentes submerge\nl’ennemi. Peut aussi le\nbrûler."

movedata MOVE_WATERFALL, "Cascade"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_WATER
    accuracy 100
    pp 15
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_WATERFALL, "Le lanceur charge\nl’ennemi à une vitesse\nremarquable. Permet\naussi de franchir une\ncascade."

movedata MOVE_CLAMP, "Claquoir"
    battleeffect MOVE_EFFECT_BIND_HIT
    pss SPLIT_PHYSICAL
    basepower 35
    type TYPE_WATER
    accuracy 85
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_CLAMP, "Le lanceur piège\nl’ennemi dans sa dure\ncoquille et l’écrase\npendant 2 à 5 tours."

movedata MOVE_SWIFT, "Météores"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SWIFT, "Le lanceur envoie des\nrayons d’étoiles.\nTouche toujours\nl’ennemi."

movedata MOVE_SKULL_BASH, "Coud'Krâne"
    battleeffect MOVE_EFFECT_CHARGE_TURN_DEF_UP
    pss SPLIT_PHYSICAL
    basepower 130
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_UNIQUE_JUDGE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SKULL_BASH, "Le lanceur baisse la\ntête pour augmenter\nsa Défense au 1¹\ntour et percuter\nl’ennemi au 2⁴."

movedata MOVE_SPIKE_CANNON, "Picanon"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 20
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPIKE_CANNON, "Une rafale de pointes\naiguisées s’abat sur\nl’ennemi. Inflige de 2\nà 5 coups."

movedata MOVE_CONSTRICT, "Constriction"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_NORMAL
    accuracy 100
    pp 35
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_CONSTRICT, "De longs tentacules\nou lianes attaquent\nl’ennemi. Peut aussi\nbaisser sa Vitesse."

movedata MOVE_AMNESIA, "Amnésie"
    battleeffect MOVE_EFFECT_SP_DEF_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_AMNESIA, "Le lanceur fait le vide\ndans son esprit pour\noublier ses soucis.\nAugmente fortement\nsa Déf. Spé."

movedata MOVE_KINESIS, "Télékinésie"
    battleeffect MOVE_EFFECT_ACC_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 80
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_KINESIS, "Le lanceur distrait\nl’ennemi en pliant\nune cuillère. Peut\nbaisser la précision\nde l’ennemi."

movedata MOVE_SOFT_BOILED, "E-Coque"
    battleeffect MOVE_EFFECT_RESTORE_HALF_HP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SOFT_BOILED, "Le lanceur récupère\njusqu’à la moitié de\nses PV max. En\ndehors des combats,\nrestaure des PV."

movedata MOVE_HIGH_JUMP_KICK, "Pied Voltige"
    battleeffect MOVE_EFFECT_CRASH_ON_MISS
    pss SPLIT_PHYSICAL
    basepower 130
    type TYPE_FIGHTING
    accuracy 90
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HIGH_JUMP_KICK, "Le lanceur s’élance\npour effectuer un\ncoup de genou sauté.\nS’il échoue, le\nlanceur se blesse."

movedata MOVE_GLARE, "Regard Médusant"
    battleeffect MOVE_EFFECT_STATUS_PARALYZE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_GLARE, "Le lanceur intimide\nl’ennemi grâce à son\nregard terrifiant\npour le paralyser."

movedata MOVE_DREAM_EATER, "Dévorêve"
    battleeffect MOVE_EFFECT_RECOVER_DAMAGE_SLEEP
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_PSYCHIC
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_DREAM_EATER, "Attaque réservée aux\nennemis endormis. Le\nlanceur récupère en\nPV la moitié des\ndégâts infligés."

movedata MOVE_POISON_GAS, "Gaz Toxik"
    battleeffect MOVE_EFFECT_STATUS_POISON
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 100
    pp 40
    effectchance 0
    target DEBUG_NEEDS_TESTING ? RANGE_ADJACENT_OPPONENTS : RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_POISON_GAS, "Un nuage de gaz\ntoxique est projeté\nau visage de l’ennemi.\nPeut l’empoisonner."

movedata MOVE_BARRAGE, "Pilonnage"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 15
    type TYPE_NORMAL
    accuracy 85
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BARRAGE, "Projette de 2 à 5\ngrosses boules sur\nl’ennemi."

movedata MOVE_LEECH_LIFE, "Vampirisme"
    battleeffect MOVE_EFFECT_RECOVER_HALF_DAMAGE_DEALT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_BUG
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_LEECH_LIFE, "Une attaque qui aspire\nle sang de l’ennemi.\nLa moitié des dégâts\nsont convertis en\nPV pour le lanceur."

movedata MOVE_LOVELY_KISS, "Grobisou"
    battleeffect MOVE_EFFECT_STATUS_SLEEP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 75
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_LOVELY_KISS, "Le lanceur fait un\nbisou à l’ennemi en\nprenant une mine\neffrayante. Peut\nendormir l’ennemi."

movedata MOVE_SKY_ATTACK, "Piqué"
    battleeffect MOVE_EFFECT_CHARGE_TURN_HIGH_CRIT_FLINCH
    pss SPLIT_PHYSICAL
    basepower 140
    type TYPE_FLYING
    accuracy 100
    pp 5
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_UNIQUE_JUDGE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SKY_ATTACK, "Une attaque en 2\ntours au taux de\ncritiques élevé. Peut\naussi apeurer\nl’ennemi."

movedata MOVE_TRANSFORM, "Morphing"
    battleeffect MOVE_EFFECT_TRANSFORM
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_TRANSFORM, "Le lanceur devient\nune copie de l’ennemi\net obtient la même\npalette de capacités."

movedata MOVE_BUBBLE, "Écume"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_SPECIAL
    basepower 20
    type TYPE_WATER
    accuracy 100
    pp 30
    effectchance 10
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LAST_NEXT_TURN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_BUBBLE, "Des bulles frappent\nl’ennemi. Peut réduire\nsa Vitesse."

movedata MOVE_DIZZY_PUNCH, "Uppercut"
    battleeffect MOVE_EFFECT_CONFUSE_HIT
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DIZZY_PUNCH, "Un enchaînement de\ncoups de poing\ncadencés. Peut\naussi rendre confus."

movedata MOVE_SPORE, "Spore"
    battleeffect MOVE_EFFECT_STATUS_SLEEP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SPORE, "Le lanceur répand un\nnuage de spores qui\nendort."

movedata MOVE_FLASH, "Flash"
    battleeffect MOVE_EFFECT_ACC_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FLASH, "Explosion lumineuse\nqui fait baisser la\nprécision de l’ennemi.\nPermet aussi d’éclai-\nrer les grottes."

movedata MOVE_PSYWAVE, "Vague Psy"
    battleeffect MOVE_EFFECT_RANDOM_DAMAGE_1_TO_150_LEVEL
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_PSYCHIC
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_PSYWAVE, "Une étrange onde\nd’énergie chaude\nfrappe l’ennemi.\nCette attaque est\nd’intensité variable."

movedata MOVE_SPLASH, "Trempette"
    battleeffect MOVE_EFFECT_DO_NOTHING
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SPLASH, "Le lanceur barbote\net éclabousse les\nenvirons. Cette\ncapacité n’a aucun\neffet."

movedata MOVE_ACID_ARMOR, "Acidarmure"
    battleeffect MOVE_EFFECT_DEF_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ACID_ARMOR, "Le lanceur modifie sa\nstructure moléculaire\npour se liquéfier et\naugmenter fortement\nsa Défense."

movedata MOVE_CRABHAMMER, "Pince-Masse"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_WATER
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_CRABHAMMER, "Une grande pince\nmartèle l’ennemi.\nCette capacité a un\ntaux de critiques\nélevé."

movedata MOVE_EXPLOSION, "Explosion"
    battleeffect MOVE_EFFECT_HALVE_DEFENSE
    pss SPLIT_PHYSICAL
    basepower 250
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_ALL_SAME_JUDGE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_EXPLOSION, "Le lanceur explose et\ninflige des dégâts à\ntous les autres\nPokémon au combat.\nMet K.O. le lanceur."

movedata MOVE_FURY_SWIPES, "Combo-Griffe"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 18
    type TYPE_NORMAL
    accuracy 80
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_FURY_SWIPES, "L’ennemi est lacéré\npar des faux ou des\ngriffes de 2 à 5\nfois."

movedata MOVE_BONEMERANG, "Osmerang"
    battleeffect MOVE_EFFECT_HIT_TWICE
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BONEMERANG, "Le lanceur projette\nson os comme un\nboomerang. Cette\nattaque frappe à\nl’aller et au retour."

movedata MOVE_REST, "Repos"
    battleeffect MOVE_EFFECT_RECOVER_HEALTH_AND_SLEEP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_REST, "Le lanceur dort\npendant 2 tours. Il\nregagne tous ses PV\net n’a plus de\nproblèmes de statut."

movedata MOVE_ROCK_SLIDE, "Éboulement"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_ROCK
    accuracy 100
    pp 10
    effectchance 30
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ROCK_SLIDE, "Envoie de gros\nrochers sur l’ennemi\npour infliger des\ndégâts. Peut aussi\nl’apeurer."

movedata MOVE_HYPER_FANG, "Croc de Mort"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HYPER_FANG, "Le lanceur mord\nl’ennemi à l’aide de\nses incisives\naiguisées. Peut aussi\napeurer l’ennemi."

movedata MOVE_SHARPEN, "Affûtage"
    battleeffect MOVE_EFFECT_ATK_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SHARPEN, "Le lanceur réduit son\nnombre de polygones\npour accentuer ses\nangles et augmenter\nson Attaque."

movedata MOVE_CONVERSION, "Conversion"
    battleeffect MOVE_EFFECT_CONVERSION
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_CONVERSION, "Le lanceur change\nde type pour prendre\ncelui de l’une de\nses capacités."

movedata MOVE_TRI_ATTACK, "Triplattaque"
    battleeffect MOVE_EFFECT_RANDOM_PRIMARY_STATUS_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_TRI_ATTACK, "Le lanceur envoie\ntrois boules d’énergie\nsimultanément. Peut\naussi paralyser, brû-\nler ou geler l’ennemi."

movedata MOVE_SUPER_FANG, "Croc Fatal"
    battleeffect MOVE_EFFECT_HALVE_HP
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SUPER_FANG, "Une vilaine morsure\nd’incisives qui réduit\nde moitié les PV de\nl’ennemi."

movedata MOVE_SLASH, "Tranche"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SLASH, "Un coup de griffe ou\nautre tranche\nl’ennemi. Taux de\ncritiques élevé."

movedata MOVE_SUBSTITUTE, "Clonage"
    battleeffect MOVE_EFFECT_SET_SUBSTITUTE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SUBSTITUTE, "Le lanceur fait une\ncopie de lui-même en\nsacrifiant quelques\nPV. La copie sert de\nleurre."

movedata MOVE_STRUGGLE, "Lutte"
    battleeffect MOVE_EFFECT_STRUGGLE
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STRUGGLE, "Une attaque \ndésespérée, lancée\nquand le lanceur n’a\nplus de PP. Le blesse\naussi légèrement."

movedata MOVE_SKETCH, "Gribouille"
    battleeffect MOVE_EFFECT_LEARN_MOVE_PERMANENT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_UNUSABLE_IN_GEN_8
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SKETCH, "Le lanceur apprend\nle dernier coup\nutilisé par l’ennemi.\nGribouille disparaît\naprès utilisation."

movedata MOVE_TRIPLE_KICK, "Triple Pied"
    battleeffect MOVE_EFFECT_HIT_THREE_TIMES_INCREMENT_BASE_POWER_10
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TRIPLE_KICK, "Une salve de 1 à 3\ncoups de pied dont\nla puissance augmente\nà chaque coup porté."

movedata MOVE_THIEF, "Larcin"
    battleeffect MOVE_EFFECT_STEAL_HELD_ITEM
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_DARK
    accuracy 100
    pp 25
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_THIEF, "Le lanceur attaque\nl’ennemi et vole son\nobjet. Le lanceur ne\npeut rien voler s’il\ntient déjà un objet."

movedata MOVE_SPIDER_WEB, "Toile"
    battleeffect MOVE_EFFECT_PREVENT_ESCAPE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_BUG
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SPIDER_WEB, "Le lanceur enserre\nl’ennemi à l’aide d’une\nfine soie gluante pour\nl’empêcher de fuir le\ncombat."

movedata MOVE_MIND_READER, "Lire-Esprit"
    battleeffect MOVE_EFFECT_NEXT_ATTACK_ALWAYS_HITS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_MIND_READER, "Le lanceur analyse les\nmouvements de\nl’ennemi pour être\nplus sûr de toucher\nau coup suivant."

movedata MOVE_NIGHTMARE, "Cauchemar"
    battleeffect MOVE_EFFECT_STATUS_NIGHTMARE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GHOST
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_NIGHTMARE, "Un cauchemar qui\ninflige des dégâts à\nchaque tour à un\nennemi endormi."

movedata MOVE_FLAME_WHEEL, "Roue de Feu"
    battleeffect MOVE_EFFECT_THAW_AND_BURN_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FIRE
    accuracy 100
    pp 25
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FLAME_WHEEL, "Le lanceur s’entoure\nde feu et charge\nl’ennemi. Peut aussi\nbrûler l’ennemi."

movedata MOVE_SNORE, "Ronflement"
    battleeffect MOVE_EFFECT_DAMAGE_WHILE_ASLEEP
    pss SPLIT_SPECIAL
    basepower 50
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SNORE, "Une attaque qui ne\nfonctionne que si le\nlanceur est endormi.\nLe boucan peut aussi\napeurer l’ennemi."

movedata MOVE_CURSE, "Malédiction"
    battleeffect MOVE_EFFECT_CURSE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GHOST
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_CURSE, "Une capacité qui\nfonctionne\ndifféremment pour\nles Pokémon Spectre."

movedata MOVE_FLAIL, "Gigotage"
    battleeffect MOVE_EFFECT_INCREASE_POWER_WITH_LESS_HP
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_FLAIL, "Le lanceur fait\ntournoyer son fléau.\nPlus ses PV sont bas,\nplus l’attaque est\npuissante."

movedata MOVE_CONVERSION_2, "Conversion2"
    battleeffect MOVE_EFFECT_CONVERSION2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 30
    effectchance 0
    target DEBUG_NEEDS_TESTING ? RANGE_ALL_ADJACENT : RANGE_USER
    priority 0
    flags 0
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_CONVERSION_2, "Le lanceur change\nde type pour être\nrésistant au type de\nla dernière attaque\nqui l’a touché."

movedata MOVE_AEROBLAST, "Aéroblast"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_FLYING
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_AEROBLAST, "Le lanceur projette\nune tornade sur\nl’ennemi pour infliger\ndes dégâts. Taux de\ncritiques élevé."

movedata MOVE_COTTON_SPORE, "Spore Coton"
    battleeffect MOVE_EFFECT_SPEED_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 100
    pp 40
    effectchance 0
    target DEBUG_NEEDS_TESTING ? RANGE_ADJACENT_OPPONENTS : RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_COTTON_SPORE, "Le lanceur libère des\nspores cotonneuses\nqui collent à l’ennemi\net baissent fortement\nsa Vitesse."

movedata MOVE_REVERSAL, "Contre"
    battleeffect MOVE_EFFECT_INCREASE_POWER_WITH_LESS_HP
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_FIGHTING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_REVERSAL, "Le lanceur ne retient\nplus ses coups. Plus\nses PV sont bas et\nplus l’attaque est\npuissante."

movedata MOVE_SPITE, "Dépit"
    battleeffect MOVE_EFFECT_DECREASE_LAST_MOVE_PP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GHOST
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SPITE, "Le lanceur exprime\nson ressentiment\nen retirant 4 PP de\nla dernière attaque\nde l’ennemi."

movedata MOVE_POWDER_SNOW, "Poudreuse"
    battleeffect MOVE_EFFECT_FREEZE_HIT
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_ICE
    accuracy 100
    pp 25
    effectchance 10
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_POWDER_SNOW, "Le lanceur projette\nde la neige poudreuse.\nPeut aussi geler\nl’ennemi."

movedata MOVE_PROTECT, "Abri"
    battleeffect MOVE_EFFECT_PROTECT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 4
    flags 0
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_PROTECT, "Le lanceur esquive les\nattaques. Plus la\ncapacité est utilisée\nd’affilée, plus elle\nrisque d’échouer."

movedata MOVE_MACH_PUNCH, "Mach Punch"
    battleeffect MOVE_EFFECT_PRIORITY_1
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_FIGHTING
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MACH_PUNCH, "Coup de poing\nfulgurant. Frappe en\npremier."

movedata MOVE_SCARY_FACE, "Grimace"
    battleeffect MOVE_EFFECT_SPEED_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_LAST_NEXT_TURN
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SCARY_FACE, "Une grimace qui\neffraie l’ennemi et\nréduit fortement\nsa Vitesse."

movedata MOVE_FEINT_ATTACK, "Feinte"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_DARK
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FEINT_ATTACK, "Le lanceur s’approche\nl’air de rien avant de\nfrapper par surprise.\nN’échoue jamais."

movedata MOVE_SWEET_KISS, "Doux Baiser"
    battleeffect MOVE_EFFECT_STATUS_CONFUSE
    pss SPLIT_STATUS
    basepower 0
    type FAIRY_TYPE_IMPLEMENTED ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 75
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SWEET_KISS, "Le lanceur envoie\nun bisou si mignon\net désarmant qu’il\nplonge l’ennemi dans\nla confusion."

movedata MOVE_BELLY_DRUM, "Cognobidon"
    battleeffect MOVE_EFFECT_MAX_ATK_LOSE_HALF_MAX_HP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_BELLY_DRUM, "Améliore l’Attaque\nau maximum en\nsacrifiant la moitié\ndes PV max."

movedata MOVE_SLUDGE_BOMB, "Bombe Beurk"
    battleeffect MOVE_EFFECT_POISON_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_POISON
    accuracy 100
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SLUDGE_BOMB, "Envoie des détritus\nsur l’ennemi. Peut\naussi l’empoisonner."

movedata MOVE_MUD_SLAP, "Coud'Boue"
    battleeffect MOVE_EFFECT_LOWER_ACCURACY_HIT
    pss SPLIT_SPECIAL
    basepower 20
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_MUD_SLAP, "Le lanceur envoie de\nla boue au visage de\nl’ennemi pour infliger\ndes dégâts et baisser\nsa précision."

movedata MOVE_OCTAZOOKA, "Octazooka"
    battleeffect MOVE_EFFECT_LOWER_ACCURACY_HIT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_WATER
    accuracy 85
    pp 10
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_OCTAZOOKA, "Le lanceur attaque en\nprojetant de l’encre \nau visage de l’ennemi.\nPeut aussi baisser la\nprécision de l’ennemi."

movedata MOVE_SPIKES, "Picots"
    battleeffect MOVE_EFFECT_SET_SPIKES
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GROUND
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_OPPONENT_SIDE
    priority 0
    flags FLAG_MAGIC_COAT
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SPIKES, "Le lanceur disperse\ndes piquants sur le\nsol pour blesser les\nPokémon qui entrent\nau combat."

movedata MOVE_ZAP_CANNON, "Élecanon"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_ELECTRIC
    accuracy 50
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ZAP_CANNON, "Un boulet de canon\nélectrifié qui inflige\ndes dégâts et peut\nparalyser l’ennemi."

movedata MOVE_FORESIGHT, "Clairvoyance"
    battleeffect MOVE_EFFECT_IGNORE_EVASION_REMOVE_GHOST_IMMUNE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FORESIGHT, "Permet de toucher un\nPokémon Spectre avec\nn’importe quelle capa-\ncité et de toucher un\nennemi insaisissable."

movedata MOVE_DESTINY_BOND, "Lien du Destin"
    battleeffect MOVE_EFFECT_KO_MON_THAT_DEFEATED_USER
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GHOST
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags 0
    appeal APPEAL_ALL_SAME_JUDGE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_DESTINY_BOND, "Quand cette capacité\nest activée, elle met\nK.O. un ennemi qui\nporte un coup fatal\nau lanceur."

movedata MOVE_PERISH_SONG, "Requiem"
    battleeffect MOVE_EFFECT_ALL_FAINT_3_TURNS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_HIDE_SHADOW
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_PERISH_SONG, "Un Pokémon qui\nentend ce requiem est\nK.O. dans 3 tours à\nmoins qu’il ne quitte\nle combat."

movedata MOVE_ICY_WIND, "Vent Glace"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_SPECIAL
    basepower 55
    type TYPE_ICE
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_NEXT_TURN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ICY_WIND, "Une bourrasque de\nvent froid blesse\nl’ennemi. Réduit aussi\nsa Vitesse."

movedata MOVE_DETECT, "Détection"
    battleeffect MOVE_EFFECT_PROTECT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIGHTING
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 4
    flags 0
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DETECT, "Permet d’esquiver\ntoutes les attaques.\nPlus on l’utilise\nd’affilée, plus elle a\nde chances d’échouer."

movedata MOVE_BONE_RUSH, "Charge Os"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 25
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BONE_RUSH, "Le lanceur frappe\nl’ennemi 2 à 5 fois\navec un os."

movedata MOVE_LOCK_ON, "Verrouillage"
    battleeffect MOVE_EFFECT_NEXT_ATTACK_ALWAYS_HITS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_LOCK_ON, "Verrouille l’ennemi\npour ne pas le rater\nau tour suivant."

movedata MOVE_OUTRAGE, "Colère"
    battleeffect MOVE_EFFECT_CONTINUE_AND_CONFUSE_SELF
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_DRAGON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_RANDOM_OPPONENT
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_OUTRAGE, "Le lanceur laisse\néclater sa rage et\nattaque pendant 2 à\n3 tours avant de\ncéder à la confusion."

movedatalongname MOVE_SANDSTORM, "TempêteDeSable", "Tempête de Sable"
    battleeffect MOVE_EFFECT_WEATHER_SANDSTORM
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ROCK
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags 0
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SANDSTORM, "Une tempête de sable\nde 5 tours qui blesse\ntous les Pokémon sauf\nles types Roche, Sol\net Acier."

movedata MOVE_GIGA_DRAIN, "Giga-Sangsue"
    battleeffect MOVE_EFFECT_RECOVER_HALF_DAMAGE_DEALT
    pss SPLIT_SPECIAL
    basepower 75
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_GIGA_DRAIN, "Une attaque qui\nconvertit la moitié\ndes dégâts infligés\nen PV."

movedata MOVE_ENDURE, "Ténacité"
    battleeffect MOVE_EFFECT_SURVIVE_WITH_1_HP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 4
    flags FLAG_KEEP_HP_BAR
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ENDURE, "Le lanceur résiste\naux attaques avec\n1 PV. Peut échouer\nsi utilisé plusieurs\nfois de suite."

movedata MOVE_CHARM, "Charme"
    battleeffect MOVE_EFFECT_ATK_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type FAIRY_TYPE_IMPLEMENTED ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_CHARM, "Le lanceur fait les\nyeux doux pour berner\nl’ennemi et réduire\nconsidérablement\nson Attaque."

movedata MOVE_ROLLOUT, "Roulade"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_EACH_TURN_LOCK_INTO
    pss SPLIT_PHYSICAL
    basepower 30
    type TYPE_ROCK
    accuracy 90
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ROLLOUT, "Un rocher roule sur\nl’ennemi pendant 5\ntours. L’attaque \ngagne en puissance\nà chaque coup."

movedata MOVE_FALSE_SWIPE, "Faux-Chage"
    battleeffect MOVE_EFFECT_LEAVE_WITH_1_HP
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_NORMAL
    accuracy 100
    pp 40
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FALSE_SWIPE, "Le lanceur retient\nses coups pour que\nl’ennemi garde au\nmoins 1 PV et ne\ntombe pas K.O."

movedata MOVE_SWAGGER, "Vantardise"
    battleeffect MOVE_EFFECT_ATK_UP_2_STATUS_CONFUSION
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 85
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SWAGGER, "Fait enrager l’ennemi\net le plonge dans la\nconfusion, mais\naugmente fortement\nson Attaque."

movedata MOVE_MILK_DRINK, "Lait à Boire"
    battleeffect MOVE_EFFECT_RESTORE_HALF_HP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_MILK_DRINK, "Restaure jusqu’à la\nmoitié des PV max du\nlanceur. En dehors\ndes combats,\nrestaure des PV."

movedata MOVE_SPARK, "Étincelle"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_ELECTRIC
    accuracy 100
    pp 20
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPARK, "Lance une charge\nélectrique sur\nl’ennemi. Peut aussi\nle paralyser."

movedata MOVE_FURY_CUTTER, "Taillade"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_EACH_TURN
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_BUG
    accuracy 95
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FURY_CUTTER, "Un coup de faux ou de\ngriffe dont la force\naugmente quand il\ntouche plusieurs fois\nd’affilée."

movedata MOVE_STEEL_WING, "Ailes d'Acier"
    battleeffect MOVE_EFFECT_RAISE_DEF_HIT
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_STEEL
    accuracy 100
    pp 25
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STEEL_WING, "Le lanceur frappe\nl’ennemi avec des\nailes d’acier. Peut\naussi augmenter la\nDéfense du lanceur."

movedata MOVE_MEAN_LOOK, "Regard Noir"
    battleeffect MOVE_EFFECT_PREVENT_ESCAPE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MEAN_LOOK, "Le lanceur pétrifie\nl’ennemi en lui lançant\nun regard noir. Il\ndevient incapable de\ns’enfuir."

movedata MOVE_ATTRACT, "Attraction"
    battleeffect MOVE_EFFECT_INFATUATE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_ATTRACT, "Si l’ennemi est du\nsexe opposé, il tombe\namoureux et rechigne\nalors à attaquer."

movedata MOVE_SLEEP_TALK, "Blabla Dodo"
    battleeffect MOVE_EFFECT_USE_RANDOM_LEARNED_MOVE_SLEEP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority 0
    flags 0
    appeal APPEAL_BASIC
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SLEEP_TALK, "Le lanceur utilise un\nde ses coup au hasard\nen dormant."

movedata MOVE_HEAL_BELL, "Glas de Soin"
    battleeffect MOVE_EFFECT_CURE_PARTY_STATUS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_HEAL_BELL, "Carillon apaisant qui\nsoigne les problèmes\nde statut de tous les\nPokémon de l’équipe."

movedata MOVE_RETURN, "Retour"
    battleeffect MOVE_EFFECT_POWER_BASED_ON_FRIENDSHIP
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_RETURN, "Une attaque furieuse\ndont la puissance\naugmente quand le\nPokémon apprécie\nson Dresseur."

movedata MOVE_PRESENT, "Cadeau"
    battleeffect MOVE_EFFECT_RANDOM_POWER_MAYBE_HEAL
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_PRESENT, "Le lanceur attaque en\noffrant un cadeau\npiégé à l’ennemi. Peut\nà l’inverse restaurer\ncertains de ses PV."

movedata MOVE_FRUSTRATION, "Frustration"
    battleeffect MOVE_EFFECT_POWER_BASED_ON_LOW_FRIENDSHIP
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_FRUSTRATION, "Moins le Pokémon aime\nson Dresseur, plus\ncette attaque est\npuissante."

movedata MOVE_SAFEGUARD, "Rune Protect"
    battleeffect MOVE_EFFECT_PREVENT_STATUS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 25
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SAFEGUARD, "Champ protecteur\nempêchant tous les\nproblèmes de statut\npendant 5 tours."

movedata MOVE_PAIN_SPLIT, "Balance"
    battleeffect MOVE_EFFECT_AVERAGE_HP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_PAIN_SPLIT, "Le lanceur ajoute\nses PV à ceux d’un\nautre Pokémon\net les répartit\néquitablement."

movedata MOVE_SACRED_FIRE, "Feu Sacré"
    battleeffect MOVE_EFFECT_THAW_AND_BURN_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SACRED_FIRE, "Un feu mystique\nd’une intensité\nredoutable attaque\nl’ennemi. Peut aussi\nle brûler."

movedata MOVE_MAGNITUDE, "Ampleur"
    battleeffect MOVE_EFFECT_RANDOM_POWER_10_CASES
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_GROUND
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_MAGNITUDE, "Un tremblement\nde terre d’intensité\nvariable qui affecte\ntous les autres\nPokémon au combat."

movedata MOVE_DYNAMIC_PUNCH, "Dynamo-Poing"
    battleeffect MOVE_EFFECT_CONFUSE_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_FIGHTING
    accuracy 50
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DYNAMIC_PUNCH, "Le lanceur rassemble\nses forces et envoie\nun coup de poing à\nl’ennemi. S’il est\ntouché, il est confus."

movedata MOVE_MEGAHORN, "Mégacorne"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_BUG
    accuracy 85
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MEGAHORN, "Le lanceur utilise ses\ngigantesques cornes\npour charger\nl’ennemi."

movedata MOVE_DRAGON_BREATH, "Draco-Souffle"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_DRAGON
    accuracy 100
    pp 20
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRAGON_BREATH, "Le lanceur souffle\nfort sur l’ennemi pour\ninfliger des dégâts.\nPeut aussi le\nparalyser."

movedata MOVE_BATON_PASS, "Relais"
    battleeffect MOVE_EFFECT_PASS_STATS_AND_STATUS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_USER
    priority 0
    flags 0
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_BATON_PASS, "Le lanceur échange\nsa place et tout\nchangement de stat\navec un Pokémon de\nl’équipe."

movedata MOVE_ENCORE, "Encore"
    battleeffect MOVE_EFFECT_ENCORE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_ENCORE, "Oblige l’ennemi à\nrépéter sa dernière\ncapacité durant 3 à 7\ntours."

movedata MOVE_PURSUIT, "Poursuite"
    battleeffect MOVE_EFFECT_HIT_BEFORE_SWITCH
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_DARK
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_PURSUIT, "Une attaque qui inflige\ndeux fois plus de\ndégâts à un ennemi qui\nquitte le combat."

movedata MOVE_RAPID_SPIN, "Tour Rapide"
    battleeffect MOVE_EFFECT_REMOVE_HAZARDS_AND_BINDING
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_NORMAL
    accuracy 100
    pp 40
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RAPID_SPIN, "Une attaque\ntournoyante pouvant\naussi annuler par ex.\nEtreinte, Ligotage,\nVampigraine ou Picots."

movedata MOVE_SWEET_SCENT, "Doux Parfum"
    battleeffect MOVE_EFFECT_EVA_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SWEET_SCENT, "Un doux parfum qui\nréduit l’esquive de\nl’ennemi. Attire aussi\nles Pokémon sauvages."

movedata MOVE_IRON_TAIL, "Queue de Fer"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_STEEL
    accuracy 75
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_IRON_TAIL, "Attaque l’ennemi avec\nune queue de fer.\nPeut aussi baisser la\nDéfense de l’ennemi."

movedata MOVE_METAL_CLAW, "Griffe Acier"
    battleeffect MOVE_EFFECT_RAISE_ATTACK_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_STEEL
    accuracy 100
    pp 35
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_METAL_CLAW, "Attaque avec des\ngriffes d’acier. Peut\naussi augmenter\nl’Attaque du lanceur."

movedata MOVE_VITAL_THROW, "Corps Perdu"
    battleeffect MOVE_EFFECT_PRIORITY_NEG_1_BYPASS_ACCURACY
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_FIGHTING
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority -1
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LAST_NEXT_TURN
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_VITAL_THROW, "Le lanceur laisse\nl’ennemi porter le\n1¹ coup. En échange,\ncette capacité\nn’échoue jamais."

movedata MOVE_MORNING_SUN, "Aurore"
    battleeffect MOVE_EFFECT_HEAL_HALF_DIFFERENT_IN_WEATHER
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MORNING_SUN, "Un soin qui restaure\ndes PV au lanceur.\nSon efficacité varie\nen fonction de la\nmétéo."

movedata MOVE_SYNTHESIS, "Synthèse"
    battleeffect MOVE_EFFECT_HEAL_HALF_DIFFERENT_IN_WEATHER
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SYNTHESIS, "Un soin qui restaure\ndes PV au lanceur.\nSon efficacité varie\nen fonction de la\nmétéo."

movedata MOVE_MOONLIGHT, "Rayon Lune"
    battleeffect MOVE_EFFECT_HEAL_HALF_DIFFERENT_IN_WEATHER
    pss SPLIT_STATUS
    basepower 0
    type FAIRY_TYPE_IMPLEMENTED ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MOONLIGHT, "Un soin qui restaure\ndes PV au lanceur.\nSon efficacité varie\nen fonction de la\nmétéo."

movedatalongname MOVE_HIDDEN_POWER, "Puis. Cachée", "Puissance Cachée"
    battleeffect MOVE_EFFECT_RANDOM_TYPE_BASED_ON_IVS
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_HIDDEN_POWER, "Attaque dont la\npuissance et le type\ndépendent du Pokémon\nqui l’utilise."

movedata MOVE_CROSS_CHOP, "Coup Croix"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_FIGHTING
    accuracy 80
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CROSS_CHOP, "Le lanceur délivre un\ncoup double en\ncroisant les\navant-bras. Taux de\ncritiques élevé."

movedata MOVE_TWISTER, "Ouragan"
    battleeffect MOVE_EFFECT_FLINCH_DOUBLE_DAMAGE_FLY_OR_BOUNCE
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_DRAGON
    accuracy 100
    pp 20
    effectchance 20
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TWISTER, "Déclenche un terrible\nouragan sur l’ennemi.\nPeut aussi l’apeurer."

movedata MOVE_RAIN_DANCE, "Danse Pluie"
    battleeffect MOVE_EFFECT_WEATHER_RAIN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_WATER
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags 0
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_RAIN_DANCE, "Invoque de fortes\npluies qui durent 5\ntours et améliorent\nles capacités de type\nEau."

movedata MOVE_SUNNY_DAY, "Zénith"
    battleeffect MOVE_EFFECT_WEATHER_SUN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIRE
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags 0
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SUNNY_DAY, "Fait briller le soleil\npendant 5 tours et\naméliore les capacités\nde type Feu."

movedata MOVE_CRUNCH, "Mâchouille"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_DARK
    accuracy 100
    pp 15
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_CRUNCH, "Le lanceur mord\nl’ennemi de ses crocs\npointus. Peut aussi\nbaisser la Défense de\nl’ennemi."

movedata MOVE_MIRROR_COAT, "Voile Miroir"
    battleeffect MOVE_EFFECT_MIRROR_COAT
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_PSYCHIC
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority -5
    flags FLAG_PROTECT
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MIRROR_COAT, "Une riposte qui contre\nn’importe quelle\nattaque spéciale en\ninfligeant le double\ndes dégâts subis."

movedata MOVE_PSYCH_UP, "Boost"
    battleeffect MOVE_EFFECT_COPY_STAT_CHANGES
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_PSYCH_UP, "Une autohypnose qui\npermet au lanceur de\ncopier les\nchangements de\nstats de l’ennemi."

movedata MOVE_EXTREME_SPEED, "Vitesse Extrême"
    battleeffect MOVE_EFFECT_PRIORITY_1
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 2
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_EXTREME_SPEED, "Le lanceur charge\nà une vitesse\nrenversante.\nCette attaque a\nl’initiative."

movedata MOVE_ANCIENT_POWER, "Pouvoir Antique"
    battleeffect MOVE_EFFECT_RAISE_ALL_STATS_HIT
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_ROCK
    accuracy 100
    pp 5
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ANCIENT_POWER, "Une attaque\npréhistorique qui peut\naugmenter toutes\nles stats du lanceur\nd’un seul coup."

movedata MOVE_SHADOW_BALL, "Ball'Ombre"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_GHOST
    accuracy 100
    pp 15
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SHADOW_BALL, "Projette une grande\nombre sur l’ennemi.\nPeut aussi faire\nbaisser sa Déf. Spé."

movedata MOVE_FUTURE_SIGHT, "Prescience"
    battleeffect MOVE_EFFECT_HIT_IN_3_TURNS
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags 0
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FUTURE_SIGHT, "De l’énergie psychique\nvient frapper l’ennemi\n2 tours après\nl’utilisation de cette\ncapacité."

movedata MOVE_ROCK_SMASH, "Éclate-Roc"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_FIGHTING
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ROCK_SMASH, "Le lanceur porte un\ncoup dévastateur à\nl’ennemi. Permet aussi\nde briser des rochers\nfissurés."

movedata MOVE_WHIRLPOOL, "Siphon"
    battleeffect MOVE_EFFECT_WHIRLPOOL
    pss SPLIT_SPECIAL
    basepower 35
    type TYPE_WATER
    accuracy 85
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_WHIRLPOOL, "Piège l’ennemi dans\nune trombe d’eau\npendant 2 à 5 tours.\nPermet de franchir\nles tourbillons."

movedata MOVE_BEAT_UP, "Baston"
    battleeffect MOVE_EFFECT_BEAT_UP
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_BEAT_UP, "Le lanceur appelle les\nPokémon de l’équipe\nà attaquer. Plus ils\nsont nombreux, plus\nil y a de dégâts."

movedata MOVE_FAKE_OUT, "Bluff"
    battleeffect MOVE_EFFECT_ALWAYS_FLINCH_FIRST_TURN_ONLY
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 3
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_FAKE_OUT, "Permet de frapper en\npremier et apeure\nl’ennemi. Elle ne\nfonctionne qu’au\npremier tour."

movedata MOVE_UPROAR, "Brouhaha"
    battleeffect MOVE_EFFECT_UPROAR
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_RANDOM_OPPONENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_UPROAR, "Le lanceur attaque\nen rugissant durant\n2 à 5 tours. Pendant\nce temps, personne\nne peut s’endormir."

movedata MOVE_STOCKPILE, "Stockage"
    battleeffect MOVE_EFFECT_STOCKPILE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_STOCKPILE, "Le lanceur accumule\nde la puissance et\naugmente sa Défense\net sa Déf. Spé. Peut\nêtre utilisé 3 fois."

movedata MOVE_SPIT_UP, "Relâche"
    battleeffect MOVE_EFFECT_SPIT_UP
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SPIT_UP, "Libère dans une\nattaque la puissance\nprécédemment\naccumulée avec\nStockage."

movedata MOVE_SWALLOW, "Avale"
    battleeffect MOVE_EFFECT_SWALLOW
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SWALLOW, "Le lanceur absorbe la\npuissance accumulée\navec Stockage pour\nrestaurer ses PV."

movedata MOVE_HEAT_WAVE, "Canicule"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 95
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_HEAT_WAVE, "Le lanceur provoque\nune vague de\nchaleur. Peut aussi\nbrûler l’ennemi."

movedata MOVE_HAIL, "Grêle"
    battleeffect MOVE_EFFECT_WEATHER_HAIL
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ICE
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_HAIL, "Invoque une tempête\nde grêle qui dure 5\ntours. Ne blesse pas\nles Pokémon de type\nGlace."

movedata MOVE_TORMENT, "Tourmente"
    battleeffect MOVE_EFFECT_TORMENT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_TORMENT, "Le lanceur irrite\nl’ennemi pour\nl’empêcher d’utiliser\nla même capacité\n2 fois de suite."

movedata MOVE_FLATTER, "Flatterie"
    battleeffect MOVE_EFFECT_SP_ATK_UP_CAUSE_CONFUSION
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FLATTER, "Rend l’ennemi\nconfus, mais\naugmente son\nAtq. Spé."

movedata MOVE_WILL_O_WISP, "Feu Follet"
    battleeffect MOVE_EFFECT_STATUS_BURN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIRE
    accuracy 85
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_WILL_O_WISP, "Lance une sinistre\nflamme violette à\nl’ennemi pour lui\ninfliger une brûlure."

movedata MOVE_MEMENTO, "Souvenir"
    battleeffect MOVE_EFFECT_FAINT_AND_ATK_SP_ATK_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_ALL_SAME_JUDGE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_MEMENTO, "Le lanceur est mis\nK.O., mais l’Attaque\net l’Atq. Spé. de\nl’ennemi baissent\nbeaucoup."

movedata MOVE_FACADE, "Façade"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_WHEN_STATUSED
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_FACADE, "Une attaque dont la\npuissance double\nlorsque le lanceur\nest empoisonné,\nparalysé ou brûlé."

movedata MOVE_FOCUS_PUNCH, "Mitra-Poing"
    battleeffect MOVE_EFFECT_HIT_LAST_WHIFF_IF_HIT
    pss SPLIT_PHYSICAL
    basepower 150
    type TYPE_FIGHTING
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority -3
    flags FLAG_HIDE_SHADOW | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_UNIQUE_JUDGE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_FOCUS_PUNCH, "Le lanceur se\nconcentre avant\nd’attaquer. Echoue\ns’il est touché avant\nd’avoir frappé."

movedata MOVE_SMELLING_SALTS, "Stimulant"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_AND_CURE_PARALYSIS
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SMELLING_SALTS, "Cette attaque est\ndoublement efficace\nsur les ennemis\nparalysés, mais elle\nsoigne leur paralysie."

movedata MOVE_FOLLOW_ME, "Par Ici"
    battleeffect MOVE_EFFECT_MAKE_GLOBAL_TARGET
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 2
    flags 0
    appeal APPEAL_RANDOMIZE_NEXT_TURN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_FOLLOW_ME, "Attire l’attention.\nLes ennemis\nn’attaquent que le\nlanceur."

movedata MOVE_NATURE_POWER, "Force Nature"
    battleeffect MOVE_EFFECT_NATURE_POWER
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_RANDOMIZE_NEXT_TURN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_NATURE_POWER, "Une attaque qui tire\nsa force de la nature.\nSon type varie selon\nle terrain."

movedata MOVE_CHARGE, "Chargeur"
    battleeffect MOVE_EFFECT_SP_DEF_UP_DOUBLE_ELECTRIC_POWER
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ELECTRIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_CHARGE, "Le lanceur concentre\nsa puissance pour\nsa prochaine attaque\nElectrik. Augmente sa\nDéf. Spé."

movedata MOVE_TAUNT, "Provoc"
    battleeffect MOVE_EFFECT_TAUNT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_TAUNT, "Provoque l’ennemi.\nL’oblige à n’utiliser\nque des attaques\npendant 2 à 4 tours."

movedata MOVE_HELPING_HAND, "Coup d'Main"
    battleeffect MOVE_EFFECT_BOOST_ALLY_POWER_BY_50_PERCENT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_ALLY
    priority 5
    flags 0
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_HELPING_HAND, "Une capacité qui\naugmente la puissance\nd’attaque de l’allié\ndurant un Combat Duo."

movedata MOVE_TRICK, "Tour de Magie"
    battleeffect MOVE_EFFECT_SWITCH_HELD_ITEMS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_TRICK, "Le lanceur prend\nl’ennemi au dépourvu\net l’oblige à échanger\nson objet contre\nle sien."

movedata MOVE_ROLE_PLAY, "Imitation"
    battleeffect MOVE_EFFECT_COPY_ABILITY
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags 0
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_ROLE_PLAY, "Imite l’ennemi et\ncopie sa capacité\nspéciale."

movedata MOVE_WISH, "Vœu"
    battleeffect MOVE_EFFECT_HEAL_IN_3_TURNS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_WISH, "Un vœu qui permet\nde récupérer jusqu’à\nla moitié de ses PV\nmax au tour suivant."

movedata MOVE_ASSIST, "Assistance"
    battleeffect MOVE_EFFECT_USE_RANDOM_ALLY_MOVE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority 0
    flags FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_RANDOMIZE_NEXT_TURN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_ASSIST, "Le lanceur se dépêche\nd’utiliser une\ncapacité au hasard\nparmi celles des\nPokémon de l’équipe."

movedata MOVE_INGRAIN, "Racines"
    battleeffect MOVE_EFFECT_GROUND_TRAP_USER_CONTINUOUS_HEAL
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_INGRAIN, "Le lanceur plante ses\nracines et récupère\ndes PV à chaque tour.\nUne fois enraciné, il\nne peut plus fuir."

movedata MOVE_SUPERPOWER, "Surpuissance"
    battleeffect MOVE_EFFECT_USER_ATK_DEF_DOWN_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_FIGHTING
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SUPERPOWER, "Une attaque puissante\nmais qui baisse\nl’Attaque et la\nDéfense du lanceur."

movedata MOVE_MAGIC_COAT, "Reflet Magik"
    battleeffect MOVE_EFFECT_MAGIC_COAT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority 4
    flags FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MAGIC_COAT, "Une barrière qui \nrenvoie les capacités\ncomme Vampigraine et\ncelles affectant le\nstatut et les stats."

movedata MOVE_RECYCLE, "Recyclage"
    battleeffect MOVE_EFFECT_RECYCLE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_RECYCLE, "Recycle un objet à\nusage unique déjà\nutilisé lors du combat\npour pouvoir l’utiliser\nà nouveau."

movedata MOVE_REVENGE, "Vendetta"
    battleeffect MOVE_EFFECT_DOUBLE_DAMAGE_IF_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority -4
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_REVENGE, "Une attaque deux fois\nplus puissante\nsi le lanceur a été\nblessé par l’ennemi\ndurant ce tour."

movedata MOVE_BRICK_BREAK, "Casse-Brique"
    battleeffect MOVE_EFFECT_REMOVE_SCREENS
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_FIGHTING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BRICK_BREAK, "Une attaque avec la\nmain ou autre. Peut\nbriser les barrières\ncomme Mur Lumière\net Protection."

movedata MOVE_YAWN, "Bâillement"
    battleeffect MOVE_EFFECT_STATUS_SLEEP_NEXT_TURN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_YAWN, "Fait bâiller\nl’ennemi qui\ns’endort au tour\nsuivant."

movedata MOVE_KNOCK_OFF, "Sabotage"
    battleeffect MOVE_EFFECT_REMOVE_HELD_ITEM
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_DARK
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_KNOCK_OFF, "Le lanceur fait\ntomber l’objet tenu\npar l’ennemi pour\nle rendre inutilisable\ndurant le combat."

movedata MOVE_ENDEAVOR, "Effort"
    battleeffect MOVE_EFFECT_SET_HP_EQUAL_TO_USER
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ENDEAVOR, "Une attaque qui\nréduit les PV de\nl’ennemi au niveau\ndes PV du lanceur."

movedata MOVE_ERUPTION, "Éruption"
    battleeffect MOVE_EFFECT_DECREASE_POWER_WITH_LESS_USER_HP
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ERUPTION, "Le lanceur laisse\nexploser sa colère.\nPlus ses PV sont bas\net moins l’attaque est\npuissante."

movedata MOVE_SKILL_SWAP, "Échange"
    battleeffect MOVE_EFFECT_SWITCH_ABILITIES
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SKILL_SWAP, "Le lanceur utilise ses\npouvoirs psychiques\npour échanger sa\ncapacité spéciale\navec l’ennemi."

movedata MOVE_IMPRISON, "Possessif"
    battleeffect MOVE_EFFECT_MAKE_SHARED_MOVES_UNUSEABLE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_IMPRISON, "Si l’ennemi et le\nlanceur ont des\ncapacités en commun,\nl’ennemi ne pourra\npas les utiliser."

movedata MOVE_REFRESH, "Régénération"
    battleeffect MOVE_EFFECT_HEAL_STATUS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_REFRESH, "Le lanceur se\nrepose pour guérir\nd’un empoisonnement,\nd’une brûlure ou\nd’une paralysie."

movedata MOVE_GRUDGE, "Rancune"
    battleeffect MOVE_EFFECT_REMOVE_ALL_PP_ON_DEFEAT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GHOST
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_GRUDGE, "Si le lanceur est mis\nK.O., sa rancune\népuise les PP de la\ncapacité utilisée pour\nle mettre K.O."

movedata MOVE_SNATCH, "Saisie"
    battleeffect MOVE_EFFECT_STEAL_STATUS_MOVE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority 4
    flags FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SNATCH, "Le lanceur vole\nl’effet des capacités\nde soin ou de\nchangement de stats\nutilisées par l’ennemi."

movedata MOVE_SECRET_POWER, "Force Cachée"
    battleeffect MOVE_EFFECT_SECRET_POWER
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_RANDOMIZE_NEXT_TURN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SECRET_POWER, "Les effets de cette\nattaque varient en\nfonction de\nl’environnement."

movedata MOVE_DIVE, "Plongée"
    battleeffect MOVE_EFFECT_DIVE
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_WATER
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_UNIQUE_JUDGE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_DIVE, "Une attaque en 2\ntours. Le lanceur\nplonge sous l’eau au\n1¹ tour et frappe\nau 2⁴."

movedata MOVE_ARM_THRUST, "Cogne"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 15
    type TYPE_FIGHTING
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ARM_THRUST, "Un déluge de coups\nadressés avec la\npaume qui frappe de\n2 à 5 fois d’affilée."

movedata MOVE_CAMOUFLAGE, "Camouflage"
    battleeffect MOVE_EFFECT_CAMOUFLAGE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_CAMOUFLAGE, "Modifie le type du\nlanceur en fonction\ndu terrain, comme\nune berge, une\ngrotte, l’herbe, etc."

movedata MOVE_TAIL_GLOW, "Lumi-Queue"
    battleeffect MOVE_EFFECT_SP_ATK_UP_3
    pss SPLIT_STATUS
    basepower 0
    type TYPE_BUG
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH | FLAG_UNUSABLE_IN_GEN_8
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_TAIL_GLOW, "Le lanceur regarde\nun flash lumineux\nfixement. Augmente\nconsidérablement son\nAtq. Spé."

movedata MOVE_LUSTER_PURGE, "Lumi-Éclat"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_SPECIAL
    basepower 95
    type TYPE_PSYCHIC
    accuracy 100
    pp 5
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_LUSTER_PURGE, "Le lanceur libère un\néclair lumineux. Peut\naussi baisser la Déf.\nSpé. de l’ennemi."

movedata MOVE_MIST_BALL, "Ball'Brume"
    battleeffect MOVE_EFFECT_LOWER_SP_ATK_HIT
    pss SPLIT_SPECIAL
    basepower 95
    type TYPE_PSYCHIC
    accuracy 100
    pp 5
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_MIST_BALL, "Une bulle de brume\ninflige des dégâts à\nl’ennemi. Peut aussi\nréduire son Atq. Spé."

movedata MOVE_FEATHER_DANCE, "Danse Plumes"
    battleeffect MOVE_EFFECT_ATK_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FLYING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FEATHER_DANCE, "Une montagne de\nplumes ensevelit\nl’ennemi et réduit\nconsidérablement\nson Attaque."

movedata MOVE_TEETER_DANCE, "Danse Folle"
    battleeffect MOVE_EFFECT_CONFUSE_ALL_ADJACENT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_RANDOMIZE_NEXT_TURN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_TEETER_DANCE, "Danse qui rend confus\ntous les autres\nPokémon au combat."

movedata MOVE_BLAZE_KICK, "Pied Brûleur"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL_BURN_HIT
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_BLAZE_KICK, "Le lanceur envoie un\ncoup de pied à taux de\ncritiques élevé. Peut\naussi brûler la cible."

movedata MOVE_MUD_SPORT, "Lance-Boue"
    battleeffect MOVE_EFFECT_HALVE_ELECTRIC_DAMAGE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GROUND
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_MUD_SPORT, "Le lanceur se couvre\nde boue pour affaiblir\nles capacités Electrik\nquand il combat."

movedata MOVE_ICE_BALL, "Ball'Glace"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_EACH_TURN_LOCK_INTO
    pss SPLIT_PHYSICAL
    basepower 30
    type TYPE_ICE
    accuracy 90
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ICE_BALL, "Envoie une balle de\nglace pendant 5\ntours. L’attaque\ngagne en puissance\nà chaque coup."

movedata MOVE_NEEDLE_ARM, "Poing Dard"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_GRASS
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_NEEDLE_ARM, "Le lanceur attaque en\nfouettant l’ennemi de\nses bras épineux.\nPeut aussi l’apeurer."

movedata MOVE_SLACK_OFF, "Paresse"
    battleeffect MOVE_EFFECT_RESTORE_HALF_HP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SLACK_OFF, "Le lanceur se tourne\nles pouces et\nrécupère jusqu’à la\nmoitié de ses PV max."

movedata MOVE_HYPER_VOICE, "Mégaphone"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HYPER_VOICE, "Le lanceur pousse un\ncri dont l’écho\nterrifiant a le\npouvoir d’infliger des\ndégâts."

movedata MOVE_POISON_FANG, "Crochet Venin"
    battleeffect MOVE_EFFECT_BADLY_POISON_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_POISON
    accuracy 100
    pp 15
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_POISON_FANG, "Le lanceur mord\nl’ennemi de ses crocs\ntoxiques. Peut aussi\nl’empoisonner\ngravement."

movedata MOVE_CRUSH_CLAW, "Éclate Griffe"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CRUSH_CLAW, "Lacère l’ennemi avec\ndes griffes solides et\naiguisées. Peut aussi\nbaisser sa Défense."

movedata MOVE_BLAST_BURN, "Rafale Feu"
    battleeffect MOVE_EFFECT_RECHARGE_AFTER
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_BLAST_BURN, "Une explosion ardente\nsouffle l’adversaire.\nLe lanceur doit\nse reposer au\ntour suivant."

movedata MOVE_HYDRO_CANNON, "Hydroblast"
    battleeffect MOVE_EFFECT_RECHARGE_AFTER
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_WATER
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_HYDRO_CANNON, "Une trombe d’eau\nheurte l’ennemi.\nLe lanceur doit se\nreposer au tour\nsuivant."

movedata MOVE_METEOR_MASH, "Poing Météore"
    battleeffect MOVE_EFFECT_RAISE_ATTACK_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_STEEL
    accuracy 100
    pp 10
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_METEOR_MASH, "Un coup de poing lancé\nà la vitesse d’un\nmétéore. Peut aussi\naugmenter l’Attaque\ndu lanceur."

movedata MOVE_ASTONISH, "Étonnement"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 30
    type TYPE_GHOST
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_ASTONISH, "Le lanceur attaque\nl’ennemi en poussant\nun cri terrifiant.\nPeut aussi l’apeurer."

movedata MOVE_WEATHER_BALL, "Ball'Météo"
    battleeffect MOVE_EFFECT_CHANGE_TYPE_WITH_WEATHER
    pss SPLIT_SPECIAL
    basepower 50
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_WEATHER_BALL, "Une attaque dont la\npuissance et le type\nvarient en fonction\ndu temps qu’il fait."

movedata MOVE_AROMATHERAPY, "Aromathérapie"
    battleeffect MOVE_EFFECT_CURE_PARTY_STATUS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER_SIDE
    priority FLAG_UNUSABLE_IN_GEN_9
    flags FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_AROMATHERAPY, "Le lanceur libère un\nparfum apaisant qui\nguérit tous les\nproblèmes de\nstatut de l’équipe."

movedata MOVE_FAKE_TEARS, "Croco Larme"
    battleeffect MOVE_EFFECT_SP_DEF_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FAKE_TEARS, "Le lanceur fait \nsemblant de pleurer\npour troubler l’ennemi\net baisser fortement\nsa Déf. Spé."

movedata MOVE_AIR_CUTTER, "Tranch'Air"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_FLYING
    accuracy 100
    pp 25
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_AIR_CUTTER, "Le lanceur appelle\ndes vents tranchants\nqui lacèrent l’ennemi.\nTaux de critiques\nélevé."

movedata MOVE_OVERHEAT, "Surchauffe"
    battleeffect MOVE_EFFECT_USER_SP_ATK_DOWN_2
    pss SPLIT_SPECIAL
    basepower 130
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_OVERHEAT, "Attaque l’ennemi à\npleine puissance. Le\ncontrecoup baisse\nénormément l’Atq.\nSpé. du lanceur."

movedata MOVE_ODOR_SLEUTH, "Flair"
    battleeffect MOVE_EFFECT_IGNORE_EVASION_REMOVE_GHOST_IMMUNE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_ODOR_SLEUTH, "Permet de toucher un\nPokémon Spectre avec\nn’importe quelle capa-\ncité et de toucher un\nennemi insaisissable."

movedata MOVE_ROCK_TOMB, "Tomberoche"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_ROCK
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_NEXT_TURN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_ROCK_TOMB, "Des rochers frappent\nl’ennemi. Réduit aussi\nsa Vitesse en\nl’empêchant de\nse déplacer."

movedata MOVE_SILVER_WIND, "Vent Argenté"
    battleeffect MOVE_EFFECT_RAISE_ALL_STATS_HIT
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_BUG
    accuracy 100
    pp 5
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SILVER_WIND, "Vent qui projette des\nécailles poudreuses\nsur l’ennemi. Peut\naussi monter toutes\nles stats du lanceur."

movedata MOVE_METAL_SOUND, "Strido-Son"
    battleeffect MOVE_EFFECT_SP_DEF_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_STEEL
    accuracy 85
    pp 40
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_LOWER_VOLTAGES
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_METAL_SOUND, "Un cri horrible tel un\ncrissement métallique\nqui réduit fortement\nla Déf. Spé. de\nl’ennemi."

movedata MOVE_GRASS_WHISTLE, "Siffl'Herbe"
    battleeffect MOVE_EFFECT_STATUS_SLEEP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 55
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_GRASS_WHISTLE, "Le lanceur joue une\ndouce mélodie qui\nplonge l’ennemi dans\nun profond sommeil."

movedata MOVE_TICKLE, "Chatouille"
    battleeffect MOVE_EFFECT_ATK_DEF_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_TICKLE, "Le lanceur chatouille\nl’ennemi, ce qui baisse\nson Attaque et sa\nDéfense."

movedata MOVE_COSMIC_POWER, "Force Cosmique"
    battleeffect MOVE_EFFECT_DEF_SP_DEF_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_COSMIC_POWER, "Le lanceur absorbe un\npouvoir mystique\nspatial qui augmente\nsa Défense et\nsa Déf. Spé."

movedata MOVE_WATER_SPOUT, "Giclédo"
    battleeffect MOVE_EFFECT_DECREASE_POWER_WITH_LESS_USER_HP
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_WATER
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_WATER_SPOUT, "Le lanceur attaque\navec un jet d’eau.\nMoins il a de PV et\nmoins l’attaque est\npuissante."

movedata MOVE_SIGNAL_BEAM, "Rayon Signal"
    battleeffect MOVE_EFFECT_CONFUSE_HIT
    pss SPLIT_SPECIAL
    basepower 75
    type TYPE_BUG
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SIGNAL_BEAM, "Le lanceur projette\nun rayon de lumière\nsinistre. Peut aussi\nrendre l’ennemi\nconfus."

movedata MOVE_SHADOW_PUNCH, "Poing Ombre"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_GHOST
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SHADOW_PUNCH, "Le lanceur surgit des\nombres et donne un\ncoup de poing.\nN’échoue jamais."

movedata MOVE_EXTRASENSORY, "Extrasenseur"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_PSYCHIC
    accuracy 100
    pp 20
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_EXTRASENSORY, "Le lanceur attaque\navec un pouvoir\nétrange et invisible.\nPeut aussi apeurer\nl’ennemi."

movedata MOVE_SKY_UPPERCUT, "Stratopercut"
    battleeffect MOVE_EFFECT_HIT_FLY
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_FIGHTING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SKY_UPPERCUT, "Le lanceur attaque\navec un uppercut.\nIl envoie son poing\nvers le ciel de\ntoutes ses forces."

movedata MOVE_SAND_TOMB, "Tourbi-Sable"
    battleeffect MOVE_EFFECT_BIND_HIT
    pss SPLIT_PHYSICAL
    basepower 35
    type TYPE_GROUND
    accuracy 85
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SAND_TOMB, "Le lanceur emprisonne\nl’ennemi dans une\ntempête de sable\nterrifiante qui dure\nde 2 à 5 tours."

movedata MOVE_SHEER_COLD, "Glaciation"
    battleeffect MOVE_EFFECT_ONE_HIT_KO
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_ICE
    accuracy 30
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_ALL_SAME_JUDGE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SHEER_COLD, "Une vague de froid\nglacial frappe\nl’ennemi. S’il est\ntouché, il est mis\nK.O. sur le coup."

movedata MOVE_MUDDY_WATER, "Ocroupi"
    battleeffect MOVE_EFFECT_LOWER_ACCURACY_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_WATER
    accuracy 85
    pp 10
    effectchance 30
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_MUDDY_WATER, "Le lanceur attaque en\nprojetant de l’eau\nboueuse. Peut aussi\nréduire la précision\nde l’ennemi."

movedata MOVE_BULLET_SEED, "Balle Graine"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 25
    type TYPE_GRASS
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BULLET_SEED, "Le lanceur mitraille\nl’ennemi avec une\nrafale de graines.\nDe 2 à 5 rafales sont\nlancées à la suite."

movedata MOVE_AERIAL_ACE, "Aéropique"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FLYING
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_AERIAL_ACE, "Le lanceur prend\nl’ennemi de vitesse\net le lacère. N’échoue\njamais."

movedata MOVE_ICICLE_SPEAR, "Stalagtite"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 25
    type TYPE_ICE
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ICICLE_SPEAR, "Le lanceur jette des\npics de glace sur\nl’ennemi, de 2 à 5\nfois de suite."

movedata MOVE_IRON_DEFENSE, "Mur de Fer"
    battleeffect MOVE_EFFECT_DEF_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_STEEL
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_IRON_DEFENSE, "L’épiderme du lanceur\ndevient dur comme du\nfer, ce qui augmente\nconsidérablement\nsa Défense."

movedata MOVE_BLOCK, "Barrage"
    battleeffect MOVE_EFFECT_PREVENT_ESCAPE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_BLOCK, "Le lanceur bloque la\nroute de l’ennemi\npour empêcher sa\nfuite."

movedata MOVE_HOWL, "Grondement"
    battleeffect MOVE_EFFECT_ATK_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HOWL, "Le lanceur hurle pour\nse rassurer, ce qui\naugmente son\nAttaque."

movedata MOVE_DRAGON_CLAW, "Draco-Griffe"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_DRAGON
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRAGON_CLAW, "Le lanceur lacère\nl’ennemi de ses\ngrandes griffes\naiguisées."

movedata MOVE_FRENZY_PLANT, "Végé-Attaque"
    battleeffect MOVE_EFFECT_RECHARGE_AFTER
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_GRASS
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FRENZY_PLANT, "Un violent coup de\nracines s’abat sur\nl’ennemi. Immobilise\nle lanceur au tour\nsuivant."

movedata MOVE_BULK_UP, "Gonflette"
    battleeffect MOVE_EFFECT_ATK_DEF_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIGHTING
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_BULK_UP, "Le lanceur tend ses\nmuscles pour se\ngonfler, ce qui booste\nson Attaque et sa\nDéfense."

movedata MOVE_BOUNCE, "Rebond"
    battleeffect MOVE_EFFECT_BOUNCE
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_FLYING
    accuracy 85
    pp 5
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_UNIQUE_JUDGE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_BOUNCE, "Le lanceur bondit\ntrès haut et plonge\nsur l’ennemi au 2⁴\ntour. Peut aussi\nparalyser l’ennemi."

movedata MOVE_MUD_SHOT, "Tir de Boue"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_SPECIAL
    basepower 55
    type TYPE_GROUND
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_NEXT_TURN
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_MUD_SHOT, "Le lanceur attaque\nen projetant de la\nboue sur l’ennemi.\nRéduit aussi la\nVitesse de la cible."

movedata MOVE_POISON_TAIL, "Queue-Poison"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL_POISON_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_POISON
    accuracy 100
    pp 25
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_POISON_TAIL, "Attaque à taux de\ncritiques élevé.\nPeut aussi\nempoisonner l’ennemi."

movedata MOVE_COVET, "Implore"
    battleeffect MOVE_EFFECT_STEAL_HELD_ITEM
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_NORMAL
    accuracy 100
    pp 25
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_COVET, "Le lanceur s’approche\nde l’ennemi avec un\nair angélique afin\nde dérober l’objet\nqu’il tient."

movedata MOVE_VOLT_TACKLE, "Électacle"
    battleeffect MOVE_EFFECT_RECOIL_PARALYZE_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_ELECTRIC
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_VOLT_TACKLE, "Le lanceur électrifie\nson corps avant de\ncharger. Le choc\nblesse aussi beaucoup\nle lanceur."

movedata MOVE_MAGICAL_LEAF, "Feuille Magik"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_GRASS
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MAGICAL_LEAF, "Le lanceur disperse\nd’étranges feuilles\nqui poursuivent\nl’ennemi. N’échoue\njamais."

movedata MOVE_WATER_SPORT, "Tourniquet"
    battleeffect MOVE_EFFECT_HALVE_FIRE_DAMAGE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_WATER
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_WATER_SPORT, "Le lanceur s’asperge\nd’eau. Affaiblit les\ncapacités Feu quand\nle lanceur est au\ncombat."

movedata MOVE_CALM_MIND, "Plénitude"
    battleeffect MOVE_EFFECT_SP_ATK_SP_DEF_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_CALM_MIND, "Le lanceur se\nconcentre et fait le\nvide dans son esprit\npour monter son Atq.\nSpé. et sa Déf. Spé."

movedata MOVE_LEAF_BLADE, "Lame Feuille"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_GRASS
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LEAF_BLADE, "Une feuille coupante\nentaille l’ennemi. Taux\nde critiques élevé."

movedata MOVE_DRAGON_DANCE, "Danse Draco"
    battleeffect MOVE_EFFECT_ATK_SPEED_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DRAGON
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRAGON_DANCE, "Une danse mystique\ndont le rythme\neffréné augmente\nl’Attaque et la\nVitesse du lanceur."

movedata MOVE_ROCK_BLAST, "Boule Roc"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 25
    type TYPE_ROCK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ROCK_BLAST, "Le lanceur projette\nun rocher sur\nl’ennemi 2 à 5 fois\nd’affilée."

movedata MOVE_SHOCK_WAVE, "Onde de Choc"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_ELECTRIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SHOCK_WAVE, "Le lanceur envoie un\nchoc électrique rapide\nà l’ennemi. Impossible\nà esquiver."

movedata MOVE_WATER_PULSE, "Vibraqua"
    battleeffect MOVE_EFFECT_CONFUSE_HIT
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_WATER
    accuracy 100
    pp 20
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_WATER_PULSE, "Le lanceur envoie\nde puissants jets\nd’eau sur l’ennemi.\nPeut rendre l’ennemi\nconfus."

movedata MOVE_DOOM_DESIRE, "Vœu Destructeur"
    battleeffect MOVE_EFFECT_HIT_IN_3_TURNS
    pss SPLIT_SPECIAL
    basepower 140
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DOOM_DESIRE, "Le lanceur génère\nune sphère lumineuse\nqu’il projette sur\nl’ennemi 2 tours\nplus tard."

movedata MOVE_PSYCHO_BOOST, "Psycho-Boost"
    battleeffect MOVE_EFFECT_USER_SP_ATK_DOWN_2
    pss SPLIT_SPECIAL
    basepower 140
    type TYPE_PSYCHIC
    accuracy 100
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_PSYCHO_BOOST, "Le lanceur attaque\nà pleine puissance.\nLe contrecoup réduit\nconsidérablement\nson Atq. Spé."

movedata MOVE_ROOST, "Atterrissage"
    battleeffect MOVE_EFFECT_HEAL_HALF_REMOVE_FLYING_TYPE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FLYING
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ROOST, "Le lanceur atterrit\net se repose.\nRestaure jusqu’à la\nmoitié de ses PV\nmaximum."

movedata MOVE_GRAVITY, "Gravité"
    battleeffect MOVE_EFFECT_GRAVITY
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags 0
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_GRAVITY, "La gravité augmente\npendant 5 tours, ce\nqui empêche les\ncapacités volantes\net annule Lévitation."

movedata MOVE_MIRACLE_EYE, "Œil Miracle"
    battleeffect MOVE_EFFECT_IGNORE_EVATION_REMOVE_DARK_IMMUNE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_MIRACLE_EYE, "Permet de toucher un\nPokémon Ténèbres\navec toute capacité\net de toucher un\nennemi insaisissable."

movedata MOVE_WAKE_UP_SLAP, "Réveil Forcé"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_HEAL_SLEEP
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_WAKE_UP_SLAP, "Cette attaque inflige\nd’importants dégâts\nà un ennemi endormi.\nMais elle le réveille\négalement."

movedata MOVE_HAMMER_ARM, "Marto-Poing"
    battleeffect MOVE_EFFECT_USER_SPEED_DOWN_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_NEXT_TURN
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HAMMER_ARM, "Le lanceur lâche un\npuissant coup de poing\nsur l’ennemi. Mais\nréduit la Vitesse du\nlanceur."

movedata MOVE_GYRO_BALL, "Gyroballe"
    battleeffect MOVE_EFFECT_POWER_BASED_ON_LOW_SPEED
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_GYRO_BALL, "Le lanceur effectue\nune rotation et\nfrappe l’ennemi. Plus\nle lanceur est lent,\nplus il fait de dégâts."

movedata MOVE_HEALING_WISH, "Vœu Soin"
    battleeffect MOVE_EFFECT_FAINT_AND_FULL_HEAL_NEXT_MON
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_HEALING_WISH, "Le lanceur tombe\nK.O. pour soigner les\nPV et le statut du\nPokémon qui passe\naprès lui."

movedata MOVE_BRINE, "Saumure"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_WHEN_BELOW_HALF
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_WATER
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_BRINE, "Cette attaque est\ndeux fois plus\npuissante lorsque\nl’ennemi a moins de\nla moitié de ses PV."

movedata MOVE_NATURAL_GIFT, "Don Naturel"
    battleeffect MOVE_EFFECT_NATURAL_GIFT
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_NATURAL_GIFT, "Avant d’attaquer, le\nlanceur rassemble ses\nforces grâce à sa\nBaie. Elle détermine le\ntype et la puissance."

movedata MOVE_FEINT, "Ruse"
    battleeffect MOVE_EFFECT_REMOVE_PROTECT
    pss SPLIT_PHYSICAL
    basepower 30
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 2
    flags FLAG_MIRROR_MOVE
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FEINT, "Une attaque capable\nde toucher un ennemi\nqui utilise Détection\nou Abri. Annule aussi\nleur effet."

movedata MOVE_PLUCK, "Picore"
    battleeffect MOVE_EFFECT_EAT_BERRY
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FLYING
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_PLUCK, "Le lanceur picore\nl’ennemi. S’il tient\nune Baie, le lanceur\ns’en empare et\nprofite de ses effets."

movedata MOVE_TAILWIND, "Vent Arrière"
    battleeffect MOVE_EFFECT_DOUBLE_SPEED_3_TURNS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FLYING
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_TAILWIND, "Génère une rafale de\nvent qui augmente la\nVitesse des Pokémon\nde l’équipe pendant 3\ntours."

movedata MOVE_ACUPRESSURE, "Acupression"
    battleeffect MOVE_EFFECT_RANDOM_STAT_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET_USER_SIDE
    priority 0
    flags FLAG_KEEP_HP_BAR
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ACUPRESSURE, "Le lanceur effectue\ndes pressions pour\naugmenter\nfortement l’une\nde ses stats."

movedata MOVE_METAL_BURST, "Fulmifer"
    battleeffect MOVE_EFFECT_METAL_BURST
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_STEEL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_METAL_BURST, "Le lanceur attaque\nle dernier ennemi\nà l’avoir blessé en\nfrappant plus fort."

movedata MOVE_U_TURN, "Demi-Tour"
    battleeffect MOVE_EFFECT_SWITCH_HIT
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_BUG
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_U_TURN, "Après avoir attaqué,\nle lanceur change de\nplace avec un\nPokémon de l’équipe\nqui attend son tour."

movedata MOVE_CLOSE_COMBAT, "Close Combat"
    battleeffect MOVE_EFFECT_USER_DEF_SP_DEF_DOWN_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_FIGHTING
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_CLOSE_COMBAT, "Le lanceur combat au\ncorps à corps sans se\nprotéger. Baisse\naussi sa Défense et\nsa Déf. Spé."

movedata MOVE_PAYBACK, "Représailles"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_IF_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_UNIQUE_JUDGE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PAYBACK, "Le lanceur charge son\nénergie, puis attaque.\nLa puissance est\ndoublée si cela suit\nune capacité ennemie."

movedata MOVE_ASSURANCE, "Assurance"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_IF_TARGET_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ASSURANCE, "Cette attaque est\ndeux fois plus\nefficace si l’ennemi\na déjà été blessé\ndurant ce tour."

movedata MOVE_EMBARGO, "Embargo"
    battleeffect MOVE_EFFECT_PREVENT_ITEM_USE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_EMBARGO, "Empêche l’ennemi\nd’utiliser un objet\ntenu et son Dresseur\nd’utiliser un objet\nsur lui."

movedata MOVE_FLING, "Dégommage"
    battleeffect MOVE_EFFECT_FLING
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_FLING, "Le lanceur envoie\nl’objet qu’il tient sur\nl’ennemi. La puissance\net les effets\ndépendent de l’objet."

movedata MOVE_PSYCHO_SHIFT, "Échange Psy"
    battleeffect MOVE_EFFECT_TRANSFER_STATUS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PSYCHO_SHIFT, "Le lanceur transfère\nses problèmes de\nstatut à l’ennemi\ngrâce à son pouvoir\nde suggestion."

movedata MOVE_TRUMP_CARD, "Atout"
    battleeffect MOVE_EFFECT_HIGHER_POWER_WHEN_LOW_PP
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_NORMAL
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TRUMP_CARD, "Moins ce coup\npossède de PP,\nplus il est puissant."

movedata MOVE_HEAL_BLOCK, "Anti-Soin"
    battleeffect MOVE_EFFECT_PREVENT_HEALING
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_HEAL_BLOCK, "Le lanceur empêche\nl’ennemi d’utiliser des\ncapacités de\nrécupération de PV\npendant 5 tours."

movedata MOVE_WRING_OUT, "Essorage"
    battleeffect MOVE_EFFECT_INCREASE_POWER_WITH_MORE_HP
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_WRING_OUT, "Le lanceur essore\nl’ennemi. Plus\nl’ennemi a de PV,\nplus cette attaque\nest puissante."

movedata MOVE_POWER_TRICK, "Astuce Force"
    battleeffect MOVE_EFFECT_SWAP_ATK_DEF
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_POWER_TRICK, "Le lanceur utilise ses\npouvoirs psychiques\npour échanger sa\nstat Défense et sa\nstat Attaque."

movedata MOVE_GASTRO_ACID, "Suc Digestif"
    battleeffect MOVE_EFFECT_SUPRESS_ABILITY
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_GASTRO_ACID, "Le lanceur répand ses\nsucs digestifs sur\nl’ennemi. Le fluide\nneutralise la capacité\nspéciale de l’ennemi."

movedata MOVE_LUCKY_CHANT, "Air Veinard"
    battleeffect MOVE_EFFECT_PREVENT_CRITS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_LUCKY_CHANT, "Le lanceur envoie une\nincantation vers le\nciel pour empêcher\nl’ennemi d’effectuer\ndes coups critiques."

movedata MOVE_ME_FIRST, "Moi d'Abord"
    battleeffect MOVE_EFFECT_USE_MOVE_FIRST
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_FRONT
    priority 0
    flags FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_ME_FIRST, "Le lanceur vole la\ncapacité prévue\npar l’ennemi et\nl’utilise avec une\npuissance accrue."

movedata MOVE_COPYCAT, "Photocopie"
    battleeffect MOVE_EFFECT_USE_LAST_USED_MOVE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority 0
    flags 0
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_COPYCAT, "Le lanceur imite la\ndernière capacité\nemployée. Echoue\nsi aucune capacité\nn’a été utilisée."

movedata MOVE_POWER_SWAP, "Permuforce"
    battleeffect MOVE_EFFECT_SWAP_ATK_SP_ATK_STAT_CHANGES
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_POWER_SWAP, "Pouvoir qui échange\nles modifications de\nl’Atq. Spé. et de\nl’Attaque du lanceur\navec l’ennemi."

movedata MOVE_GUARD_SWAP, "Permugarde"
    battleeffect MOVE_EFFECT_SWAP_DEF_SP_DEF_STAT_CHANGES
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_GUARD_SWAP, "Pouvoir qui échange\nles modifications de\nla Déf. Spé. et de la\nDéfense avec\nl’ennemi."

movedata MOVE_PUNISHMENT, "Punition"
    battleeffect MOVE_EFFECT_INCREASE_POWER_WITH_MORE_STAT_UP
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_DARK
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_PUNISHMENT, "Plus l’ennemi a utilisé\ndes augmentations de\nstats et plus cette\ncapacité est\npuissante."

movedata MOVE_LAST_RESORT, "Dernier Recours"
    battleeffect MOVE_EFFECT_FAIL_IF_NOT_USED_ALL_OTHER_MOVES
    pss SPLIT_PHYSICAL
    basepower 140
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LATE_BOOST
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_LAST_RESORT, "Cette capacité ne\npeut être utilisée\nqu’après que le\nlanceur a utilisé\ntoutes les autres."

movedata MOVE_WORRY_SEED, "Soucigraine"
    battleeffect MOVE_EFFECT_SET_ABILITY_TO_INSOMNIA
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_WORRY_SEED, "Plante une graine sur\nl’ennemi qui le rend\nsoucieux et remplace\nsa capacité spéciale\npar Insomnia."

movedata MOVE_SUCKER_PUNCH, "Coup Bas"
    battleeffect MOVE_EFFECT_HIT_FIRST_IF_TARGET_ATTACKING
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_DARK
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SUCKER_PUNCH, "Permet au lanceur\nde frapper en\npremier. Echoue si\nl’ennemi ne prépare\npas une attaque."

movedata MOVE_TOXIC_SPIKES, "Pics Toxik"
    battleeffect MOVE_EFFECT_TOXIC_SPIKES
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_OPPONENT_SIDE
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MAGIC_COAT
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_TOXIC_SPIKES, "Lance des pics autour\nde l’ennemi. Ils\nempoisonnent les\nennemis qui entrent\nau combat."

movedata MOVE_HEART_SWAP, "Permucœur"
    battleeffect MOVE_EFFECT_SWAP_STAT_CHANGES
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HEART_SWAP, "Le lanceur utilise un\npouvoir psychique\npour échanger ses\nchangements de\nstats avec l’ennemi."

movedata MOVE_AQUA_RING, "Anneau Hydro"
    battleeffect MOVE_EFFECT_RESTORE_HP_EVERY_TURN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_WATER
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_AQUA_RING, "Un voile liquide\nenveloppe le lanceur.\nIl récupère des PV\nà chaque tour."

movedata MOVE_MAGNET_RISE, "Vol Magnétik"
    battleeffect MOVE_EFFECT_GIVE_GROUND_IMMUNITY
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ELECTRIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_MAGNET_RISE, "Le lanceur lévite en\nutilisant l’électricité\npour générer un\nchamp magnétique\ndurant 5 tours."

movedata MOVE_FLARE_BLITZ, "Boutefeu"
    battleeffect MOVE_EFFECT_RECOIL_BURN_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_FIRE
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FLARE_BLITZ, "Le lanceur s’embrase\navant de charger\nl’ennemi. Le choc\nblesse gravement\nle lanceur aussi."

movedata MOVE_FORCE_PALM, "Forte-Paume"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FORCE_PALM, "Une onde de choc\nfrappe l’ennemi.\nPeut aussi paralyser\nla cible."

movedata MOVE_AURA_SPHERE, "Aurasphère"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_FIGHTING
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_AURA_SPHERE, "Le lanceur dégage une\naura et projette de\nl’énergie. N’échoue\njamais."

movedata MOVE_ROCK_POLISH, "Poliroche"
    battleeffect MOVE_EFFECT_SPEED_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ROCK
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ROCK_POLISH, "Le lanceur polit son\ncorps pour diminuer sa\nrésistance au vent.\nAugmente fortement\nla Vitesse."

movedata MOVE_POISON_JAB, "Direct Toxik"
    battleeffect MOVE_EFFECT_POISON_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_POISON
    accuracy 100
    pp 20
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_POISON_JAB, "Attaque l’ennemi avec\nun tentacule ou un\nbras plein de poison.\nPeut aussi\nl’empoisonner."

movedata MOVE_DARK_PULSE, "Vibrobscur"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_DARK
    accuracy 100
    pp 15
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DARK_PULSE, "Le lanceur dégage une\nhorrible aura chargée\nd’idées noires. Peut\naussi apeurer\nl’ennemi."

movedata MOVE_NIGHT_SLASH, "Tranche-Nuit"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_DARK
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_NIGHT_SLASH, "Le lanceur lacère\nl’ennemi à la\npremière occasion.\nTaux de critiques\nélevé."

movedata MOVE_AQUA_TAIL, "Hydro-Queue"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_WATER
    accuracy 95
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_AQUA_TAIL, "Le lanceur attaque\nen balançant sa\nqueue comme une\nlame de fond en\npleine tempête."

movedata MOVE_SEED_BOMB, "Canon Graine"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_GRASS
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SEED_BOMB, "Le lanceur fait\npleuvoir un déluge\nde graines solides\nsur l’ennemi."

movedata MOVE_AIR_SLASH, "Lame d'Air"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_SPECIAL
    basepower 75
    type TYPE_FLYING
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_AIR_SLASH, "Le lanceur attaque\navec une lame d’air\nqui fend tout. Peut\naussi apeurer\nl’ennemi."

movedata MOVE_X_SCISSOR, "Plaie Croix"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_BUG
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_X_SCISSOR, "Le lanceur taillade\nl’ennemi en utilisant\nses faux ou ses\ngriffes comme une\npaire de ciseaux."

movedata MOVE_BUG_BUZZ, "Bourdon"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_BUG
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_BUG_BUZZ, "Le lanceur fait vibrer\nses ailes pour lancer\nune vague sonique.\nPeut aussi baisser la\nDéf. Spé. de l’ennemi."

movedata MOVE_DRAGON_PULSE, "Draco-Choc"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 85
    type TYPE_DRAGON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_DRAGON_PULSE, "Le lanceur ouvre la\nbouche pour envoyer\nune onde de choc\nqui frappe l’ennemi."

movedata MOVE_DRAGON_RUSH, "Draco-Charge"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_DRAGON
    accuracy 75
    pp 10
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRAGON_RUSH, "Le lanceur frappe\nl’ennemi d’un air\nmenaçant. Peut aussi\napeurer l’ennemi."

movedata MOVE_POWER_GEM, "Rayon Gemme"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_ROCK
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_POWER_GEM, "Le lanceur attaque\navec un rayon de\nlumière qui scintille\ncomme s’il était\ncomposé de gemmes."

movedata MOVE_DRAIN_PUNCH, "Vampi-Poing"
    battleeffect MOVE_EFFECT_RECOVER_HALF_DAMAGE_DEALT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_VOLTAGE_CHAIN_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_DRAIN_PUNCH, "Un coup de poing qui\ndraine l’énergie.\nConvertit la moitié\ndes dégâts infligés en\nPV pour le lanceur."

movedata MOVE_VACUUM_WAVE, "Onde Vide"
    battleeffect MOVE_EFFECT_PRIORITY_1
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_FIGHTING
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_VACUUM_WAVE, "Le lanceur agite son\npoing pour projeter\nune onde de vide.\nFrappe toujours en\npremier."

movedata MOVE_FOCUS_BLAST, "Exploforce"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_FIGHTING
    accuracy 70
    pp 5
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FOCUS_BLAST, "Le lanceur rassemble\nses forces et laisse\néclater son pouvoir.\nPeut aussi baisser la\nDéf. Spé. de l’ennemi."

movedata MOVE_ENERGY_BALL, "Éco-Sphère"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ENERGY_BALL, "Utilise les pouvoirs\nde la nature pour\nattaquer l’ennemi.\nPeut aussi baisser la\nDéf. Spé. de l’ennemi."

movedata MOVE_BRAVE_BIRD, "Rapace"
    battleeffect MOVE_EFFECT_RECOIL_THIRD
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_FLYING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_BRAVE_BIRD, "Le lanceur replie ses\nailes et charge en\nrase-mottes. Le\nlanceur subit de\ngraves dégâts aussi."

movedata MOVE_EARTH_POWER, "Telluriforce"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_EARTH_POWER, "Des éruptions\nvolcaniques ont\nlieu sous l’ennemi.\nPeut aussi baisser la\nDéf. Spé. de l’ennemi."

movedata MOVE_SWITCHEROO, "Passe-Passe"
    battleeffect MOVE_EFFECT_SWITCH_HELD_ITEMS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SWITCHEROO, "Le lanceur échange\nson objet avec celui\nde l’ennemi à une\nvitesse que l’œil a\ndu mal à suivre."

movedata MOVE_GIGA_IMPACT, "Giga Impact"
    battleeffect MOVE_EFFECT_RECHARGE_AFTER
    pss SPLIT_PHYSICAL
    basepower 150
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_GIGA_IMPACT, "Le lanceur charge\nl’ennemi de toute sa\npuissance. Il doit\nensuite se reposer\nau tour suivant."

movedata MOVE_NASTY_PLOT, "Machination"
    battleeffect MOVE_EFFECT_SP_ATK_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_NASTY_PLOT, "Stimule l’esprit par\nde mauvaises pensées.\nAugmente fortement\nl’Atq. Spé. du\nlanceur."

movedata MOVE_BULLET_PUNCH, "Pisto-Poing"
    battleeffect MOVE_EFFECT_PRIORITY_1
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_STEEL
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_BULLET_PUNCH, "Le lanceur envoie des\ncoups de poing aussi\nrapides que des balles\nde revolver. Frappe\ntoujours en premier."

movedata MOVE_AVALANCHE, "Avalanche"
    battleeffect MOVE_EFFECT_DOUBLE_DAMAGE_IF_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_ICE
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority -4
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_AVALANCHE, "Une attaque deux fois\nplus puissante si le\nlanceur a été blessé\npar l’ennemi durant le\ntour."

movedata MOVE_ICE_SHARD, "Éclats Glace"
    battleeffect MOVE_EFFECT_PRIORITY_1
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_ICE
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ICE_SHARD, "Le lanceur crée des\néclats de glace qu’il\nenvoie sur l’ennemi.\nFrappe toujours en\npremier."

movedata MOVE_SHADOW_CLAW, "Griffe Ombre"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_GHOST
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SHADOW_CLAW, "Attaque avec une\ngriffe puissante faite\nd’ombres. Taux de\ncritiques élevé."

movedata MOVE_THUNDER_FANG, "Crocs Éclair"
    battleeffect MOVE_EFFECT_FLINCH_PARALYZE_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_ELECTRIC
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_THUNDER_FANG, "Le lanceur utilise\nune morsure\nélectrifiée. Peut\naussi paralyser ou\napeurer l’ennemi."

movedata MOVE_ICE_FANG, "Crocs Givre"
    battleeffect MOVE_EFFECT_FLINCH_FREEZE_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_ICE
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ICE_FANG, "Le lanceur utilise\nune morsure\nglaciale. Peut aussi\ngeler ou apeurer\nl’ennemi."

movedata MOVE_FIRE_FANG, "Crocs Feu"
    battleeffect MOVE_EFFECT_FLINCH_BURN_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_FIRE
    accuracy 100
    pp 15
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FIRE_FANG, "Le lanceur utilise\nune morsure\nenflammée. Peut aussi\nbrûler ou apeurer\nl’ennemi."

movedata MOVE_SHADOW_SNEAK, "Ombre Portée"
    battleeffect MOVE_EFFECT_PRIORITY_1
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_GHOST
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SHADOW_SNEAK, "Le lanceur étend son\nombre pour frapper\npar-derrière. Frappe\ntoujours en premier."

movedata MOVE_MUD_BOMB, "Boue-Bombe"
    battleeffect MOVE_EFFECT_LOWER_ACCURACY_HIT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_GROUND
    accuracy 85
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_MUD_BOMB, "Le lanceur attaque à\nl’aide d’une boule de\nboue solidifiée. Peut\naussi baisser la\nprécision de l’ennemi."

movedata MOVE_PSYCHO_CUT, "Coupe Psycho"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_PSYCHIC
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PSYCHO_CUT, "Le lanceur entaille\nl’ennemi grâce à des\nlames faites de pou-\nvoir psychique. Taux\nde critiques élevé."

movedata MOVE_ZEN_HEADBUTT, "Psykoud'Boul"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_PSYCHIC
    accuracy 100
    pp 15
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ZEN_HEADBUTT, "Le lanceur concentre\nsa volonté et donne\nun coup de tête. Peut\naussi apeurer\nl’ennemi."

movedata MOVE_MIRROR_SHOT, "Miroi-Tir"
    battleeffect MOVE_EFFECT_LOWER_ACCURACY_HIT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_STEEL
    accuracy 85
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_MIRROR_SHOT, "Le corps poli du\nlanceur libère un\néclair d’énergie. Peut\naussi baisser la\nprécision de l’ennemi."

movedata MOVE_FLASH_CANNON, "Luminocanon"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_STEEL
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FLASH_CANNON, "Le lanceur concentre\nson énergie lumineuse\net la fait exploser.\nPeut aussi baisser la\nDéf. Spé. de l’ennemi."

movedata MOVE_ROCK_CLIMB, "Escalade"
    battleeffect MOVE_EFFECT_CONFUSE_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_NORMAL
    accuracy 85
    pp 20
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ROCK_CLIMB, "Charge pouvant\nrendre l’ennemi\nconfus. Permet aussi\nd’escalader des\nparois rocheuses."

movedata MOVE_DEFOG, "Anti-Brume"
    battleeffect MOVE_EFFECT_REMOVE_HAZARDS_SCREENS_EVA_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FLYING
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_DEFOG, "Diminue l’esquive de\nl’adversaire. Annule\naussi par exemple\nPicots ou Mur Lumière.\n"

movedata MOVE_TRICK_ROOM, "Distorsion"
    battleeffect MOVE_EFFECT_TRICK_ROOM
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_FIELD
    priority -7
    flags FLAG_MIRROR_MOVE
    appeal APPEAL_RANDOMIZE_NEXT_TURN
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_TRICK_ROOM, "Le lanceur crée une\nzone étrange où les\nPokémon les plus\nlents frappent en 1¹\npendant 5 tours."

movedata MOVE_DRACO_METEOR, "Draco-Météore"
    battleeffect MOVE_EFFECT_USER_SP_ATK_DOWN_2
    pss SPLIT_SPECIAL
    basepower 130
    type TYPE_DRAGON
    accuracy 100
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_DRACO_METEOR, "Le lanceur invoque\ndes comètes. Le\ncontrecoup réduit\nfortement son\nAtq. Spé."

movedata MOVE_DISCHARGE, "Coup d'Jus"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_ELECTRIC
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DISCHARGE, "Un flamboiement\nd’électricité frappe\ntous les autres\nPokémon au combat.\nPeut aussi paralyser."

movedata MOVE_LAVA_PLUME, "Ébullilave"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_FIRE
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_LAVA_PLUME, "Des boules de feu\ns’abattent sur tous\nles autres Pokémon au\ncombat. Peut aussi\nbrûler."

movedata MOVE_LEAF_STORM, "Tempête Verte"
    battleeffect MOVE_EFFECT_USER_SP_ATK_DOWN_2
    pss SPLIT_SPECIAL
    basepower 130
    type TYPE_GRASS
    accuracy 100
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_LEAF_STORM, "Invoque une tempête\nde feuilles acérées.\nLe contrecoup réduit\nfortement l’Atq.\nSpé. du lanceur."

movedata MOVE_POWER_WHIP, "Mégafouet"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_GRASS
    accuracy 85
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_POWER_WHIP, "Le lanceur fait\nvirevolter violemment\nses lianes ou ses\ntentacules pour\nfouetter l’ennemi."

movedata MOVE_ROCK_WRECKER, "Roc-Boulet"
    battleeffect MOVE_EFFECT_RECHARGE_AFTER
    pss SPLIT_PHYSICAL
    basepower 150
    type TYPE_ROCK
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ROCK_WRECKER, "Le lanceur attaque en\nprojetant un gros\nrocher sur l’ennemi.\nIl doit se reposer au\ntour suivant."

movedata MOVE_CROSS_POISON, "Poison Croix"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL_POISON_HIT
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_POISON
    accuracy 100
    pp 20
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CROSS_POISON, "Un coup tranchant qui\npeut empoisonner\nl’ennemi. Taux de\ncritiques élevé."

movedata MOVE_GUNK_SHOT, "Détricanon"
    battleeffect MOVE_EFFECT_POISON_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_POISON
    accuracy 80
    pp 5
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GUNK_SHOT, "Le lanceur envoie des\ndétritus sur l’ennemi.\nPeut aussi\nl’empoisonner."

movedata MOVE_IRON_HEAD, "Tête de Fer"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_STEEL
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_IRON_HEAD, "Le lanceur heurte\nl’ennemi avec sa tête\ndure comme de l’acier.\nPeut aussi apeurer\nl’ennemi."

movedata MOVE_MAGNET_BOMB, "Bombe Aimant"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_STEEL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_BASIC
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAGNET_BOMB, "Le lanceur projette\ndes bombes d’acier\nqui collent à l’ennemi.\nN’échoue jamais."

movedata MOVE_STONE_EDGE, "Lame de Roc"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_ROCK
    accuracy 80
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_STONE_EDGE, "Fait surgir des\npierres aiguisées sous\nl’ennemi. Taux de\ncritiques élevé."

movedata MOVE_CAPTIVATE, "Séduction"
    battleeffect MOVE_EFFECT_SP_ATK_DOWN_2_OPPOSITE_GENDER
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_CAPTIVATE, "Si l’ennemi est de\nsexe opposé au\nlanceur, il est séduit\net sa stat Atq. Spé.\nbaisse fortement."

movedata MOVE_STEALTH_ROCK, "Piège de Roc"
    battleeffect MOVE_EFFECT_STEALTH_ROCK
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ROCK
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_OPPONENT_SIDE
    priority 0
    flags FLAG_MAGIC_COAT
    appeal APPEAL_KEEP_VOLTAGE_DOWN
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STEALTH_ROCK, "Lance des pierres\nflottantes autour de\nl’ennemi, qui blessent\ntout ennemi entrant\nau combat."

movedata MOVE_GRASS_KNOT, "Nœud Herbe"
    battleeffect MOVE_EFFECT_INCREASE_POWER_WITH_WEIGHT
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_GRASS
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_GRASS_KNOT, "L’ennemi est piégé\ndans de l’herbe qui le\nfait trébucher. Plus\nil est lourd, plus il y\na de dégâts."

movedata MOVE_CHATTER, "Babil"
    battleeffect MOVE_EFFECT_CONFUSE_HIT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_FLYING
    accuracy 100
    pp 20
    effectchance DEBUG_NEEDS_TESTING ? 100 : 0 // always confuse
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_PITY_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_CHATTER, "Le lanceur envoie une\nonde musicale en\nrécitant des mots.\nPeut aussi rendre\nl’ennemi confus."

movedata MOVE_JUDGMENT, "Jugement"
    battleeffect MOVE_EFFECT_JUDGMENT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_RANDOMIZE_NEXT_TURN
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_JUDGMENT, "Le lanceur libère une\nmyriade de rayons de\nlumière. Le type\nvarie selon la Plaque\nque tient le lanceur."

movedata MOVE_BUG_BITE, "Piqûre"
    battleeffect MOVE_EFFECT_EAT_BERRY
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_BUG
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_STEAL_VOLTAGE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BUG_BITE, "Le lanceur pique\nl’ennemi. S’il tient\nune Baie, le lanceur\nla dévore et obtient\nson effet."

movedata MOVE_CHARGE_BEAM, "Rayon Chargé"
    battleeffect MOVE_EFFECT_RAISE_SP_ATK_HIT
    pss SPLIT_SPECIAL
    basepower 50
    type TYPE_ELECTRIC
    accuracy 100
    pp 10
    effectchance 70
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_CHARGE_BEAM, "Le lanceur tire un\nrayon chargé\nd’électricité. Peut\naussi augmenter son\nAtq. Spé."

movedata MOVE_WOOD_HAMMER, "Martobois"
    battleeffect MOVE_EFFECT_RECOIL_THIRD
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_GRASS
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_WOOD_HAMMER, "Le lanceur heurte\nl’ennemi de son corps\nrobuste. Inflige de\nsérieux dégâts au\nlanceur aussi."

movedata MOVE_AQUA_JET, "Aqua-Jet"
    battleeffect MOVE_EFFECT_PRIORITY_1
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_WATER
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_FIRST_NEXT_TURN
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_AQUA_JET, "Le lanceur se\npropulse sur l’eau à\nune vitesse telle qu’il\ndevient invisible.\nFrappe en premier."

movedata MOVE_ATTACK_ORDER, "Appel Attak"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_BUG
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_ATTACK_ORDER, "Le lanceur appelle ses\nsous-fifres pour\nfrapper l’ennemi. \nTaux de critiques\nélevé."

movedata MOVE_DEFEND_ORDER, "Appel Défense"
    battleeffect MOVE_EFFECT_DEF_SP_DEF_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_BUG
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_DEFEND_ORDER, "Le lanceur appelle\nses sous-fifres pour\nformer un bouclier qui\naugmente sa Défense\net sa Déf. Spé."

movedata MOVE_HEAL_ORDER, "Appel Soins"
    battleeffect MOVE_EFFECT_RESTORE_HALF_HP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_BUG
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_HEAL_ORDER, "Le lanceur appelle ses\nsous-fifres pour le\nsoigner. Il récupère\njusqu’à la moitié \nde ses PV max."

movedata MOVE_HEAD_SMASH, "Fracass'Tête"
    battleeffect MOVE_EFFECT_RECOIL_HALF
    pss SPLIT_PHYSICAL
    basepower 150
    type TYPE_ROCK
    accuracy 80
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_HEAD_SMASH, "Le lanceur assène\nun coup de tête\ndésespéré. Blesse\naussi gravement le\nlanceur."

movedata MOVE_DOUBLE_HIT, "Coup Double"
    battleeffect MOVE_EFFECT_HIT_TWICE
    pss SPLIT_PHYSICAL
    basepower 35
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_DOUBLE_HIT, "Un coup de queue qui\nfrappe l’ennemi deux\nfois d’affilée."

movedata MOVE_ROAR_OF_TIME, "Hurle-Temps"
    battleeffect MOVE_EFFECT_RECHARGE_AFTER
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_DRAGON
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ROAR_OF_TIME, "Le lanceur frappe\nsi fort qu’il affecte\nle cours du temps.\nIl se repose au\ntour suivant."

movedata MOVE_SPACIAL_REND, "Spatio-Rift"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_DRAGON
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_VOLTAGE_HEARTS
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SPACIAL_REND, "Le lanceur déchire\nl’ennemi et l’espace\nautour de lui. Taux\nde critiques élevé."

movedata MOVE_LUNAR_DANCE, "Danse Lune"
    battleeffect MOVE_EFFECT_FAINT_FULL_RESTORE_NEXT_MON
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_SNATCH
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_LUNAR_DANCE, "Le lanceur tombe\nK.O. pour soigner le\nstatut et les PV du\nPokémon qui passe\naprès lui."

movedata MOVE_CRUSH_GRIP, "Presse"
    battleeffect MOVE_EFFECT_INCREASE_POWER_WITH_MORE_HP
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_CONTACT
    appeal APPEAL_DOUBLE_ON_FINALE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_CRUSH_GRIP, "Une force puissante\nécrase l’ennemi. Plus\nil lui reste de PV et\nplus l’attaque est\npuissante."

movedata MOVE_MAGMA_STORM, "Vortex Magma"
    battleeffect MOVE_EFFECT_BIND_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_FIRE
    accuracy 75
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_SUCCESSIVE
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_MAGMA_STORM, "L’ennemi est pris\ndans un tourbillon\nde feu qui dure de\n2 à 5 tours."

movedata MOVE_DARK_VOID, "Trou Noir"
    battleeffect MOVE_EFFECT_STATUS_SLEEP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 50
    pp 10
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8
    appeal APPEAL_KEEP_VOLTAGE_UP
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_DARK_VOID, "L’ennemi est plongé\ndans les ténèbres. Il\ntombe dans un\nprofond sommeil."

movedata MOVE_SEED_FLARE, "Fulmigraine"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_2_HIT
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_GRASS
    accuracy 85
    pp 5
    effectchance 40
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_HIDE_SHADOW | FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SEED_FLARE, "Le corps du lanceur\német une onde de\nchoc. Peut aussi\nbaisser la Déf. Spé.\nde la cible."

movedata MOVE_OMINOUS_WIND, "Vent Mauvais"
    battleeffect MOVE_EFFECT_RAISE_ALL_STATS_HIT
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_GHOST
    accuracy 100
    pp 5
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal APPEAL_DOUBLE_NEXT_SCORE
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_OMINOUS_WIND, "Le lanceur crée une\nviolente bourrasque.\nPeut aussi augmenter\ntoutes ses stats."

movedata MOVE_SHADOW_FORCE, "Revenant"
    battleeffect MOVE_EFFECT_SHADOW_FORCE
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_GHOST
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal APPEAL_AFTER_MAX_VOLTAGE_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SHADOW_FORCE, "Le lanceur disparaît\net frappe l’ennemi au\nsecond tour.\nFonctionne même si\nl’ennemi utilise Abri."

movedata MOVE_468, "MOVE_468"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LOW_VOLTAGE_BOOST
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SHADOW_FORCE+1, "--"

movedata MOVE_469, "MOVE_469"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_FIRST_HEARTS
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SHADOW_FORCE+2, "--"

movedata MOVE_470, "MOVE_470"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT
    appeal APPEAL_LAST_HEARTS
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SHADOW_FORCE+3, "--"

// Moves introduced in Generation V:
movedata MOVE_HONE_CLAWS, "Aiguisage"
    battleeffect MOVE_EFFECT_ATK_ACC_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_HONE_CLAWS, "Le lanceur s’aiguise\nles griffes.\nAugmente l’Attaque\net la Précision."

movedata MOVE_WIDE_GUARD, "Garde Large"
    battleeffect MOVE_EFFECT_PROTECT_USER_SIDE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ROCK
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER_SIDE
    priority 3
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_WIDE_GUARD, "Bloque les attaques\nvisant tous les alliés\npendant un tour."

movedata MOVE_GUARD_SPLIT, "Partage Garde"
    battleeffect MOVE_EFFECT_GUARD_SPLIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_GUARD_SPLIT, "Additionne la Défense\net la Défense Spéciale\ndu lanceur et de sa\ncible et les redistribue\nentre les deux."

movedata MOVE_POWER_SPLIT, "Partage Force"
    battleeffect MOVE_EFFECT_POWER_SPLIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_POWER_SPLIT, "Additionne l’Attaque\nSpéciale et l’Attaque\ndu lanceur et de sa\ncible et les redistribue\nentre les deux."

movedata MOVE_WONDER_ROOM, "Zone Étrange"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_WONDER_ROOM, "Le lanceur crée une\nzone mystérieuse où\nla Défense et la Défense\nSpéciale sont inversées\npendant cinq tours."

movedata MOVE_PSYSHOCK, "Choc Psy"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_PSYSHOCK, "Le lanceur matérialise\ndes ondes mystérieuses\nqu’il projette sur la cible,\nce qui inflige des dégâts\nphysiques à celle-ci."

movedata MOVE_VENOSHOCK, "Choc Venin"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_ON_POISONED
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_POISON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_VENOSHOCK, "Le lanceur asperge la\ncible d’un poison\nspécial. La puissance\nest doublée si la\ncible est empoisonnée."

movedata MOVE_AUTOTOMIZE, "Allègement"
    battleeffect MOVE_EFFECT_AUTOTOMIZE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_AUTOTOMIZE, "Le lanceur diminue\nson poids et\naugmente beaucoup\nsa Vitesse."

movedata MOVE_RAGE_POWDER, "Poudre Fureur"
    battleeffect MOVE_EFFECT_MAKE_GLOBAL_TARGET
    pss SPLIT_STATUS
    basepower 0
    type TYPE_BUG
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_USER
    priority 2
    flags 0
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_RAGE_POWDER, "Le lanceur s’asperge\nd’une poudre irritante\npour attirer l’attention\net diriger toutes les at-\ntaques ennemies sur lui."

movedata MOVE_TELEKINESIS, "Lévikinésie"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_TELEKINESIS, "Un pouvoir qui fait\nflotter l'ennemi dans\nles airs. Pendant 3\ntours, il devient plus\nfacile à atteindre."

movedata MOVE_MAGIC_ROOM, "Zone Magique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_MAGIC_ROOM, "Le lanceur crée une\nzone mystérieuse où\nles objets tenus n’ont\nplus aucun effet\npendant cinq tours."

movedata MOVE_SMACK_DOWN, "Anti-Air"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_ROCK
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SMACK_DOWN, "Le lanceur jette un\nprojectile sur la\ncible. Si cette der\n-nière vole, elle\ntombe au sol."

movedata MOVE_STORM_THROW, "Yama Arashi"
    battleeffect MOVE_EFFECT_ALWAYS_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STORM_THROW, "Un coup très puissant\ndont l’effet est toujours\ncritique."

movedata MOVE_FLAME_BURST, "Rebondifeu"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 70
    type TYPE_FIRE
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FLAME_BURST, "Quand l'attaque atteint\nsa cible, elle projette\ndes flammes qui\ntouchent tout ennemi\nsitué à côté."

movedata MOVE_SLUDGE_WAVE, "Cradovague"
    battleeffect MOVE_EFFECT_POISON_HIT
    pss SPLIT_SPECIAL
    basepower 95
    type TYPE_POISON
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SLUDGE_WAVE, "Une vague de détritus\nattaque tous les\nPokémon autour du\nlanceur. Peut aussi\nempoisonner."

movedata MOVE_QUIVER_DANCE, "Papillodanse"
    battleeffect MOVE_EFFECT_SP_ATK_SP_DEF_SPEED_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_BUG
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_QUIVER_DANCE, "Une danse mystique\ndont le rythme parfait\naugmente l’Atk. Spé.,\nla Déf. Spé. et la\nVitesse du lanceur."

movedata MOVE_HEAVY_SLAM, "Tacle Lourd"
    battleeffect MOVE_EFFECT_HEAVY_SLAM
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_STEEL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_HEAVY_SLAM, "Plus le lanceur est\nlourd par rapport à\nla cible, plus la\npuissance de cette\ncapacité augmente."

movedata MOVE_SYNCHRONOISE, "Synchropeine"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SYNCHRONOISE, "Des ondes mystéri-\neuses blessent tous\nles Pokémon alentour\nqui sont du même\ntype que le lanceur."

movedata MOVE_ELECTRO_BALL, "Boule Élek"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_ELECTRIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ELECTRO_BALL, "Plus la Vitesse du\nlanceur est élevée par\nrapport à celle de la\ncible, plus la puissance\nde la capacité augmente."

movedata MOVE_SOAK, "Détrempage"
    battleeffect MOVE_EFFECT_CHANGE_TO_WATER_TYPE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_WATER
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SOAK, "Le lanceur projette\nbeaucoup d’eau sur\nsa cible, qui devient\nde type Eau."

movedata MOVE_FLAME_CHARGE, "Nitrocharge"
    battleeffect MOVE_EFFECT_RAISE_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_FIRE
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_CONTACT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FLAME_CHARGE, "Le lanceur s’entoure\nde flammes pour at-\ntaquer la cible. Il se\nconcentre et sa\nVitesse augmente."

movedata MOVE_COIL, "Enroulement"
    battleeffect MOVE_EFFECT_ATK_DEF_ACC_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_COIL, "Le lanceur s’enroule\nsur lui-même et se\nconcentre. Son\nAttaque, sa Défense et\nsa Précision augmentent."

movedata MOVE_LOW_SWEEP, "Balayette"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_FIGHTING
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_LOW_SWEEP, "Un coup rapide qui\naffecte la mobilité\nde la cible et diminue\nsa Vitesse."

movedata MOVE_ACID_SPRAY, "Bombe Acide"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_2_HIT
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_POISON
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ACID_SPRAY, "Le lanceur projette\nun liquide acide qui\nfait fondre la cible.\nDiminue beaucoup la\nDéf. Spé. de celle-ci."

movedata MOVE_FOUL_PLAY, "Tricherie"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 95
    type TYPE_DARK
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FOUL_PLAY, "Le lanceur utilise la\nforce de la cible. Plus\nl’Attaque de celle-ci\nest élevée, plus le lan-\nceur inflige de dégâts."

movedata MOVE_SIMPLE_BEAM, "Rayon Simple"
    battleeffect MOVE_EFFECT_SET_ABILITY_TO_SIMPLE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_SIMPLE_BEAM, "Le lanceur envoie des\nondes mystérieuses\nà la cible, dont le talent\nest remplacé par le\ntalent Simple."

movedata MOVE_ENTRAINMENT, "Ten-Danse"
    battleeffect MOVE_EFFECT_ENTRAINMENT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_ENTRAINMENT, "Le lanceur danse sur\nun rythme étrange. Il\nforce sa cible à l’imiter,\nce qui lui fait adopter\nson talent."

movedata MOVE_AFTER_YOU, "Après Vous"
    battleeffect MOVE_EFFECT_AFTER_YOU
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_AFTER_YOU, "S’il est le premier à\nagir, le lanceur permet\nà sa cible d’utiliser une\ncapacité juste après lui."

movedata MOVE_ROUND, "Chant Canon"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ROUND, "Si plusieurs Pokémon\ndéclenchent cette\nattaque à la suite, la\npuissance augmente."

movedata MOVE_ECHOED_VOICE, "Écho"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ECHOED_VOICE, "Si le lanceur ou\nd’autres Pokémon\nutilisent cette capacité\nà chaque tour, la puis-\nsance augmente."

movedata MOVE_CHIP_AWAY, "Attrition"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_NORMAL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_CHIP_AWAY, "Une attaque puissante\nquand l'ennemi baisse sa\ngarde. Inflige des dégâts\nsans tenir compte des\nchangements de stats."

movedata MOVE_CLEAR_SMOG, "Bain de Smog"
    battleeffect MOVE_EFFECT_CLEAR_SMOG
    pss SPLIT_SPECIAL
    basepower 50
    type TYPE_POISON
    accuracy 0
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_CLEAR_SMOG, "Le lanceur projette\nde la boue bizarre sur\nla cible. Les change-\nments de stats de la\ncible sont annulés."

movedata MOVE_STORED_POWER, "Force Ajoutée"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 20
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_STORED_POWER, "Plus les stats du lan-\nceur sont augmentées,\nplus la puissance de\ncette capacité augmente."

movedata MOVE_QUICK_GUARD, "Prévention"
    battleeffect MOVE_EFFECT_PROTECT_USER_SIDE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIGHTING
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_USER_SIDE
    priority 3
    flags FLAG_SNATCH
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_QUICK_GUARD, "Protège le lanceur\net ses alliés des\nattaques prioritaires."

movedata MOVE_ALLY_SWITCH, "Interversion"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_USER
    priority 2
    flags FLAG_KEEP_HP_BAR
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_ALLY_SWITCH, "Il échange sa place\navec celle d’un allié\nsur le terrain. Peut\néchouer si utilisée\nplusieurs fois de suite."

movedata MOVE_SCALD, "Ébullition"
    battleeffect MOVE_EFFECT_THAW_AND_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_WATER
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SCALD, "Le lanceur projette\nun jet d’eau bouil-\nlante sur la cible,\nce qui peut aussi\nla brûler."

movedata MOVE_SHELL_SMASH, "Exuviation"
    battleeffect MOVE_EFFECT_ATK_SP_ATK_SPEED_UP_2_DEF_SP_DEF_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SHELL_SMASH, "Le lanceur brise sa car-\napace. Il baisse sa Déf.\net sa Déf. Spé., mais aug-\nmente beaucoup son Atk.,\nson Atk. Spé. et sa Vitesse."

movedata MOVE_HEAL_PULSE, "Vibra Soin"
    battleeffect MOVE_EFFECT_HEAL_TARGET
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_HEAL_PULSE, "Le lanceur projette\nune aura de bien-être\nqui fait récupérer la\nmoitié de ses PV max\nà la cible."

movedata MOVE_HEX, "Châtiment"
    battleeffect MOVE_EFFECT_DOUBLE_DAMAGE_ON_STATUS
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_GHOST
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_HEX, "Une attaque acharnée\nqui cause davantage\nde dégâts à la cible si\nelle a une altération\nde statut."

movedata MOVE_SKY_DROP, "Chute Libre"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FLYING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SKY_DROP, "Le lanceur emmène\nl'ennemi dans les airs\nau 1er tour et le\nlâche dans le vide\nau 2e."

movedata MOVE_SHIFT_GEAR, "Chgt Vitesse"
    battleeffect MOVE_EFFECT_SPEED_UP_2_ATK_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_STEEL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_SHIFT_GEAR, "Le lanceur fait tourner\nses engrenages. Cela\naugmente son Atk.\net augmente beaucoup\nsa Vitesse."

movedata MOVE_CIRCLE_THROW, "Projection"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority -6
    flags FLAG_KEEP_HP_BAR | FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CIRCLE_THROW, "Le lanceur fait une\nprojection sur un\nPokémon ennemi\net le remplace par\nun autre."

movedata MOVE_INCINERATE, "Calcination"
    battleeffect MOVE_EFFECT_INCINERATE
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_FIRE
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_INCINERATE, "Si la cible tient\nun objet, une Baie\npar exemple, celui-ci\nest brûlé et devient\ninutilisable."

movedata MOVE_QUASH, "À la Queue"
    battleeffect MOVE_EFFECT_QUASH
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_QUASH, "Retient la cible de\nforce, l’obligeant à\nagir en dernier."

movedata MOVE_ACROBATICS, "Acrobatie"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_WITHOUT_ITEM
    pss SPLIT_PHYSICAL
    basepower 55
    type TYPE_FLYING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ACROBATICS, "Le lanceur frappe la\ncible avec agilité. S’il\nne tient pas d’objet,\nl’attaque inflige dav-\nantage de dégâts."

movedata MOVE_REFLECT_TYPE, "Copie-Type"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_REFLECT_TYPE, "Le lanceur adopte\nle même type que\nla cible."

movedata MOVE_RETALIATE, "Vengeance"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RETALIATE, "Si un Pokémon de\nl’équipe a été mis\nK.O. au tour d’avant,\nla puissance augmente."

movedata MOVE_FINAL_GAMBIT, "Tout ou Rien"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_FIGHTING
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_FINAL_GAMBIT, "Le lanceur perd tous\nses PV restants et\ninflige autant de\ndégâts à la cible."

movedata MOVE_BESTOW, "Passe-Cadeau"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_BESTOW, "Si la cible ne tient\npas d'objet, le\nlanceur lui donne\nl'objet qu'il tient."

movedata MOVE_INFERNO, "Feu d'Enfer"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_FIRE
    accuracy 50
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_INFERNO, "La cible est entourée\nd’un torrent de\nflammes ardentes\nqui la brûlent."

movedata MOVE_WATER_PLEDGE, "Aire d'Eau"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_WATER
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_WATER_PLEDGE, "Si cette capacité est\nutilisée en même temps\nqu’Aire de Feu, la puis-\nsance augmente et un\narc-en-ciel apparaît."

movedata MOVE_FIRE_PLEDGE, "Aire de Feu"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FIRE_PLEDGE, "Si cette capacité est\nutilisée en même temps\nqu’Aire d’Herbe, la puis-\nsance augmente et une\nmer de feu apparaît."

movedata MOVE_GRASS_PLEDGE, "Aire d'Herbe"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_GRASS_PLEDGE, "Si cette capacité est\nutilisée en même temps\nqu’Aire d’Eau, la puis-\nsance augmente et un\nmarécage apparaît."

movedata MOVE_VOLT_SWITCH, "Change Éclair"
    battleeffect MOVE_EFFECT_SWITCH_HIT
    pss SPLIT_SPECIAL
    basepower 70
    type TYPE_ELECTRIC
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_VOLT_SWITCH, "Le lanceur revient\nà toute vitesse et\nchange de place\navec un Pokémon\nde l’équipe."

movedata MOVE_STRUGGLE_BUG, "Survinsecte"
    battleeffect MOVE_EFFECT_LOWER_SP_ATK_HIT
    pss SPLIT_SPECIAL
    basepower 50
    type TYPE_BUG
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_STRUGGLE_BUG, "Le lanceur frappe\nen se débattant de\ntoutes ses forces,\net baisse l’Atk. Spé.\nde la cible."

movedata MOVE_BULLDOZE, "Piétisol"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_GROUND
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BULLDOZE, "Le lanceur piétine\nle sol et inflige des\ndégâts à tous les\nPokémon. Baisse\naussi leur Vitesse."

movedata MOVE_FROST_BREATH, "Souffle Glacé"
    battleeffect MOVE_EFFECT_ALWAYS_CRITICAL
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_ICE
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FROST_BREATH, "Un souffle froid\nblesse la cible.\nL’effet est toujours\ncritique."

movedata MOVE_DRAGON_TAIL, "Draco-Queue"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_DRAGON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority -6
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_DRAGON_TAIL, "Le lanceur\nblesse la cible et\nl’envoie au loin."

movedata MOVE_WORK_UP, "Rengorgement"
    battleeffect MOVE_EFFECT_ATK_SP_ATK_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_SNATCH
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_WORK_UP, "Le lanceur se ren-\ngorge et augmente\nson Attaque et son\nAttaque Spéciale."

movedata MOVE_ELECTROWEB, "Toile Élek"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_SPECIAL
    basepower 55
    type TYPE_ELECTRIC
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ELECTROWEB, "Le lanceur attaque\nla cible en l’attrapant\ndans un filet élec-\ntrique. Baisse aussi\nla Vitesse de la cible."

movedata MOVE_WILD_CHARGE, "Éclair Fou"
    battleeffect MOVE_EFFECT_RECOIL_THIRD
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_ELECTRIC
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_WILD_CHARGE, "Une charge élec-\ntrique violente qui\nblesse aussi légère-\nment le lanceur."

movedata MOVE_DRILL_RUN, "Tunnelier"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_DRILL_RUN, "Le lanceur tourne\nsur lui-même comme\nune perceuse et se jette\nsur la cible. Taux de\ncritiques élevé."

movedata MOVE_DUAL_CHOP, "Double Baffe"
    battleeffect MOVE_EFFECT_HIT_TWICE
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_DRAGON
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_DUAL_CHOP, "Le lanceur frappe\nl'ennemi deux fois\nd'affilée avec les\nparties les plus rob-\nustes de son corps."

movedata MOVE_HEART_STAMP, "Crèvecœur"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_PSYCHIC
    accuracy 100
    pp 25
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_HEART_STAMP, "Déconcentre l'ennemi\navec des mouvements\nmignons avant de le\nfrapper violemment.\nPeut apeurer l'ennemi."

movedata MOVE_HORN_LEECH, "Encornebois"
    battleeffect MOVE_EFFECT_RECOVER_HALF_DAMAGE_DEALT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_HORN_LEECH, "Un coup de cornes\nqui draine l’énergie\nde la cible."

movedata MOVE_SACRED_SWORD, "Lame Sainte"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_FIGHTING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SACRED_SWORD, "Un violent coup d’épée\nqui lacère la cible et lui\ninflige des dégâts en\nignorant ses change-\nments de stats."

movedata MOVE_RAZOR_SHELL, "Coqui-Lame"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_WATER
    accuracy 100
    pp 10
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RAZOR_SHELL, "Un coquillage\naiguisé lacère la\ncible et peut aussi\nbaisser sa Défense."

movedata MOVE_HEAT_CRASH, "Tacle Feu"
    battleeffect MOVE_EFFECT_HEAVY_SLAM
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_HEAT_CRASH, "Plus le lanceur est\nlourd par rapport à\nla cible, plus la puis-\nsance de cette\ncapacité augmente."

movedata MOVE_LEAF_TORNADO, "Phytomixeur"
    battleeffect MOVE_EFFECT_LOWER_ACCURACY_HIT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LEAF_TORNADO, "L'ennemi est pris\ndans un tourbillon de\nfeuilles acérées. Peut\naussi baisser la Pré-\ncision de l'ennemi."

movedata MOVE_STEAMROLLER, "Bulldoboule"
    battleeffect MOVE_EFFECT_FLINCH_MINIMIZE_DOUBLE_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_BUG
    accuracy 100
    pp 20
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_STEAMROLLER, "Le lanceur se roule\nen boule et écrase\nson ennemi. Peut\naussi apeurer\nl'ennemi."

movedata MOVE_COTTON_GUARD, "Cotogarde"
    battleeffect MOVE_EFFECT_DEF_UP_3
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_SNATCH
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_COTTON_GUARD, "Le lanceur se pro-\ntège en s’emmitou-\nflant dans du coton.\nSa Défense aug-\nmente énormément."

movedata MOVE_NIGHT_DAZE, "Explonuit"
    battleeffect MOVE_EFFECT_LOWER_ACCURACY_HIT
    pss SPLIT_SPECIAL
    basepower 85
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 40
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_NIGHT_DAZE, "Le lanceur attaque\navec une onde de\nchoc ténébreuse.\nPeut aussi baisser\nla Précision de la cible."

movedata MOVE_PSYSTRIKE, "Frappe Psy"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PSYSTRIKE, "Inflige des dégâts\nphysiques à la cible\ngrâce à des ondes\nmystérieuses."

movedata MOVE_TAIL_SLAP, "Plumo-Queue"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_PHYSICAL
    basepower 25
    type TYPE_NORMAL
    accuracy 85
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_TAIL_SLAP, "Le lanceur frappe la\ncible de deux à cinq\nfois d’affilée avec\nsa queue robuste."

movedata MOVE_HURRICANE, "Vent Violent"
    battleeffect MOVE_EFFECT_HURRICANE // Accuracy in rain & sun handled in other_battle_calculators.c.
    pss SPLIT_SPECIAL
    basepower 110
    type TYPE_FLYING
    accuracy 70
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_HURRICANE, "Le lanceur déclenche\nune tempête de vents\nviolents qui s’abat sur\nla cible, et peut aussi\nla rendre confuse."

movedata MOVE_HEAD_CHARGE, "Peignée"
    battleeffect MOVE_EFFECT_RECOIL_THIRD
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_HEAD_CHARGE, "Le lanceur donne un\ncoup avec sa tête\ncouronnée d’une fière\ncrinière. Blesse aussi\nlégèrement le lanceur."

movedata MOVE_GEAR_GRIND, "Lancécrou"
    battleeffect MOVE_EFFECT_HIT_TWICE
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_STEEL
    accuracy 85
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_GEAR_GRIND, "Le lanceur jette\ndeux écrous d’acier\nqui frappent la cible\ndeux fois d’affilée."

movedata MOVE_SEARING_SHOT, "Incendie"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 30
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SEARING_SHOT, "Des flammes s’abat-\ntent sur tous les\nPokémon autour\ndu lanceur, ce qui\npeut aussi les brûler."

movedata MOVE_TECHNO_BLAST, "Techno-Buster"
    battleeffect MOVE_EFFECT_TECHNO_BLAST
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TECHNO_BLAST, "Le lanceur projette\nun rayon lumineux\nsur la cible. Le type\nvarie selon le module\nque tient le lanceur."

movedata MOVE_RELIC_SONG, "Chant Antique"
    battleeffect MOVE_EFFECT_SLEEP_HIT
    pss SPLIT_SPECIAL
    basepower 75
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_RELIC_SONG, "Le lanceur attaque\nla cible en lui chantant\nune chanson d’un\nautre temps qui peut\naussi l’endormir."

movedata MOVE_SECRET_SWORD, "Lame Ouinte"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 85
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_SECRET_SWORD, "La cible est lacérée\npar une longue corne\ndont le pouvoir mys-\ntérieux inflige des\ndégâts physiques."

movedata MOVE_GLACIATE, "Ère Glaciaire"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_ICE
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_GLACIATE, "Un souffle de vent\nqui congèle tout sur\nson passage s’abat\nsur la cible et réduit\naussi sa Vitesse."

movedata MOVE_BOLT_STRIKE, "Charge Foudre"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_SPECIAL
    basepower 130
    type TYPE_ELECTRIC
    accuracy 85
    pp 5
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_BOLT_STRIKE, "Le lanceur s’enve-\nloppe d’une charge\nélectrique et se jette\nsur la cible, ce qui peut\naussi la paralyser."

movedata MOVE_BLUE_FLARE, "Flamme Bleue"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 130
    type TYPE_FIRE
    accuracy 85
    pp 5
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_BLUE_FLARE, "De magnifiques et\nredoutables flammes\nbleues s’abattent sur\nla cible, et peuvent\naussi la brûler."

movedata MOVE_FIERY_DANCE, "Danse du Feu"
    battleeffect MOVE_EFFECT_RAISE_SP_ATK_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FIERY_DANCE, "Le lanceur s’enve-\nloppe de flammes et\nattaque la cible. Cela\npeut aussi augmenter\nl’Atk. Spé. du lanceur."

movedata MOVE_FREEZE_SHOCK, "Éclair Gelé"
    battleeffect MOVE_EFFECT_CHARGE_TURN_PARALYZE_HIT
    pss SPLIT_SPECIAL
    basepower 140
    type TYPE_ICE
    accuracy 100
    pp 5
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FREEZE_SHOCK, "Le lanceur projette\nun bloc de glace\nélectrifié sur la cible\nau second tour, ce qui\npeut aussi la paralyser."

movedata MOVE_ICE_BURN, "Feu Glacé"
    battleeffect MOVE_EFFECT_CHARGE_TURN_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 140
    type TYPE_ICE
    accuracy 100
    pp 5
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ICE_BURN, "Au second tour, le\nlanceur projette un\nsouffle de vent glacial\nsur la cible, ce qui\npeut aussi la brûler."

movedata MOVE_SNARL, "Aboiement"
    battleeffect MOVE_EFFECT_LOWER_SP_ATK_HIT
    pss SPLIT_SPECIAL
    basepower 55
    type TYPE_DARK
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SNARL, "Le lanceur hurle sur\nla cible et baisse\nl’Atk. Spé. de celle-ci."

movedata MOVE_ICICLE_CRASH, "Chute Glace"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_ICE
    accuracy 100
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ICICLE_CRASH, "Le lanceur envoie\nde gros blocs de glace\nsur la cible pour lui\ninfliger des dégâts, ce\nqui peut aussi l’apeurer."

movedata MOVE_V_CREATE, "Coup Victoire"
    battleeffect MOVE_EFFECT_USER_DEF_SP_DEF_SPEED_DOWN_HIT
    pss SPLIT_PHYSICAL
    basepower 180
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_CONTACT | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_V_CREATE, "Le lanceur fait jaillir\ndes flammes et se\njette sur la cible, ce\nqui baisse sa Déf., sa\nDéf. Spé. et sa Vitesse."

movedata MOVE_FUSION_FLARE, "Flamme Croix"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FUSION_FLARE, "Le lanceur projette\nune boule de feu gigan-\ntesque. Sa puissance\naugmente sous l’influ-\nence d’Éclair Croix."

movedata MOVE_FUSION_BOLT, "Éclair Croix"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_ELECTRIC
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FUSION_BOLT, "Le lanceur projette un\norbe électrique gigan-\ntesque. Sa puissance\naugmente sous l’influ-\nence de Flamme Croix."

movedata MOVE_FLYING_PRESS, "Flying Press"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_FLYING_PRESS, "Une attaque en\npiqué depuis le\nciel, à la fois de\ntype Combat et\nde type Vol."

movedata MOVE_MAT_BLOCK, "Tatamigaeshi"
    battleeffect MOVE_EFFECT_PROTECT_USER_SIDE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIGHTING
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAT_BLOCK, "Bloque les capacités\nvisant le lanceur ou\nses alliés. N'a pas\nd'effet sur les at-\ntaques de statut."

movedata MOVE_BELCH, "Éructation"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_POISON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BELCH, "Éructe sur la cible,\ninfligeant des dégâts.\nNe fonctionne que si\nle lanceur consomme\nune Baie tenue."

movedata MOVE_ROTOTILLER, "Fertilisation"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GROUND
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_USER | RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_ROTOTILLER, "Laboure le sol et le\nrend plus fertile.\nAugmente l'Atk. et\nl'Atk. Spé. des Poké-\nmon de type Plante."

movedata MOVE_STICKY_WEB, "Toile Gluante"
    battleeffect MOVE_EFFECT_STICKY_WEB
    pss SPLIT_STATUS
    basepower 0
    type TYPE_BUG
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_OPPONENT_SIDE
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_STICKY_WEB, "Le lanceur déploie\nune toile visqueuse\nqui ralentit la Vitesse\nde tout adversaire\nentrant au combat."

movedata MOVE_FELL_STINGER, "Dard Mortel"
    battleeffect MOVE_EFFECT_FELL_STINGER
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_BUG
    accuracy 100
    pp 25
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FELL_STINGER, "Le lanceur augmente\nénormément son\nAttaque si une cible\nest mise K.O. par\ncette capacité."

movedata MOVE_PHANTOM_FORCE, "Hantise"
    battleeffect MOVE_EFFECT_SHADOW_FORCE
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_GHOST
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PHANTOM_FORCE, "Le lanceur disparaît\nau premier tour et\nfrappe au second.\nCette attaque passe\noutre les protections."

movedata MOVE_TRICK_OR_TREAT, "Halloween"
    battleeffect MOVE_EFFECT_ADD_THIRD_TYPE_GHOST
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GHOST
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_TRICK_OR_TREAT, "Insuffle à la cible\nl’esprit d’Halloween,\net ajoute le type\nSpectre à ses types\nactuels."

movedata MOVE_NOBLE_ROAR, "Râle Mâle"
    battleeffect MOVE_EFFECT_ATK_SP_ATK_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 30
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_NOBLE_ROAR, "Le lanceur pousse un\nrugissement qui inti-\nmide la cible et dimi-\nnue l’Atk. et l’Atk. Spé.\nde celle-ci."

movedatalongname MOVE_ION_DELUGE, "DélugePlasmique", "Déluge Plasmique"
    battleeffect MOVE_EFFECT_ION_DELUGE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ELECTRIC
    accuracy 0
    pp 25
    effectchance 0
    target RANGE_FIELD
    priority 1
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ION_DELUGE, "Transforme les cap-\nacités de type Nor-\nmal en capacités de\ntype Électrik."

movedata MOVE_PARABOLIC_CHARGE, "Parabocharge"
    battleeffect MOVE_EFFECT_RECOVER_HALF_DAMAGE_DEALT
    pss SPLIT_SPECIAL
    basepower 65
    type TYPE_ELECTRIC
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_PARABOLIC_CHARGE, "Inflige des dégâts à\ntous les Pokémon.\nIl récupère en PV\nla moitié des\ndégâts infligés."

movedata MOVE_FORESTS_CURSE, "MaléficeSylvain"
    battleeffect MOVE_EFFECT_ADD_THIRD_TYPE_GRASS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FORESTS_CURSE, "La cible est charmée\npar l’esprit de la forêt.\nLe type Plante est\najouté à ses types\nactuels."

movedata MOVE_PETAL_BLIZZARD, "Tempête Florale"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_GRASS
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_PETAL_BLIZZARD, "Déclenche une vio-\nlente tempête de\nfleurs qui inflige des\ndégâts à tous les\nPokémon alentour."

movedata MOVE_FREEZE_DRY, "Lyophilisation"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 70
    type TYPE_ICE
    accuracy 100
    pp 20
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FREEZE_DRY, "Le lanceur refroidit\nviolemment la cible\net peut la geler.\nSuper efficace sur\nles Pokémon Eau."

movedata MOVE_DISARMING_VOICE, "Voix Enjôleuse"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_SPECIAL
    basepower 40
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_DISARMING_VOICE, "Le lanceur laisse\ns’échapper une voix\nenchanteresse.\nN’échoue jamais."

movedata MOVE_PARTING_SHOT, "Dernier Mot"
    battleeffect MOVE_EFFECT_PARTING_SHOT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PARTING_SHOT, "Change de place\navec un autre\nPokémon. Réduit\nl’Attaque et l’Attaque\nSpéciale de la cible."

movedata MOVE_TOPSY_TURVY, "Renversement"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_TOPSY_TURVY, "Inverse tous les\nchangements de\nstats de la cible."

movedata MOVE_DRAINING_KISS, "Vampibaiser"
    battleeffect MOVE_EFFECT_RECOVER_THREE_QUARTERS_DAMAGE_DEALT
    pss SPLIT_SPECIAL
    basepower 50
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_DRAINING_KISS, "Rend au lanceur un\nnombre de PV supé-\nrieur ou égal à la\nmoitié des dégâts\ninfligés."

movedata MOVE_CRAFTY_SHIELD, "Vigilance"
    battleeffect MOVE_EFFECT_PROTECT_USER_SIDE
    pss SPLIT_STATUS
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER_SIDE
    priority 3
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_CRAFTY_SHIELD, "Protège l'équipe des\nattaques de statut.\nNe protège pas des\nautres capacités."

movedata MOVE_FLOWER_SHIELD, "Garde Florale"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_USER | RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FLOWER_SHIELD, "Grâce à une force\nmystérieuse, la Déf.\nde tous les Pokémon\nPlante au combat\naugmente."

movedata MOVE_GRASSY_TERRAIN, "Champ Herbu"
    battleeffect MOVE_EFFECT_APPLY_TERRAINS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal APPEAL_BASIC
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_GRASSY_TERRAIN, "Pendant cinq tours,\nles Pokémon au sol\nrécupèrent quelques\nPV à chaque tour."

movedata MOVE_MISTY_TERRAIN, "Champ Brumeux"
    battleeffect MOVE_EFFECT_APPLY_TERRAINS
    pss SPLIT_STATUS
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal APPEAL_BASIC
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MISTY_TERRAIN, "Pendant cinq tours,\nles Pokémon au sol\nne peuvent pas subir\nd’altération de statut."

movedata MOVE_ELECTRIFY, "Électrisation"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ELECTRIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_ELECTRIFY, "Si le lanceur attaque\navant la cible, les cap-\nacités de celle-ci se-\nront de type Électrik\njusqu’à la fin du tour."

movedata MOVE_PLAY_ROUGH, "Câlinerie"
    battleeffect MOVE_EFFECT_LOWER_ATTACK_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_PLAY_ROUGH, "Le lanceur attaque\nla cible en lui faisant\ndes câlineries, ce qui\npeut aussi diminuer\nl’Attaque de celle-ci."

movedata MOVE_FAIRY_WIND, "Vent Féérique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 40
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_FAIRY_WIND, "Le lanceur déchaîne\nun vent magique qui\ncingle la cible."

movedata MOVE_MOONBLAST, "Pouvoir Lunaire"
    battleeffect MOVE_EFFECT_LOWER_SP_ATK_HIT
    pss SPLIT_SPECIAL
    basepower 95
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MOONBLAST, "Le lanceur attaque\nla cible grâce au\npouvoir de la lune,\nce qui peut diminuer\nl’Atk. Spé. de celle-ci."

movedata MOVE_BOOMBURST, "Bang Sonique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 140
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_BOOMBURST, "Attaque les Pokémon\nalentour grâce à une\nonde sonore assour-\ndissante qui détruit\ntout sur son passage."

movedata MOVE_FAIRY_LOCK, "Verrou Enchanté"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_FAIRY_LOCK, "Des chaînes entou-\nrent le terrain, empê-\nchant les Pokémon\nde se retirer pendant\nun tour."

movedata MOVE_KINGS_SHIELD, "Bouclier Royal"
    battleeffect MOVE_EFFECT_PROTECT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_STEEL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 4
    flags 0
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_KINGS_SHIELD, "Bloque les dégâts et\ndiminue l’Attaque de\ntout assaillant qui\nentre en contact avec\nle lanceur."

movedata MOVE_PLAY_NICE, "Camaraderie"
    battleeffect MOVE_EFFECT_ATK_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_PLAY_NICE, "La cible se lie d’amitié\navec le lanceur et perd\nsa combativité, ce qui\ndiminue son Attaque."

movedata MOVE_CONFIDE, "Confidence"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_CONFIDE, "Le lanceur dévoile\ndes secrets à la cible,\nqui perd alors sa con-\ncentration et voit son\nAtk. Spé. diminuer."

movedata MOVE_DIAMOND_STORM, "Orage Adamantin"
    battleeffect MOVE_EFFECT_RAISE_DEF_2_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_ROCK
    accuracy 100
    pp 5
    effectchance 50
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_DIAMOND_STORM, "Provoque une tempête\nde diamants qui inflige\ndes dégâts. Peut beau-\ncoup augmenter la Déf.\ndu lanceur."

movedata MOVE_STEAM_ERUPTION, "Jet de Vapeur"
    battleeffect MOVE_EFFECT_THAW_AND_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 110
    type TYPE_WATER
    accuracy 100
    pp 5
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_STEAM_ERUPTION, "Le lanceur projette\nde la vapeur extrême-\nment chaude  sur la\ncible, ce qui peut\naussi la brûler."

movedatalongname MOVE_HYPERSPACE_HOLE, "Trou Dimension", "Trou Dimensionnel"
    battleeffect MOVE_EFFECT_REMOVE_PROTECT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_PSYCHIC
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_HYPERSPACE_HOLE, "Attaque soudaine-\nment la cible de côté.\nIgnore les capacités\ncomme Abri\nou Détection."

movedata MOVE_WATER_SHURIKEN, "Sheauriken"
    battleeffect MOVE_EFFECT_MULTI_HIT
    pss SPLIT_SPECIAL
    basepower 15
    type TYPE_WATER
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_WATER_SHURIKEN, "Le lanceur attaque\nla cible avec des\nshuriken. Frappe en\npriorité deux à cinq\nfois d’affilée."

movedata MOVE_MYSTICAL_FIRE, "Feu Ensorcelé"
    battleeffect MOVE_EFFECT_LOWER_SP_ATK_HIT
    pss SPLIT_SPECIAL
    basepower 75
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MYSTICAL_FIRE, "Le lanceur attaque\nen soufflant des\nflammes brûlantes\net diminue l’Atk. Spé.\nde la cible."

movedata MOVE_SPIKY_SHIELD, "Pico-Défense"
    battleeffect MOVE_EFFECT_PROTECT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 4
    flags 0
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_SPIKY_SHIELD, "Protège des attaques,\net diminue les PV de\ntout assaillant qui\nentre en contact avec\nle lanceur."

movedata MOVE_AROMATIC_MIST, "Brume Capiteuse"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_ALLY
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_AROMATIC_MIST, "Grâce à un parfum\nmystérieux,\naugmente la Défense\nSpéciale d’un allié."

movedata MOVE_EERIE_IMPULSE, "Ondes Étranges"
    battleeffect MOVE_EFFECT_SP_ATK_DOWN_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ELECTRIC
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_EERIE_IMPULSE, "Le corps du lanceur\nproduit des ondes\nanormales qui dimi-\nnuent beaucoup\nl’Atk. Spé. de la cible."

movedata MOVE_VENOM_DRENCH, "Piège de Venin"
    battleeffect MOVE_EFFECT_VENOM_DRENCH
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_VENOM_DRENCH, "Sécrète un liquide\nempoisonné. Dimi-\nnue l'Atk., l'Atk. Spé.\net la Vitesse de l'en-\nnemi empoisonné."

movedata MOVE_POWDER, "Nuée de Poudre"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_BUG
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_POWDER, "Si l'ennemi utilise\nune capacité de type\nFeu lors du même\ntour, un nuage explose\net lui inflige des dégâts."

movedata MOVE_GEOMANCY, "Géo-Contrôle"
    battleeffect MOVE_EFFECT_CHARGE_TURN_ATK_SP_ATK_SPEED_UP_2
    pss SPLIT_STATUS
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_GEOMANCY, "Le lanceur absorbe\nde l’énergie au premier\ntour puis augmente beau-\ncoup son Atk. Spé., sa\nDéf. Spé. et sa "

movedata MOVE_MAGNETIC_FLUX, "Magné-Contrôle"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ELECTRIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_MAGNETIC_FLUX, "Augmente la Déf. et la\nDéf. Spé. des Pokémon\nalliés dotés du talent\nPlus ou du talent Moins."

movedata MOVE_HAPPY_HOUR, "Étrennes"
    battleeffect MOVE_EFFECT_DO_NOTHING
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_HAPPY_HOUR, "Utilisée pendant un\ncombat, multiplie par\ndeux l’argent gagné\nà la fin."

movedatalongname MOVE_ELECTRIC_TERRAIN, "Champ Électrik", "Champ Électrifié"
    battleeffect MOVE_EFFECT_APPLY_TERRAINS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ELECTRIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal APPEAL_BASIC
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_ELECTRIC_TERRAIN, "Pendant cinq tours,\nles Pokémon au sol\nne peuvent pas\ns’endormir."

movedata MOVE_DAZZLING_GLEAM, "Éclat Magique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_DAZZLING_GLEAM, "Le lanceur libère une\npuissante décharge\nlumineuse qui inflige\ndes dégâts à l’ennemi."

movedata MOVE_CELEBRATE, "Célébration"
    battleeffect MOVE_EFFECT_DO_NOTHING
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_CELEBRATE, "Le Pokémon vous\nsouhaite plein de\nbonnes choses\npour cet\névènement spécial."

movedata MOVE_HOLD_HANDS, "Mains Jointes"
    battleeffect MOVE_EFFECT_DO_NOTHING
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 40
    effectchance 0
    target RANGE_ALLY
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_HOLD_HANDS, "Le lanceur et un allié\nse prennent la main,\nce qui les rend\nheureux."

movedata MOVE_BABY_DOLL_EYES, "Regard Touchant"
    battleeffect MOVE_EFFECT_ATK_DOWN
    pss SPLIT_STATUS
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 30
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_BABY_DOLL_EYES, "Le lanceur diminue\nl’Attaque de la cible.\nAgit en priorité."

movedatalongname MOVE_NUZZLE, "FrotteFrimousse", "Frotte-Frimousse"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_PHYSICAL
    basepower 20
    type TYPE_ELECTRIC
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_NUZZLE, "Le lanceur attaque\nen frottant ses ba-\njoues chargées\nd’électricité, ce qui\nparalyse la cible."

movedata MOVE_HOLD_BACK, "Retenue"
    battleeffect MOVE_EFFECT_LEAVE_WITH_1_HP
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_NORMAL
    accuracy 100
    pp 40
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HOLD_BACK, "Le lanceur attaque\navec retenue, et\nlaisse au moins\n1 PV à la cible."

movedata MOVE_INFESTATION, "Harcèlement"
    battleeffect MOVE_EFFECT_BIND_HIT
    pss SPLIT_SPECIAL
    basepower 20
    type TYPE_BUG
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_INFESTATION, "La cible ne peut pas\nquitter le terrain\npendant quatre à\ncinq tours."

movedata MOVE_POWER_UP_PUNCH, "Poing Boost"
    battleeffect MOVE_EFFECT_RAISE_ATTACK_HIT
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_FIGHTING
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_POWER_UP_PUNCH, "À force de frapper,\nles poings devien-\nnent plus durs.\nAugmente l'Atk.\ndu lanceur."

movedata MOVE_OBLIVION_WING, "Mort'Ailes"
    battleeffect MOVE_EFFECT_RECOVER_THREE_QUARTERS_DAMAGE_DEALT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_FLYING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_OBLIVION_WING, "Vole l’énergie de la\ncible. Rend au lan-\nceur des PV égaux\nà la moitié des\ndégâts infligés."

movedata MOVE_THOUSAND_ARROWS, "Myria-Flèches"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_THOUSAND_ARROWS, "Touche même les\nPokémon dans les\nairs. Dans ce cas, la\ncible retombe au sol."

movedata MOVE_THOUSAND_WAVES, "Myria-Vagues"
    battleeffect MOVE_EFFECT_PREVENT_ESCAPE_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_THOUSAND_WAVES, "Le lanceur attaque\navec des vagues glis-\nsant au sol. La cible\ny est prise et ne peut\npas quitter le terrain."

movedatalongname MOVE_LANDS_WRATH, "ForceChtonienne", "Force Chtonienne"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_LANDS_WRATH, "Le lanceur utilise la\npuissance du sol et\nla concentre sur la\ncible pour infliger\ndes dégâts."

movedatalongname MOVE_LIGHT_OF_RUIN, "LumièreDuNéant", "Lumière du Néant"
    battleeffect MOVE_EFFECT_RECOIL_HALF
    pss SPLIT_SPECIAL
    basepower 140
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_LIGHT_OF_RUIN, "Lance un formidable\nrayon d’énergie. Cela\nblesse aussi très\ngravement le lanceur."

movedata MOVE_ORIGIN_PULSE, "Onde Originelle"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 110
    type TYPE_WATER
    accuracy 85
    pp 10
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_ORIGIN_PULSE, "Le lanceur projette\nune aura et\nd’innombrables\nrayons lumineux\nbleus sur la cible."

movedata MOVE_PRECIPICE_BLADES, "Lame Pangéenne"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_GROUND
    accuracy 85
    pp 10
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PRECIPICE_BLADES, "Le Pokémon trans-\nforme la puissance\nde la terre et attaque\nla cible avec une\nlame acérée."

movedata MOVE_DRAGON_ASCENT, "Draco-Ascension"
    battleeffect MOVE_EFFECT_USER_DEF_SP_DEF_DOWN_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_FLYING
    accuracy 100
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_DRAGON_ASCENT, "Le Pokémon s’abat\nà toute vitesse.\nBaisse la Déf. et la\nDéf. Spé. du lanceur."

movedata MOVE_HYPERSPACE_FURY, "Furie Dimension"
    battleeffect MOVE_EFFECT_USER_DEF_DOWN_HIT_REMOVE_PROTECT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_DARK
    accuracy 0
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8
    appeal 0x00
    contesttype CONTEST_TOUGH
    terminatedata
    movedescription MOVE_HYPERSPACE_FURY, "ttaque en ignorant\nles capacités telles\nqu’Abri ou Détection.\nBaisse la Déf. du lanceur."

// Contest types after this point are purely speculative due to the lack of contests since Generation VII.
// Moves introduced in Generation VII:
movedatalongname MOVE_BREAKNECK_BLITZ_PHYSICAL, "ChargeBulldozer", "Turbo-Charge Bulldozer"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BREAKNECK_BLITZ_PHYSICAL, "The user crashes into\nthe target at full speed\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_BREAKNECK_BLITZ_SPECIAL, "ChargeBulldozer", "Turbo-Charge Bulldozer"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BREAKNECK_BLITZ_SPECIAL, "The user crashes into\nthe target at full speed\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_ALL_OUT_PUMMELING_PHYSICAL, "Hyper-Furie", "Combo Hyper-Furie"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_FIGHTING
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ALL_OUT_PUMMELING_PHYSICAL, "The user fires an\nenergy orb created by\nits Z-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_ALL_OUT_PUMMELING_SPECIAL, "Hyper-Furie", "Combo Hyper-Furie"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_FIGHTING
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ALL_OUT_PUMMELING_SPECIAL, "The user fires an\nenergy orb created by\nits Z-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_SUPERSONIC_SKYSTRIKE_PHYSICAL, "PiquéSupersonik", "Piqué Supersonique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_FLYING
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SUPERSONIC_SKYSTRIKE_PHYSICAL, "The user plummets toward\nthe target at full speed\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_SUPERSONIC_SKYSTRIKE_SPECIAL, "PiquéSupersonik", "Piqué Supersonique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_FLYING
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SUPERSONIC_SKYSTRIKE_SPECIAL, "The user plummets toward\nthe target at full speed\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_ACID_DOWNPOUR_PHYSICAL, "Déluge Toxique", "Déluge Causti-Toxique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_POISON
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ACID_DOWNPOUR_PHYSICAL, "The user creates a\npoisonous swamp using\nits Z-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_ACID_DOWNPOUR_SPECIAL, "Déluge Toxique", "Déluge Causti-Toxique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_POISON
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ACID_DOWNPOUR_SPECIAL, "The user creates a\npoisonous swamp using\nits Z-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_TECTONIC_RAGE_PHYSICAL, "Éruption Sismik", "Éruption Géo-Sismique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_GROUND
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TECTONIC_RAGE_PHYSICAL, "The user slams into the\ntarget from underground\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_TECTONIC_RAGE_SPECIAL, "Éruption Sismik", "Éruption Géo-Sismique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_GROUND
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TECTONIC_RAGE_SPECIAL, "The user slams into the\ntarget from underground\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_CONTINENTAL_CRUSH_PHYSICAL, "Apo. Gigalithik", "Apocalypse Gigalithique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_ROCK
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CONTINENTAL_CRUSH_PHYSICAL, "The user drops a huge\nmountain onto the target\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_CONTINENTAL_CRUSH_SPECIAL, "Apo. Gigalithik", "Apocalypse Gigalithique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_ROCK
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CONTINENTAL_CRUSH_SPECIAL, "The user drops a huge\nmountain onto the target\nusing its Z-Power. The\npower varies, depending\non the original move."

movedata MOVE_SAVAGE_SPIN_OUT_PHYSICAL, "Cocon Fatal"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_BUG
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SAVAGE_SPIN_OUT_PHYSICAL, "The user spits threads\nat the target made\nusing its Z-Power. The\npower varies, depending\non the original move."

movedata MOVE_SAVAGE_SPIN_OUT_SPECIAL, "Cocon Fatal"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_BUG
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SAVAGE_SPIN_OUT_SPECIAL, "The user spits threads\nat the target made\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_NEVER_ENDING_NIGHTMARE_PHYSICAL, "Ombre Éternelle", "Appel des Ombres Éternelles"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_GHOST
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_NEVER_ENDING_NIGHTMARE_PHYSICAL, "Deep-seated grudges are\nsummoned by the user's\nZ-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_NEVER_ENDING_NIGHTMARE_SPECIAL, "Ombre Éternelle", "Appel des Ombres Éternelles"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_GHOST
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_NEVER_ENDING_NIGHTMARE_SPECIAL, "Deep-seated grudges are\nsummoned by the user's\nZ-Power. The power\nvaries, depending on\nthe original move."

movedata MOVE_CORKSCREW_CRASH_PHYSICAL, "Vrille Maximum"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_STEEL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CORKSCREW_CRASH_PHYSICAL, "The user spins very fast\nand rams into the target\nusing its Z-Power. The\npower varies, depending\non the original move."

movedata MOVE_CORKSCREW_CRASH_SPECIAL, "Vrille Maximum"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_STEEL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CORKSCREW_CRASH_SPECIAL, "The user spins very fast\nand rams into the target\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_INFERNO_OVERDRIVE_PHYSICAL, "Pyro-Explosion", "Pyro-Explosion Cataclysmique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_FIRE
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_INFERNO_OVERDRIVE_PHYSICAL, "The user breathes a\nstream of intense fire\nusing its Z-Power. The\npower varies depending\non the original move."

movedatalongname MOVE_INFERNO_OVERDRIVE_SPECIAL, "Pyro-Explosion", "Pyro-Explosion Cataclysmique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_FIRE
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_INFERNO_OVERDRIVE_SPECIAL, "The user breathes a\nstream of intense fire\nusing its Z-Power. The\npower varies depending\non the original move."

movedatalongname MOVE_HYDRO_VORTEX_PHYSICAL, "Tourb. Abyssal", "Super Tourbillon Abyssal"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_WATER
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HYDRO_VORTEX_PHYSICAL, "The user creates a huge\nwhirling current using\nits Z-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_HYDRO_VORTEX_SPECIAL, "Tourb. Abyssal", "Super Tourbillon Abyssal"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_WATER
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HYDRO_VORTEX_SPECIAL, "The user creates a huge\nwhirling current using\nits Z-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_BLOOM_DOOM_PHYSICAL, "Pétalexplosion", "Pétalexplosion Éblouissante"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_GRASS
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BLOOM_DOOM_PHYSICAL, "The user attacks with\nenergy drawn from plants\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_BLOOM_DOOM_SPECIAL, "Pétalexplosion", "Pétalexplosion Éblouissante"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_GRASS
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BLOOM_DOOM_SPECIAL, "The user attacks with\nenergy drawn from plants\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_GIGAVOLT_HAVOC_PHYSICAL, "Fulguro-Lance", "Fulguro-Lance Gigavolt"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_ELECTRIC
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GIGAVOLT_HAVOC_PHYSICAL, "The user summons a\nstrong electric current\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_GIGAVOLT_HAVOC_SPECIAL, "Fulguro-Lance", "Fulguro-Lance Gigavolt"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_ELECTRIC
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GIGAVOLT_HAVOC_SPECIAL, "The user summons a\nstrong electric current\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_SHATTERED_PSYCHE_PHYSICAL, "Pulvérisation", "Psycho-Pulvérisation EX"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SHATTERED_PSYCHE_PHYSICAL, "The user hurts the\ntarget's mind using\nits Z-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_SHATTERED_PSYCHE_SPECIAL, "Pulvérisation", "Psycho-Pulvérisation EX"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SHATTERED_PSYCHE_SPECIAL, "The user hurts the\ntarget's mind using\nits Z-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_SUBZERO_SLAMMER_PHYSICAL, "Laser Cryogénik", "Laser Cryogénique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_ICE
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SUBZERO_SLAMMER_PHYSICAL, "The user freezes the\ntarget using its\nZ-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_SUBZERO_SLAMMER_SPECIAL, "Laser Cryogénik", "Laser Cryogénique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_ICE
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SUBZERO_SLAMMER_SPECIAL, "The user freezes the\ntarget using its\nZ-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_DEVASTATING_DRAKE_PHYSICAL, "ChaosDraconique", "Chaos Draconique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_DRAGON
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DEVASTATING_DRAKE_PHYSICAL, "The user materializes\nand projects its aura\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_DEVASTATING_DRAKE_SPECIAL, "ChaosDraconique", "Chaos Draconique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_DRAGON
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DEVASTATING_DRAKE_SPECIAL, "The user materializes\nand projects its aura\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_BLACK_HOLE_ECLIPSE_PHYSICAL, "TrouNoirD'Ombre", "Trou Noir des Ombres"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_DARK
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BLACK_HOLE_ECLIPSE_PHYSICAL, "The user sucks the\ntarget into dark energy\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_BLACK_HOLE_ECLIPSE_SPECIAL, "TrouNoirD'Ombre", "Trou Noir des Ombres"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_DARK
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BLACK_HOLE_ECLIPSE_SPECIAL, "The user sucks the\ntarget into dark energy\nusing its Z-Power. The\npower varies, depending\non the original move."

movedatalongname MOVE_TWINKLE_TACKLE_PHYSICAL, "ImpctChoupinova", "Impact Choupinova"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TWINKLE_TACKLE_PHYSICAL, "The user totally toys\nwith the target using\nits Z-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_TWINKLE_TACKLE_SPECIAL, "ImpctChoupinova", "Impact Choupinova"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TWINKLE_TACKLE_SPECIAL, "The user totally toys\nwith the target using\nits Z-Power. The power\nvaries, depending on\nthe original move."

movedatalongname MOVE_CATASTROPIKA, "Pikachute", "Pikachute Foudroyante"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 210
    type TYPE_ELECTRIC
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CATASTROPIKA, "Pikachu surrounds\nitself with maximum\nelectricity using its\nZ-Power and pounces on\nits target."

movedata MOVE_SHORE_UP, "Amass'Sable"
    battleeffect MOVE_EFFECT_HEAL_HALF_DIFFERENT_IN_WEATHER
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GROUND
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SHORE_UP, "Le lanceur récupère\nla moitié de ses PV\nmax. Durant une tem-\npête de sable, il en\nrécupère encore plus."

movedata MOVE_FIRST_IMPRESSION, "Escarmouche"
    battleeffect MOVE_EFFECT_FIRST_TURN_ONLY
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_BUG
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 2
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FIRST_IMPRESSION, "Une capacité très\npuissante, mais qui\nne fonctionne que\nlorsque le lanceur\nentre au combat."

movedata MOVE_BANEFUL_BUNKER, "Blockhaus"
    battleeffect MOVE_EFFECT_PROTECT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 4
    flags 0
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BANEFUL_BUNKER, "Le lanceur se protège\ncontre les attaques.\nSi un assaillant utilise\nune attaque directe,\nil l’empoisonne."

movedata MOVE_SPIRIT_SHACKLE, "Tisse Ombre"
    battleeffect MOVE_EFFECT_PREVENT_ESCAPE_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_GHOST
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPIRIT_SHACKLE, "Une attaque qui coud\nla cible à son ombre,\nce qui l’empêche de\ns’enfuir."

movedata MOVE_DARKEST_LARIAT, "Dark Lariat"
    battleeffect MOVE_EFFECT_HIT // Defense is handled in CalcBaseDamage.c and Evasion is in other_battle_calculators.c.
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DARKEST_LARIAT, "Le lanceur inflige des\ndégâts et ignore les\nchangements de stats\nde la cible."

movedata MOVE_SPARKLING_ARIA, "Aria de l'Écume"
    battleeffect MOVE_EFFECT_HIT // Handled in BattleController_MoveEndInternal.
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_WATER
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPARKLING_ARIA, "Le lanceur émet des\nbulles en chantant.\nSoigne les brûlures\ndes Pokémon tou-\nchés par ces bulles."

movedatalongname MOVE_ICE_HAMMER, "MarteauDeGlace", "Marteau de Glace"
    battleeffect MOVE_EFFECT_USER_SPEED_DOWN_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_ICE
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ICE_HAMMER, "Le lanceur donne un\npuissant coup de\npoing à la cible, ce\nqui réduit la Vitesse\ndu lanceur."

movedatalongname MOVE_FLORAL_HEALING, "Soin Floral", "Cavalerie Lourde"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FLORAL_HEALING, "Rend la moitié de ses\nPV max à la cible.\nPlus efficace sur un\nchamp herbu."

movedatalongname MOVE_HIGH_HORSEPOWER, "CavalerieLourde", "Cavalerie Lourde"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 95
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HIGH_HORSEPOWER, "Le lanceur attaque\nviolemment en\nutilisant\ntout son poids."

movedata MOVE_STRENGTH_SAP, "Vole-Force"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STRENGTH_SAP, "Rend au lanceur une\nquantité de PV équi-\nvalente à la stat\nd’Attaque de la cible,\npuis baisse celle-ci."

movedata MOVE_SOLAR_BLADE, "Lame Solaire"
    battleeffect MOVE_EFFECT_CHARGE_TURN_SUN_SKIPS
    pss SPLIT_PHYSICAL
    basepower 125
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SOLAR_BLADE, "Absorbe la lumière\nau premier tour et\nenvoie une lame\npuissante au tour\nsuivant."

movedata MOVE_LEAFAGE, "Feuillage"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_GRASS
    accuracy 100
    pp 40
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LEAFAGE, "Le lanceur attaque\nla cible avec\ndes feuilles."

movedata MOVE_SPOTLIGHT, "Projecteur"
    battleeffect MOVE_EFFECT_MAKE_GLOBAL_TARGET
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 3
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPOTLIGHT, "Met un Pokémon\nsous le feu des\nprojecteurs et force\ntout le monde à\nle viser."

movedata MOVE_TOXIC_THREAD, "Fil Toxique"
    battleeffect MOVE_EFFECT_TOXIC_THREAD
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TOXIC_THREAD, "Tisse un fil imprégné\nde venin. Empoisonne\nla cible et baisse sa\nVitesse."

movedata MOVE_LASER_FOCUS, "Affilage"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 30
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LASER_FOCUS, "Le lanceur se con-\ncentre pour être sûr\nde porter un coup\ncritique au tour\nsuivant."

movedata MOVE_GEAR_UP, "Engrenage"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_STEEL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GEAR_UP, "Change de réglage\npour augmenter l'Atk.\net l'Atk. Spé. des\nalliés ayant les\ntalents Plus ou Minus."

movedata MOVE_THROAT_CHOP, "Exécu-Son"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_DARK
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_THROAT_CHOP, "Inflige une douleur\ntellement violente à la\ncible qu’elle ne peut\nplus émettre de sons\npendant deux tours."

movedata MOVE_POLLEN_PUFF, "Boule Pollen"
    battleeffect MOVE_EFFECT_POLLEN_PUFF
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_BUG
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_POLLEN_PUFF, "Sur un ennemi,\nfait des dégâts.\nSur un allié, fait\nrécupérer des PV."

movedata MOVE_ANCHOR_SHOT, "Ancrage"
    battleeffect MOVE_EFFECT_PREVENT_ESCAPE_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_STEEL
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ANCHOR_SHOT, "Le lanceur jette son\nancre sur la cible\nqui l’empêche de\nquitter le terrain."

movedata MOVE_PSYCHIC_TERRAIN, "Champ Psychique"
    battleeffect MOVE_EFFECT_APPLY_TERRAINS
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PSYCHIC_TERRAIN, "Pendant cinq tours,\nles Pokémon au sol ne\npeuvent plus subir\nd’attaques prioritaires."

movedata MOVE_LUNGE, "Furie-Bond"
    battleeffect MOVE_EFFECT_LOWER_ATTACK_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_BUG
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LUNGE, "Le lanceur se jette\nsur la cible de toutes\nses forces pour lui\ninfliger des dégâts\net baisser son Atk."

movedata MOVE_FIRE_LASH, "Fouet de Feu"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_FIRE
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FIRE_LASH, "Frappe la cible avec\nun fouet\nincandescent et\nbaisse sa Défense."

movedata MOVE_POWER_TRIP, "Arrogance"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 20
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_POWER_TRIP, "Plus les stats du lan-\nceur ont été augmen-\ntées, plus la puissance\nde cette capacité\naugmente."

movedata MOVE_BURN_UP, "Flamme Ultime"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 130
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BURN_UP, "Le Pokémon se con-\nsume et inflige des\ndégâts.\nLe lanceur perd le\ntype Feu."

movedata MOVE_SPEED_SWAP, "Permuvitesse"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPEED_SWAP, "Intervertit la Vitesse\ndu lanceur et celle\nde la cible."

movedata MOVE_SMART_STRIKE, "Estocorne"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_STEEL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SMART_STRIKE, "Le lanceur trans-\nperce la cible avec\nsa corne effilée.\nN’échoue jamais."

movedata MOVE_PURIFY, "Purification"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PURIFY, "Le lanceur soigne\nles altérations de\nstatut de la cible,\nce qui lui permet de\nregagner des PV."

movedata MOVE_REVELATION_DANCE, "Danse Éveil"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_REVELATION_DANCE, "Le lanceur attaque en\ndansant avec enthou-\nsiasme. Le type de la\ncapacité est le même\nque celui du lanceur."

movedatalongname MOVE_CORE_ENFORCER, "SanctionSuprême", "Sanction Suprême"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_DRAGON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CORE_ENFORCER, "La cible subit des\ndégâts et, si elle a\ndéjà agi pendant\nce tour, elle perd\naussi son talent."

movedata MOVE_TROP_KICK, "Botte Sucrette"
    battleeffect MOVE_EFFECT_LOWER_ATTACK_HIT
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_GRASS
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TROP_KICK, "Un coup de pied\nchaud comme les\ntropiques qui inflige\ndes dégâts à la cible\net baisse son Atk."

movedata MOVE_INSTRUCT, "Sommation"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_INSTRUCT, "Force la cible à lancer\nimmédiatement la\ndernière capacité\nqu’elle a utilisée."

movedata MOVE_BEAK_BLAST, "Bec-Canon"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_FLYING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority -3
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BEAK_BLAST, "Le lanceur fait chauf-\nfer son bec avant d’at-\ntaquer. S’il subit une\nattaque directe,\nl’attaquant sera brûlé."

movedata MOVE_CLANGING_SCALES, "Vibrécaille"
    battleeffect MOVE_EFFECT_USER_DEF_DOWN_HIT
    pss SPLIT_SPECIAL
    basepower 110
    type TYPE_DRAGON
    accuracy 100
    pp 5
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CLANGING_SCALES, "Le lanceur déclenche\nun vacarme en frot-\ntant ses écailles.\nBaisse la Défense\ndu lanceur."

movedata MOVE_DRAGON_HAMMER, "Draco-Marteau"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_DRAGON
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRAGON_HAMMER, "Le lanceur utilise son\ncorps comme un véri-\ntable marteau pour\nécraser la cible."

movedata MOVE_BRUTAL_SWING, "Centrifugifle"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_DARK
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BRUTAL_SWING, "Le lanceur pivote\npour prendre de\nl’élan et infliger\ndes dégâts."

movedata MOVE_AURORA_VEIL, "Voile Aurore"
    battleeffect MOVE_EFFECT_SET_AURORA_VEIL
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ICE
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
.if SNOW_WARNING_GENERATION >= 9
    movedescription MOVE_AURORA_VEIL, "Crée un voile rédui-\nsant les dégâts phy-\nsiques et spéciaux.\nNe peut être utilisée\nque lorsqu’il neige."
.else
    movedescription MOVE_AURORA_VEIL, "Crée un voile rédui-\nsant les dégâts phy-\nsiques et spéciaux.\nNe peut être utilisée\nque lorsqu’il grêle."
.endif

movedatalongname MOVE_SINISTER_ARROW_RAID, "Sinister Raid", "Sinister Arrow Raid"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 180
    type TYPE_GHOST
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SINISTER_ARROW_RAID, "The user, Decidueye,\ncreates countless\narrows using its Z-Power\nand shoots the target\nwith full force."

movedata MOVE_MALICIOUS_MOONSAULT, "Dark Body Press"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 180
    type TYPE_DARK
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MALICIOUS_MOONSAULT, "The user, Incineroar,\nstrengthens its body\nusing its Z-Power and\ncrashes into the target\nwith full force."

movedatalongname MOVE_OCEANIC_OPERETTA, "SymphonieOndine", "Symphonie des Ondines"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 195
    type TYPE_WATER
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_OCEANIC_OPERETTA, "The user, Primarina,\nsummons a massive\namount of water using its\nZ-Power and attacks the\ntarget with full force."

movedatalongname MOVE_GUARDIAN_OF_ALOLA, "Gardien d'Alola", "Colère du Gardien d'Alola"
    battleeffect MOVE_EFFECT_QUARTER_HP
    pss SPLIT_SPECIAL
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GUARDIAN_OF_ALOLA, "The Land Spirit Pokémon\nuses its Z-Power to\nattack with Alola's\nenergy. This reduces the\ntarget's HP greatly."

movedatalongname MOVE_SOUL_STEALING_7_STAR_STRIKE, "Fauche-Âme", "Fauche-Âme des Sept Étoiles"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 195
    type TYPE_GHOST
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SOUL_STEALING_7_STAR_STRIKE, "After obtaining\nZ-Power, Marshadow\npunches and kicks the\ntarget consecutively\nwith full force."

movedatalongname MOVE_STOKED_SPARKSURFER, "Électro-Surf", "Électro-Surf Survolté"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_SPECIAL
    basepower 175
    type TYPE_ELECTRIC
    accuracy 0
    pp 1
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STOKED_SPARKSURFER, "After obtaining\nZ-Power, Alolan Raichu\nattacks the target with\nfull force, leaving\nthem with paralysis."

movedata MOVE_PULVERIZING_PANCAKE, "Gare au Ronflex"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 210
    type TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PULVERIZING_PANCAKE, "Z-Power brings out the\ntrue capabilities of\nSnorlax, which excitedly\nmoves its enormous body\nto attack the target."

movedata MOVE_EXTREME_EVOBOOST, "Neuf pour Un"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 100
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_EXTREME_EVOBOOST, "After obtaining\nZ-Power, Eevee gets\nenergy from its evolved\nfriends and boosts its\nstats sharply."

movedatalongname MOVE_GENESIS_SUPERNOVA, "Supernova", "Supernova Originelle"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 185
    type TYPE_PSYCHIC
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GENESIS_SUPERNOVA, "After obtaining\nZ-Power, Mew attacks\nthe target and charges\nthe terrain with\npsychic energy."

movedata MOVE_SHELL_TRAP, "Carapiège"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority -3
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SHELL_TRAP, "Si un Pokémon at-\ntaque le lanceur avec\nune capacité phys-\nique, inflige des\ndégâts à l’assaillant."

movedata MOVE_FLEUR_CANNON, "Canon Floral"
    battleeffect MOVE_EFFECT_USER_SP_ATK_DOWN_2
    pss SPLIT_SPECIAL
    basepower 130
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FLEUR_CANNON, "Envoie un rayon laser\ndévastateur. Baisse\nbeaucoup l’Attaque\nSpéciale du lanceur."

movedata MOVE_PSYCHIC_FANGS, "Psycho-Croc"
    battleeffect MOVE_EFFECT_REMOVE_SCREENS
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PSYCHIC_FANGS, "Le lanceur mord la\ncible avec ses pou-\nvoirs psychiques.\nBrise aussi les\nbarrières."

movedata MOVE_STOMPING_TANTRUM, "Trépignement"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STOMPING_TANTRUM, "S’il le lanceur a utilisé\nune capacité qui a\néchoué au tour\nprécédent, la puis-\nsance est doublée."

movedata MOVE_SHADOW_BONE, "Os Ombre"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_GHOST
    accuracy 100
    pp 10
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SHADOW_BONE, "Le lanceur frappe\navec un os possédé\npar l’âme d’un défunt.\nPeut aussi baisser la\nDéfense de la cible."

movedata MOVE_ACCELEROCK, "Vif Roc"
    battleeffect MOVE_EFFECT_PRIORITY_1
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_ROCK
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ACCELEROCK, "Le lanceur charge\nla cible à toute\nvitesse.\nFrappe en priorité."

movedata MOVE_LIQUIDATION, "Aqua-Brèche"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_WATER
    accuracy 100
    pp 10
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LIQUIDATION, "Le lanceur utilise la\nforce de l’eau pour\nattaquer. Peut aussi\nbaisser la Défense\nde la cible."

movedata MOVE_PRISMATIC_LASER, "Laser Prisme"
    battleeffect MOVE_EFFECT_RECHARGE_AFTER
    pss SPLIT_SPECIAL
    basepower 160
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PRISMATIC_LASER, "Le lanceur utilise la\npuissance d’un\nprisme pour envoyer\nun laser. Il doit se re-\nposer au tour suivant."

movedata MOVE_SPECTRAL_THIEF, "Clepto-Mânes"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_GHOST
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPECTRAL_THIEF, "Le lanceur plonge\ndans l’ombre de la\ncible, vole ses aug-\nmentations de stats\net l’attaque."

movedata MOVE_SUNSTEEL_STRIKE, "Choc Météore"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SUNSTEEL_STRIKE, "Le lanceur fonce sur\nla cible avec la puis-\nsance d’une\nmétéorite. Ignore le\ntalent de la cible."

movedata MOVE_MOONGEIST_BEAM, "Rayon Spectral"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_GHOST
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MOONGEIST_BEAM, "Le lanceur attaque\navec un rayon de\nlumière mystérieux.\nIgnore le talent de\nla cible."

movedata MOVE_TEARFUL_LOOK, "Larme à l'Œil"
    battleeffect MOVE_EFFECT_ATK_SP_ATK_DOWN
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_CUTE
    terminatedata
    movedescription MOVE_TEARFUL_LOOK, "Le lanceur regarde\nla cible avec des yeux\nremplis de larmes.\nElle voit son Atk. et\nson Atk. Spé. baisser."

movedata MOVE_ZING_ZAP, "Électrikipik"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_ELECTRIC
    accuracy 100
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ZING_ZAP, "Le lanceur fonce sur\nla cible et lui envoie\nun puissant choc\nélectrique, ce qui\npeut aussi l’effrayer."

movedatalongname MOVE_NATURES_MADNESS, "IreDeLaNature", "Ire de la Nature"
    battleeffect MOVE_EFFECT_HALVE_HP
    pss SPLIT_SPECIAL
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_NATURES_MADNESS, "Le lanceur déchaîne\ntoute la colère de la\nnature pour baisser\nles PV de la cible\nde moitié."

movedata MOVE_MULTI_ATTACK, "Coup Varia-Type"
    battleeffect MOVE_EFFECT_MULTI_ATTACK
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MULTI_ATTACK, "Le type de la capacité\ndépend de la ROM\ninstallée."

movedata MOVE_10_000_000_VOLT_THUNDERBOLT, "Giga-Tonnerre"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 195
    type TYPE_ELECTRIC
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_10_000_000_VOLT_THUNDERBOLT, "Pikachu (wearing a\ncap) unleashes a jolt\nof electricity using\nits Z-Power. Critical\nhits land more easily."

movedata MOVE_MIND_BLOWN, "Caboche-Kaboum"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MIND_BLOWN, "Le lanceur fait explo-\nser sa tête pour\nattaquer toutes les\ncibles. Il subit aussi\ndes dégâts."

movedata MOVE_PLASMA_FISTS, "Plasma Punch"
    battleeffect MOVE_EFFECT_ION_DELUGE_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_ELECTRIC
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_BEAUTY // Reflects the contest type for Ion Deluge.
    terminatedata
    movedescription MOVE_PLASMA_FISTS, "Le lanceur attaque en\nprojetant de l’électri-\ncité avec ses poings.\nConvertit les attaques\nde Normal en Électrik."

movedata MOVE_PHOTON_GEYSER, "Photo-Geyser"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_PSYCHIC
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PHOTON_GEYSER, "Compare l’Atk. et\nl’Atk. Spé., et utilise\ncelle qui infligera le\nplus de dégâts."

movedatalongname MOVE_LIGHT_THAT_BURNS_THE_SKY, "ApocalypsisLumi", "Apocalypsis Luminis"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 200
    type TYPE_PSYCHIC
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LIGHT_THAT_BURNS_THE_SKY, "Necrozma inflicts damage\nusing Attack or Sp. Atk-\nwhichever is higher.\nThis move ignores the\ntarget's Ability."

movedatalongname MOVE_SEARING_SUNRAZE_SMASH, "Hélio-Choc", "Hélio-Choc Dévastateur"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 200
    type TYPE_STEEL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SEARING_SUNRAZE_SMASH, "After obtaining Z-Power,\nSolgaleo attacks the\ntarget. This move can\nignore the effect of the\ntarget's Ability."

movedatalongname MOVE_MENACING_MOONRAZE_MAELSTROM, "RayonsSélénites", "Rayons Séléno-Explosifs"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 200
    type TYPE_GHOST
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MENACING_MOONRAZE_MAELSTROM, "After obtaining Z-Power,\nLunala attacks the\ntarget. This move can\nignore the effect of the\ntarget's Ability."

movedatalongname MOVE_LETS_SNUGGLE_FOREVER, "PatatiPatatrape", "Patati-Patattrape"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 190
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LETS_SNUGGLE_FOREVER, "After obtaining\nZ-Power, the user,\nMimikyu, punches the\ntarget with full\nforce."

movedatalongname MOVE_SPLINTERED_STORMSHARDS, "Roches-Lames", "Hurlement des Roches-Lames"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 190
    type TYPE_ROCK
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPLINTERED_STORMSHARDS, "After obtaining\nZ-Power, Lycanroc\nattacks the target.\nThis move also\ndestroys terrain."

movedatalongname MOVE_CLANGOROUS_SOULBLAZE, "Dracacophonie", "Dracacophonie Flamboyante"
    battleeffect MOVE_EFFECT_RAISE_ALL_STATS_HIT
    pss SPLIT_SPECIAL
    basepower 185
    type TYPE_DRAGON
    accuracy 0
    pp 1
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CLANGOROUS_SOULBLAZE, "After obtaining Z-Power, Kommo-o attacks. This move boosts the all the user's stats at once."

movedata MOVE_ZIPPY_ZAP, "Pika-Sprint"
    battleeffect MOVE_EFFECT_RAISE_EVA_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_ELECTRIC
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 2
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ZIPPY_ZAP, "The user attacks with\nhigh-speed bursts of\nelectricity. This move\nboosts Evasion and\nalways goes first."

movedata MOVE_SPLISHY_SPLASH, "Pika-Splash"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_WATER
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPLISHY_SPLASH, "The user charges a huge\nwave with electricity.\nThis may also leave the\nopposing Pokémon with\nparalysis."

movedata MOVE_FLOATY_FALL, "Pika-Piqué"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_FLYING
    accuracy 95
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FLOATY_FALL, "The user floats in the\nair, then dives at a\nsteep angle to attack.\nThis may also make the\ntarget flinch."

movedata MOVE_PIKA_PAPOW, "Pika-Fracas"
    battleeffect MOVE_EFFECT_POWER_BASED_ON_FRIENDSHIP
    pss SPLIT_SPECIAL
    basepower 0
    type TYPE_ELECTRIC
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PIKA_PAPOW, "The more Pikachu\nloves its Trainer,\nthe greater the\nmove's power.\nIt never misses."

movedata MOVE_BOUNCY_BUBBLE, "Évo-Thalasso"
    battleeffect MOVE_EFFECT_RECOVER_FULL_DAMAGE_DEALT
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_WATER
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BOUNCY_BUBBLE, "The user attacks by\nshooting water\nbubbles, which restore\nits HP by half the\ndamage dealt."

movedata MOVE_BUZZY_BUZZ, "Évo-Dynamo"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_ELECTRIC
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BUZZY_BUZZ, "The user shoots a jolt\nof electricity to\nattack the target.\nThis also leaves the\ntarget with paralysis."

movedata MOVE_SIZZLY_SLIDE, "Évo-Flambo"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_FIRE
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SIZZLY_SLIDE, "The user cloaks itself\nin fire and charges at\nthe target.\nThis also leaves the\ntarget with a burn."

movedata MOVE_GLITZY_GLOW, "Évo-Psycho"
    battleeffect MOVE_EFFECT_SET_LIGHT_SCREEN_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_PSYCHIC
    accuracy 95
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GLITZY_GLOW, "The user bombards the\ntarget with\ntelekinetic force,\nsuppressing damage\nfrom special moves."

movedata MOVE_BADDY_BAD, "Évo-Ténébro"
    battleeffect MOVE_EFFECT_SET_REFLECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_DARK
    accuracy 95
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BADDY_BAD, "The user acts bad and\nattacks the target,\nsuppressing damage\nfrom physical moves."

movedata MOVE_SAPPY_SEED, "Évo-Écolo"
    battleeffect MOVE_EFFECT_LEECH_SEED_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_GRASS
    accuracy 90
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SAPPY_SEED, "The user scatters\nseeds to attack the\ntarget. The seeds\ndrain the target's HP\nevery turn."

movedata MOVE_FREEZY_FROST, "Évo-Congélo"
    battleeffect MOVE_EFFECT_RESET_STAT_CHANGES_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_ICE
    accuracy 90
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FREEZY_FROST, "The user attacks with a\ncrystal made of frozen\nhaze. It eliminates\nevery stat change among\nall Pokémon in battle."

movedata MOVE_SPARKLY_SWIRL, "Évo-Fabulo"
    battleeffect MOVE_EFFECT_CURE_PARTY_STATUS_HIT
    pss SPLIT_SPECIAL
    basepower 120
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 85
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPARKLY_SWIRL, "The user attacks with\nan overpowering scent.\nThis also heals all\nstatus conditions of\nthe user's party."

movedata MOVE_VEEVEE_VOLLEY, "Évo-Chardasso"
    battleeffect MOVE_EFFECT_POWER_BASED_ON_FRIENDSHIP
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT | FLAG_UNUSABLE_IN_GEN_8 | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_VEEVEE_VOLLEY, "The more Eevee\nloves its Trainer,\nthe greater the\nmove's power.\nIt never misses."

movedata MOVE_DOUBLE_IRON_BASH, "Écrous d'Poing"
    battleeffect MOVE_EFFECT_HIT_TWICE_AND_FLINCH
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DOUBLE_IRON_BASH, "Le lanceur frappe la\ncible avec ses bras\ndeux fois d’affilée,\nce qui peut aussi\napeurer celle-ci."

movedata MOVE_MAX_GUARD, "Gardomax"
    battleeffect MOVE_EFFECT_PROTECT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 4
    flags FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_GUARD, "This move protects the\nuser from all attacks.\nIts chance of failing\nrises if it is used in\nsuccession."

movedata MOVE_DYNAMAX_CANNON, "Canon Dynamax"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_DRAGON
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DYNAMAX_CANNON, "The user condenses\nenergy within its body\nand unleashes that\nenergy from its core\nto inflict damage."

movedatalongname MOVE_SNIPE_SHOT, "TirDePrécision", "Tir de Précision"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_WATER
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SNIPE_SHOT, "The user ignores\nopposing Pokémon's moves\nand Abilities that draw\nin moves, allowing it to\nhit the chosen target."

movedata MOVE_JAW_LOCK, "Croque Fort"
    battleeffect MOVE_EFFECT_PREVENT_ESCAPE_BOTH_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_JAW_LOCK, "This move prevents the\nuser and the target from\nswitching out until\neither of them faints or\nleaves the field."

movedata MOVE_STUFF_CHEEKS, "Garde-à-Joues"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STUFF_CHEEKS, "The user eats its\nheld Berry, then\nsharply boosts its\nDefense stat."

movedata MOVE_NO_RETREAT, "Ultime Bastion"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIGHTING
    accuracy 0
    pp 5
    effectchance 100
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_NO_RETREAT, "This move boosts all\nthe user's stats but\nprevents the user\nfrom switching out\nor fleeing."

movedata MOVE_TAR_SHOT, "Goudronnage"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ROCK
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_SMART
    terminatedata
    movedescription MOVE_TAR_SHOT, "The user pours tar on\nthe target, dropping\ntheir Speed stat.\nFire attacks deal\nmore damage."

movedata MOVE_MAGIC_POWDER, "Poudre Magique"
    battleeffect MOVE_EFFECT_CHANGE_TO_PSYCHIC_TYPE
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_BEAUTY
    terminatedata
    movedescription MOVE_MAGIC_POWDER, "The user scatters a\ncloud of magic powder\nthat changes the\ntarget's type to\nPsychic."

movedata MOVE_DRAGON_DARTS, "Draco-Flèches"
    battleeffect MOVE_EFFECT_HIT_TWICE
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_DRAGON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRAGON_DARTS, "The user attacks twice\nusing Dreepy. If there\nare two opposing\nPokémon, this move\nhits each of them once."

movedata MOVE_TEATIME, "Thérémonie"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER | RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TEATIME, "The user has teatime\nwith all the Pokémon\ncurrently in the battle.\nEach Pokémon eats its\nheld Berry."

movedata MOVE_OCTOLOCK, "Octoprise"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIGHTING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_OCTOLOCK, "The user prevents the\ntarget from fleeing.\nThis move also lowers\nthe target's Defense\nand Sp. Def every turn."

movedata MOVE_BOLT_BEAK, "Prise de Bec"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_IF_FASTER
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_ELECTRIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BOLT_BEAK, "The user stabs with its\nelectrified beak. This\nmove's power is doubled\nif the user moves before\nthe target."

movedata MOVE_FISHIOUS_REND, "Branchicrok"
    battleeffect MOVE_EFFECT_DOUBLE_POWER_IF_FASTER
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_WATER
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FISHIOUS_REND, "The user rends with its\nhard gills. If the user\nattacks before the\ntarget, the power of\nthis move is doubled."

movedata MOVE_COURT_CHANGE, "Change-Côté"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_COURT_CHANGE, "With its mysterious\npower, the user swaps\nthe effects on either\nside of the field."

movedata MOVE_MAX_FLARE, "Pyromax"
    battleeffect MOVE_EFFECT_HIT // TODO: Replace with MOVE_EFFECT_SUN_HIT once implemented.
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_FIRE
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_FLARE, "This is a Fire-type\nattack Dynamax Pokémon\nuse. The user\nintensifies the sun\nfor five turns."

movedata MOVE_MAX_FLUTTERBY, "Insectomax"
    battleeffect MOVE_EFFECT_LOWER_SP_ATK_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_BUG
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_FLUTTERBY, "This is a Bug-type\nattack Dynamax Pokémon\nuse. This lowers the\ntarget's Sp. Atk stat."

movedata MOVE_MAX_LIGHTNING, "Fulguromax"
    battleeffect MOVE_EFFECT_HIT // TODO: Replace with MOVE_EFFECT_ELECTRIC_TERRAIN_HIT once implemented.
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_ELECTRIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_LIGHTNING, "This is an Electric-type\nattack Dynamax Pokémon\nuse. The user turns the\nground into Electric\nTerrain for five turns."

movedata MOVE_MAX_STRIKE, "Normalomax"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_STRIKE, "This is a Normal-type\nattack Dynamax Pokémon\nuse. This lowers the\ntarget's Speed stat."

movedata MOVE_MAX_KNUCKLE, "Pugilomax"
    battleeffect MOVE_EFFECT_RAISE_ATTACK_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_FIGHTING
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_KNUCKLE, "This is a Fighting-type\nattack Dynamax Pokémon\nuse. This boosts ally\nPokémon's Attack stats."

movedata MOVE_MAX_PHANTASM, "Spectromax"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_GHOST
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_PHANTASM, "This is a Ghost-type\nattack Dynamax Pokémon\nuse. This lowers the\ntarget's Defense stat."

movedata MOVE_MAX_HAILSTORM, "Cryomax"
    battleeffect (SNOW_WARNING_GENERATION >= 9) ? MOVE_EFFECT_HIT : MOVE_EFFECT_HIT // TODO: Replace the left with MOVE_EFFECT_SNOW_HIT and right with MOVE_EFFECT_HAIL_HIT once implemented.
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_ICE
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_HAILSTORM, (SNOW_WARNING_GENERATION >= 9) ? "This is an Ice-type\nattack Dynamax Pokémon\nuse. The user summons\na snowstorm lasting\nfive turns." : "This is an Ice-type\nattack Dynamax Pokémon\nuse. The user summons\na hailstorm lasting\nfive turns."

movedata MOVE_MAX_OOZE, "Toxinomax"
    battleeffect MOVE_EFFECT_RAISE_SP_ATK_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_POISON
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_OOZE, "This is a Poison-type\nattack Dynamax Pokémon\nuse. This boosts ally\nPokémon's Sp. Atk\nstats."

movedata MOVE_MAX_GEYSER, "Hydromax"
    battleeffect MOVE_EFFECT_HIT // TODO: Replace with MOVE_EFFECT_RAIN_HIT once implemented.
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_WATER
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_GEYSER, "This is a Water-type\nattack Dynamax Pokémon\nuse. The user summons\na heavy rain that\nfalls for five turns."

movedata MOVE_MAX_AIRSTREAM, "Aéromax"
    battleeffect MOVE_EFFECT_RAISE_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_FLYING
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_AIRSTREAM, "This is a Flying-type\nattack Dynamax Pokémon\nuse. This boosts ally\nPokémon's Speed stats."

movedata MOVE_MAX_STARFALL, "Enchantomax"
    battleeffect MOVE_EFFECT_HIT // TODO: Replace with MOVE_EFFECT_MISTY_TERRAIN_HIT once implemented.
    pss SPLIT_PHYSICAL
    basepower 10
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_STARFALL, "This is a Fairy-type\nattack Dynamax Pokémon\nuse. The user turns the\nground into Misty\nTerrain for five turns."

movedata MOVE_MAX_WYRMWIND, "Dracomax"
    battleeffect MOVE_EFFECT_LOWER_ATTACK_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_DRAGON
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_WYRMWIND, "This is a Dragon-type\nattack Dynamax Pokémon\nuse. This lowers the\ntarget's Attack stat."

movedata MOVE_MAX_MINDSTORM, "Psychomax"
    battleeffect MOVE_EFFECT_HIT // TODO: Replace with MOVE_EFFECT_PSYCHIC_TERRAIN_HIT once implemented.
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_MINDSTORM, "This is a Psychic-type\nattack Dynamax Pokémon\nuse. The user turns the\nground into Psychic\nTerrain for five turns."

movedata MOVE_MAX_ROCKFALL, "Lithomax"
    battleeffect MOVE_EFFECT_HIT // TODO: Replace with MOVE_EFFECT_SANDSTORM_HIT once implemented.
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_ROCK
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_ROCKFALL, "This is a Rock-type\nattack Dynamax Pokémon\nuse. The user summons\na sandstorm lasting\nfive turns."

movedata MOVE_MAX_QUAKE, "Sismomax"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_GROUND
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_QUAKE, "This is a Ground-type\nattack Dynamax Pokémon\nuse. This boosts ally\nPokémon's Sp. Def\nstats."

movedata MOVE_MAX_DARKNESS, "Sinistromax"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_DARK
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_DARKNESS, "This is a Dark-type\nattack Dynamax Pokémon\nuse. This lowers the\ntarget's Sp. Def stat."

movedata MOVE_MAX_OVERGROWTH, "Phytomax"
    battleeffect MOVE_EFFECT_HIT // TODO: Replace with MOVE_EFFECT_GRASSY_TERRAIN_HIT once implemented.
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_GRASS
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_OVERGROWTH, "This is a Grass-type\nattack Dynamax Pokémon\nuse. The user turns the\nground into Grassy\nTerrain for five turns."

movedata MOVE_MAX_STEELSPIKE, "Métallomax"
    battleeffect MOVE_EFFECT_RAISE_DEF_HIT
    pss SPLIT_PHYSICAL
    basepower 10
    type TYPE_STEEL
    accuracy 0
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAX_STEELSPIKE, "This is a Steel-type\nattack Dynamax Pokémon\nuse. This boosts ally\nPokémon's Defense\nstats."

movedata MOVE_CLANGOROUS_SOUL, "Dracacophonie"
    battleeffect MOVE_EFFECT_RAISE_ALL_STATS_LOSE_THIRD_MAX_HP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DRAGON
    accuracy 100
    pp 5
    effectchance 100
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CLANGOROUS_SOUL, "The user boosts all\nits stats by using\nsome of its own HP."

movedata MOVE_BODY_PRESS, "Big Splash"
    battleeffect MOVE_EFFECT_HIT // Handled in CalcBaseDamage.c.
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BODY_PRESS, "The user slams its\nbody into the target.\nThe higher the user's\nDefense stat, the\ngreater the damage."

movedata MOVE_DECORATE, "Nappage"
    battleeffect MOVE_EFFECT_DECORATE
    pss SPLIT_STATUS
    basepower 0
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 0
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DECORATE, "The user sharply\nboosts the target's\nAttack and Sp. Atk\nstats by decorating\nthe target."

movedata MOVE_DRUM_BEATING, "Tambour Battant"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRUM_BEATING, "The user plays its drum,\ncontrolling the drum's\nroots to attack the\ntarget. This also lowers\nthe target's Speed stat."

movedata MOVE_SNAP_TRAP, "Troquenard"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 35
    type TYPE_GRASS
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SNAP_TRAP, "The user snares the\ntarget in a snap trap\nthat inflicts damage\nfor four to five\nturns."

movedata MOVE_PYRO_BALL, "Ballon Brûlant"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_FIRE
    accuracy 90
    pp 5
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PYRO_BALL, "The user ignites a small\nstone and launches it as\na fiery ball. This may\nalso leave the target\nwith a burn."

movedata MOVE_BEHEMOTH_BLADE, "Gladius Maximus"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BEHEMOTH_BLADE, "The user wields a\nlarge, powerful sword\nusing its whole body\nand cuts the target\nin a vigorous attack."

movedata MOVE_BEHEMOTH_BASH, "Aegis Maxima"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BEHEMOTH_BASH, "The user's body\nbecomes a firm shield\nand slams into the\ntarget fiercely."

movedata MOVE_AURA_WHEEL, "Roue Libre"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 110
    type TYPE_ELECTRIC
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_AURA_WHEEL, "Morpeko attacks and\nboosts its Speed stat.\nThis move's type\nchanges depending on\nthe user's form."

movedata MOVE_BREAKING_SWIPE, "Abattage"
    battleeffect MOVE_EFFECT_LOWER_ATTACK_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_DRAGON
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BREAKING_SWIPE, "The user swings its\ntough tail and attacks\nopposing Pokémon.\nThis also lowers their\nAttack stats."

movedata MOVE_BRANCH_POKE, "Tapotige"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_GRASS
    accuracy 100
    pp 40
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BRANCH_POKE, "The user attacks the\ntarget by poking it\nwith a sharply\npointed branch."

movedata MOVE_OVERDRIVE, "Overdrive"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_ELECTRIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_OVERDRIVE, "The user attacks by\ntwanging a guitar or\nbass guitar, causing a\nhuge echo and strong\nvibration."

movedata MOVE_APPLE_ACID, "Acide Malique"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_APPLE_ACID, "The user attacks with an\nacidic liquid created\nfrom tart apples. This\nalso lowers the target's\nSp. Def stat."

movedata MOVE_GRAV_APPLE, "Force G"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT // Damage portion handled in CalcBaseDamage.c.
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GRAV_APPLE, "The user inflicts\ndamage by dropping\nan apple from above.\nThis also lowers the\ntarget's Defense stat."

movedata MOVE_SPIRIT_BREAK, "Choc Émotionnel"
    battleeffect MOVE_EFFECT_LOWER_SP_ATK_HIT
    pss SPLIT_PHYSICAL
    basepower 75
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPIRIT_BREAK, "The user attacks with\nenough force to break\nthe target's spirit.\nThis also lowers the\ntarget's Sp. Atk stat."

movedata MOVE_STRANGE_STEAM, "Vapeur Féérique"
    battleeffect MOVE_EFFECT_CONFUSE_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STRANGE_STEAM, "The user attacks the\ntarget by emitting\nsteam.\nThis may also\nconfuse the target."

movedata MOVE_LIFE_DEW, "Fontaine de Vie"
    battleeffect MOVE_EFFECT_LIFE_DEW
    pss SPLIT_STATUS
    basepower 0
    type TYPE_WATER
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LIFE_DEW, "The user scatters\nmysterious water around\nand restores the HP of\nitself and its allies\ncurrently in battle."

movedata MOVE_OBSTRUCT, "Blocage"
    battleeffect MOVE_EFFECT_PROTECT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_USER
    priority 4
    flags 0
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_OBSTRUCT, "The user protects itself\nfrom damage while\nharshly lowering the\nDefense of any attacker\nthat makes contact."

movedata MOVE_FALSE_SURRENDER, "Fourbette"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_DARK
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FALSE_SURRENDER, "The user pretends to\nbow its head, but then\nit stabs the target\nwith its hair. This\nattack never misses."

movedata MOVE_METEOR_ASSAULT, "Joute Astrale"
    battleeffect MOVE_EFFECT_RECHARGE_AFTER
    pss SPLIT_PHYSICAL
    basepower 150
    type TYPE_FIGHTING
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_METEOR_ASSAULT, "The user attacks\nwildly with its thick\nleek.\nThe user can't move\non the next turn."

movedata MOVE_ETERNABEAM, "Laser Infinimax"
    battleeffect MOVE_EFFECT_RECHARGE_AFTER
    pss SPLIT_SPECIAL
    basepower 160
    type TYPE_DRAGON
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_UNUSABLE_IN_GEN_9
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ETERNABEAM, "This is Eternatus's\nmost powerful attack\nin its original form.\nThe user can't move\non the next turn."

movedata MOVE_STEEL_BEAM, "Métalaser"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 140
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STEEL_BEAM, "The user fires a beam\nof steel that it\ncollected from its\nentire body. This also\ndamages the user."

movedata MOVE_EXPANDING_FORCE, "Vaste Pouvoir"
    battleeffect MOVE_EFFECT_HIT // Damage portion handled in CalcBaseDamage.c.
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_EXPANDING_FORCE, "The user attacks with\nits psychic power. This\nmove's power goes up and\ndamages all opponents on\nPsychic Terrain."

movedata MOVE_STEEL_ROLLER, "Métalliroue"
    battleeffect MOVE_EFFECT_END_TERRAIN
    pss SPLIT_PHYSICAL
    basepower 130
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STEEL_ROLLER, "The user attacks while\ndestroying the terrain.\nThis move fails if the\nground hasn't turned\ninto a terrain."

movedata MOVE_SCALE_SHOT, "Rafale Écailles"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 25
    type TYPE_DRAGON
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SCALE_SHOT, "The user attacks by\nshooting scales two to\nfive times in a row.\nThis raises Speed\nbut lowers Defense."

movedata MOVE_METEOR_BEAM, "Laser Météore"
    battleeffect MOVE_EFFECT_CHARGE_TURN_SP_ATK_UP
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_ROCK
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_METEOR_BEAM, "The user gathers\nenergy from space to\nraise its Sp. Atk on\nthe first turn, then\nattacks on the next."

movedata MOVE_SHELL_SIDE_ARM, "Kokiyarme"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_POISON
    accuracy 100
    pp 10
    effectchance 20
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SHELL_SIDE_ARM, "This move is either\nphysical or special,\nwhichever will inflict\nmore damage. This may\nalso poison the target."

movedata MOVE_MISTY_EXPLOSION, "Explo-Brume"
    battleeffect MOVE_EFFECT_HALVE_DEFENSE // Damage portion handled in CalcBaseDamage.c.
    pss SPLIT_SPECIAL
    basepower 100
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MISTY_EXPLOSION, "The user attacks\neverything around it\nand faints. This move's\npower is boosted on\nMisty Terrain."

movedata MOVE_GRASSY_GLIDE, "Gliss'Herbe"
    battleeffect MOVE_EFFECT_HIT // Priority handled in other_battle_calculators.c.
    pss SPLIT_PHYSICAL
    basepower 55
    type TYPE_GRASS
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GRASSY_GLIDE, "Gliding on the ground,\nthe user attacks the\ntarget. This move\nalways goes first on\nGrassy Terrain."

movedata MOVE_RISING_VOLTAGE, "Monte-Tension"
    battleeffect MOVE_EFFECT_HIT // Damage portion handled in CalcBaseDamage.c.
    pss SPLIT_SPECIAL
    basepower 70
    type TYPE_ELECTRIC
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RISING_VOLTAGE, "The user attacks with\nelectricity rising from\nthe ground. Its power is\ndoubled if the target is\non Electric Terrain."

movedata MOVE_TERRAIN_PULSE, "Champlification"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 50
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TERRAIN_PULSE, "The user utilizes the\nenergy of the terrain.\nThis move’s type and\npower change depending\non the current terrain."

movedata MOVE_SKITTER_SMACK, "Ravage Rampant"
    battleeffect MOVE_EFFECT_LOWER_SP_ATK_HIT
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_BUG
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SKITTER_SMACK, "The user skitters\nbehind the target to\nattack.\nThis also lowers the\ntarget's Sp. Atk stat."

movedata MOVE_BURNING_JEALOUSY, "Feu Envieux"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 70
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BURNING_JEALOUSY, "The user attacks with\nenergy from jealousy.\nThis burns all opposing\nPokémon that have had\ntheir stats boosted."

movedata MOVE_LASH_OUT, "Cent Rancunes"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_DARK
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LASH_OUT, "The user vents its\nfrustration. Its power is\ndoubled if the user's\nstats were lowered\nduring this turn."

movedata MOVE_POLTERGEIST, "Esprit Frappeur"
    battleeffect MOVE_EFFECT_POLTERGEIST
    pss SPLIT_PHYSICAL
    basepower 110
    type TYPE_GHOST
    accuracy 90
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_POLTERGEIST, "The user attacks by\ncontrolling the\ntarget's item. This\nmove fails if the foe\nisn't holding an item."

movedata MOVE_CORROSIVE_GAS, "Gaz Corrosif"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_POISON
    accuracy 100
    pp 40
    effectchance 0
    target RANGE_ALL_ADJACENT
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CORROSIVE_GAS, "The user surrounds\neverything around it\nwith highly acidic gas\nand melts away items\nheld by other Pokémon."

movedata MOVE_COACHING, "Coaching"
    battleeffect MOVE_EFFECT_COACHING
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIGHTING
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_ALLY
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_COACHING, "The user properly\ncoaches its ally\nPokémon, boosting\ntheir Attack and\nDefense stats."

movedata MOVE_FLIP_TURN, "Eau Revoir"
    battleeffect MOVE_EFFECT_SWITCH_HIT
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_WATER
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FLIP_TURN, "After making its\nattack, the user\nrushes back to switch\nplaces with a party\nPokémon in waiting."

movedata MOVE_TRIPLE_AXEL, "Triple Axel"
    battleeffect MOVE_EFFECT_HIT_THREE_TIMES_INCREMENT_BASE_POWER_20
    pss SPLIT_PHYSICAL
    basepower 20
    type TYPE_ICE
    accuracy 90
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TRIPLE_AXEL, "A consecutive\nthree-kick attack\nthat becomes more\npowerful with each\nsuccessful hit."

movedata MOVE_DUAL_WINGBEAT, "Double Volée"
    battleeffect MOVE_EFFECT_HIT_TWICE
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_FLYING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DUAL_WINGBEAT, "The user slams the\ntarget with its wings\nto inflict damage.\nThe target is hit\ntwice in a row."

movedata MOVE_SCORCHING_SANDS, "Sable Ardent"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 70
    type TYPE_GROUND
    accuracy 100
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SCORCHING_SANDS, "The user throws\nscorching sand at\nthe target to attack.\nThe target may also\nbe left with a burn."

movedatalongname MOVE_JUNGLE_HEALING, "SelveSalvatrice", "Selve Salvatrice"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER_SIDE
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_JUNGLE_HEALING, "The user restores HP and\ncures status conditions\nfor itself and its ally\nPokémon currently in the\nbattle."

movedata MOVE_WICKED_BLOW, "Poing Obscur"
    battleeffect MOVE_EFFECT_ALWAYS_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_DARK
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_WICKED_BLOW, "The user strikes\nthe target with a\nfierce blow.\nThis move always\nlands a critical hit."

movedatalongname MOVE_SURGING_STRIKES, "TorrentDeCoups", "Torrent de Coups"
    battleeffect MOVE_EFFECT_HIT_THREE_TIMES_ALWAYS_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 25
    type TYPE_WATER
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SURGING_STRIKES, "The user strikes the\ntarget with a flowing\nmotion three times in\na row. This move always\nlands a critical hit."

movedata MOVE_THUNDER_CAGE, "Voltageôle"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_ELECTRIC
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_THUNDER_CAGE, "The user traps the\ntarget inside a cage of\nsparking electricity\nthat inflicts damage\nfor four to five turns."

movedata MOVE_DRAGON_ENERGY, "Draco-Énergie"
    battleeffect MOVE_EFFECT_DECREASE_POWER_WITH_LESS_USER_HP
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_DRAGON
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRAGON_ENERGY, "The user converts its\nlife-force into power.\nThe lower the user's\nHP, the lower the\nmove's power."

movedata MOVE_FREEZING_GLARE, "Regard Glaçant"
    battleeffect MOVE_EFFECT_FREEZE_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FREEZING_GLARE, "The user shoots its\npsychic power from\nits eyes to attack.\nThis may also leave\nthe target frozen."

movedata MOVE_FIERY_WRATH, "Fureur Ardente"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_SPECIAL
    basepower 90
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 20
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FIERY_WRATH, "The user transforms its\nwrath into a fire-like\naura to attack. This may\nalso make opposing\nPokémon flinch."

movedata MOVE_THUNDEROUS_KICK, "Coup Fulgurant"
    battleeffect MOVE_EFFECT_LOWER_DEFENSE_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_THUNDEROUS_KICK, "With lightning-like\nmovement, the user\ndelivers a kick. This\nalso lowers the\ntarget's Defense stat."

movedata MOVE_GLACIAL_LANCE, "Lance de Glace"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 130
    type TYPE_ICE
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GLACIAL_LANCE, "The user attacks by\nhurling a\nblizzard-cloaked\nicicle lance at\nopposing Pokémon."

movedata MOVE_ASTRAL_BARRAGE, "Éclat Spectral"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_GHOST
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ASTRAL_BARRAGE, "The user attacks by\nsending a frightful\namount of small\nghosts at opposing\nPokémon."

movedata MOVE_EERIE_SPELL, "Sort Sinistre"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_PSYCHIC
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_EERIE_SPELL, "The user attacks with\nits tremendous psychic\npower. This also drains\n3 PP from the move last\nused by the target."

// Moves introduced in Generation VIII (LA):
movedatalongname MOVE_DIRE_CLAW, "GriffesFunestes", "Griffes Funestes"
    battleeffect MOVE_EFFECT_SLEEP_POISON_PARALYZE_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_POISON
    accuracy 100
    pp 15
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DIRE_CLAW, "The user lashes out\nat the target with\nruinous claws. May\nalso poison, paralyze,\nor sleep the target."

movedata MOVE_PSYSHIELD_BASH, "Sprint Bouclier"
    battleeffect MOVE_EFFECT_RAISE_DEF_HIT
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PSYSHIELD_BASH, "Cloaked in psychic\nenergy, the user slams\ninto the target. This\nalso boosts the user’s\nDefense stat."

movedata MOVE_POWER_SHIFT, "Échange Force"
    battleeffect MOVE_EFFECT_SWAP_ATK_DEF
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_POWER_SHIFT, "The user swaps its\nAttack and Defense\nstats."

movedata MOVE_STONE_AXE, "Hache de Pierre"
    battleeffect MOVE_EFFECT_STEALTH_ROCK_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_ROCK
    accuracy 90
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_STONE_AXE, "The user swings its\nstone axes at the\ntarget. Splinters left\nbehind by this attack\nfloat around the target."

movedatalongname MOVE_SPRINGTIDE_STORM, "TyphonPassionné", "Typhon Passionné"
    battleeffect MOVE_EFFECT_LOWER_ATTACK_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 80
    pp 5
    effectchance 30
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPRINGTIDE_STORM, "The user wraps foes in\nfierce winds brimming\nwith love and hate.\nThis may also lower\ntheir Attack stats."

movedata MOVE_MYSTICAL_POWER, "Force Mystique"
    battleeffect MOVE_EFFECT_RAISE_SP_ATK_HIT
    pss SPLIT_SPECIAL
    basepower 70
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MYSTICAL_POWER, "The user attacks by\nemitting a mysterious\npower.\nThis also boosts the\nuser’s Sp. Atk stat."

movedata MOVE_RAGING_FURY, "Grand Courroux"
    battleeffect MOVE_EFFECT_CONTINUE_AND_CONFUSE_SELF
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_RANDOM_OPPONENT
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RAGING_FURY, "The user rampages\naround spewing flames\nfor two to three turns.\nThe user then becomes\nconfused."

movedata MOVE_WAVE_CRASH, "Aquatacle"
    battleeffect MOVE_EFFECT_RECOIL_THIRD
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_WATER
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_WAVE_CRASH, "The user shrouds\nitself in water and\nslams into the target.\nThis also damages the\nuser quite a lot."

movedata MOVE_CHLOROBLAST, "Herblast"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 150
    type TYPE_GRASS
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CHLOROBLAST, "The user launches its\namassed chlorophyll\nto inflict damage on\nthe target. This also\ndamages the user."

movedata MOVE_MOUNTAIN_GALE, "Bise Glaciaire"
    battleeffect MOVE_EFFECT_FLINCH_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_ICE
    accuracy 85
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MOUNTAIN_GALE, "The user hurls giant\nchunks of ice at the\ntarget to inflict\ndamage. This may also\nmake the target flinch."

movedata MOVE_VICTORY_DANCE, "Danse Victoire"
    battleeffect MOVE_EFFECT_ATK_DEF_SPEED_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIGHTING
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_VICTORY_DANCE, "The user performs an\nintense dance to usher\nin victory, boosting\nits Attack, Defense,\nand Speed stats."

movedata MOVE_HEADLONG_RUSH, "Assaut Frontal"
    battleeffect MOVE_EFFECT_USER_DEF_SP_DEF_DOWN_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_GROUND
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HEADLONG_RUSH, "The user smashes into\nthe target in a\nfull-body tackle. This\nalso lowers the user’s\nDefense and Sp. Def."

movedata MOVE_BARB_BARRAGE, "Multitoxik"
    battleeffect MOVE_EFFECT_POISON_HIT_DOUBLE_POWER_ON_POISONED
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_POISON
    accuracy 100
    pp 10
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BARB_BARRAGE, "The user launches barbs\nwhich may poison the\ntarget. Its power is\ndoubled if the target\nis already poisoned."

movedata MOVE_ESPER_WING, "Ailes Psycho"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL_RAISE_SPEED_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ESPER_WING, "The user slashes with\naura-enriched wings and\nboosts its Speed. This\nmove has a heightened\ncritical hit chance."

movedata MOVE_BITTER_MALICE, "Cœur de Rancœur"
    battleeffect MOVE_EFFECT_LOWER_ATTACK_HIT
    pss SPLIT_SPECIAL
    basepower 75
    type TYPE_GHOST
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BITTER_MALICE, "The user attacks the\ntarget with spine-\nchilling resentment.\nThis also lowers the\ntarget’s Attack stat."

movedata MOVE_SHELTER, "Mur Fumigène"
    battleeffect MOVE_EFFECT_DEF_UP_2
    pss SPLIT_STATUS
    basepower 0
    type TYPE_STEEL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SHELTER, "The user makes its\nskin as hard as an\niron shield,\nsharply boosting\nits Defense stat."

movedata MOVE_TRIPLE_ARROWS, "Triple Flèche"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TRIPLE_ARROWS, "The user kicks and fires\nthree arrows. This has a\nhigh critical hit chance\nand may lower Defense or\nmake the target flinch."

movedata MOVE_INFERNAL_PARADE, "Cortège Funèbre"
    battleeffect MOVE_EFFECT_BURN_HIT_DOUBLE_POWER_ON_STATUS
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_GHOST
    accuracy 100
    pp 15
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_INFERNAL_PARADE, "The user summons myriad\nfireballs which may burn\nthe target. Its power is\ndoubled if the target\nhas a status condition."

movedata MOVE_CEASELESS_EDGE, "Vagues à Lames"
    battleeffect MOVE_EFFECT_SET_SPIKES_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_DARK
    accuracy 90
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CEASELESS_EDGE, "The user slashes its\nshell blade at the\ntarget. Shell\nsplinters left behind\nremain as spikes."

movedata MOVE_BLEAKWIND_STORM, "Typhon Hivernal"
    battleeffect MOVE_EFFECT_BLEAKWIND_STORM // Accuracy in rain handled in other_battle_calculators.c.
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_FLYING
    accuracy 80
    pp 10
    effectchance 30
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BLEAKWIND_STORM, "The user attacks with\nsavagely cold winds.\nThis may also lower\nthe Speed stats of\nopposing Pokémon."

movedatalongname MOVE_WILDBOLT_STORM, "TyphonFulgurant", "Typhon Fulgurant"
    battleeffect MOVE_EFFECT_WILDBOLT_STORM // Accuracy in rain handled in other_battle_calculators.c.
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_ELECTRIC
    accuracy 80
    pp 10
    effectchance 30
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_WILDBOLT_STORM, "The user savagely\nattacks with\nlightning and wind.\nIt may also leave\nopponents paralyzed."

movedatalongname MOVE_SANDSEAR_STORM, "TyphonPyrosable", "Typhon Pyrosable"
    battleeffect MOVE_EFFECT_SANDSEAR_STORM // Accuracy in rain handled in other_battle_calculators.c.
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_GROUND
    accuracy 80
    pp 10
    effectchance 30
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SANDSEAR_STORM, "The user wraps opposing\nPokémon in fierce winds\nand searingly hot sand.\nThis may also leave them\nwith a burn."

movedata MOVE_LUNAR_BLESSING, "Prière Lunaire"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 5
    effectchance 0
    target RANGE_ALLY
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LUNAR_BLESSING, "The user receives a\nblessing from the moon,\nrestoring HP and curing\nstatus conditions for\nitself and its allies."

movedata MOVE_TAKE_HEART, "Extravaillance"
    battleeffect MOVE_EFFECT_TAKE_HEART
    pss SPLIT_STATUS
    basepower 0
    type TYPE_PSYCHIC
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_ALLY
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TAKE_HEART, "The user lifts its\nspirits, curing its\nown status conditions\nand boosting its Sp.\nAtk and Sp. Def stats."

// Moves introduced in Generation IX:
movedata MOVE_TERA_BLAST, "Téra Explosion"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TERA_BLAST, "If Terastallized, the\nuser unleashes energy of\nits Tera Type. It can\nuse Attack or Sp. Atk-\nwhichever is higher."

movedata MOVE_SILK_TRAP, "Piège de Fil"
    battleeffect MOVE_EFFECT_PROTECT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_BUG
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 4
    flags 0
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SILK_TRAP, "The user spins a silken\ntrap, protecting itself\nwhile lowering the Speed\nof any attacker that\nmakes direct contact."

movedata MOVE_AXE_KICK, "Talon-Marteau"
    battleeffect MOVE_EFFECT_CONFUSE_AND_CRASH_IF_MISS
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_FIGHTING
    accuracy 90
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_AXE_KICK, "The user slams its heel\ndown upon the target,\nwhich may also confuse\nthem. If it misses, the\nuser is hurt instead."

movedatalongname MOVE_LAST_RESPECTS, "HommagePosthume", "Hommage Posthume"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_GHOST
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LAST_RESPECTS, "The user attacks to\navenge its allies. The\nmore defeated allies\nin the user's party,\nthe greater its power."

movedata MOVE_LUMINA_CRASH, "Lumino-Impact"
    battleeffect MOVE_EFFECT_LOWER_SP_DEF_2_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_LUMINA_CRASH, "The user unleashes a\npeculiar light that even\naffects the mind. This\nalso harshly lowers the\ntarget's Sp. Def stat."

movedata MOVE_ORDER_UP, "Plat du Jour"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_DRAGON
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ORDER_UP, "The user attacks with\nelegant poise. If it has\na Tatsugiri in its\nmouth, this move boosts\none of the user's stats."

movedata MOVE_JET_PUNCH, "Poing Sonique"
    battleeffect MOVE_EFFECT_PRIORITY_1
    pss SPLIT_PHYSICAL
    basepower 60
    type TYPE_WATER
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_JET_PUNCH, "The user summons a\ntorrent around its\nfist and punches at\nblinding speed. It is\nsure to strike first."

movedata MOVE_SPICY_EXTRACT, "Habanerage"
    battleeffect MOVE_EFFECT_SPICY_EXTRACT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_GRASS
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPICY_EXTRACT, "The user's incredibly\nspicy extract sharply\nboosts the target's\nAttack stat and harshly\nlowers their Defense."

movedata MOVE_SPIN_OUT, "Dérapage"
    battleeffect MOVE_EFFECT_USER_SPEED_DOWN_2_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SPIN_OUT, "The user spins furiously\nby straining its legs,\ninflicting damage while\nharshly lowering the\nuser's Speed stat."

movedata MOVE_POPULATION_BOMB, "Prolifération"
    battleeffect MOVE_EFFECT_UP_TO_10_HITS
    pss SPLIT_PHYSICAL
    basepower 20
    type TYPE_NORMAL
    accuracy 90
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_POPULATION_BOMB, "The user’s fellows\ngather in droves to\nperform a combo attack\nthat hits the target one\nto ten times in a row."

movedata MOVE_ICE_SPINNER, "Cryo-Pirouette"
    battleeffect MOVE_EFFECT_END_TERRAIN
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_ICE
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ICE_SPINNER, "The user covers its\nfeet in ice and twirls\naround, slamming into\nthe target. It also\ndestroys the terrain."

movedata MOVE_GLAIVE_RUSH, "Charge Glaive"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_DRAGON
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GLAIVE_RUSH, "The user charges\nrecklessly. Attacks on\nthe user on the next\nturn always hit and will\ninflict double damage."

movedata MOVE_REVIVAL_BLESSING, "Second Souffle"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 1
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_REVIVAL_BLESSING, "The user's loving\nblessing revives a party\nPokémon that has fainted\nand restores half that\nPokémon's max HP."

movedata MOVE_SALT_CURE, "Salaison"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 40
    type TYPE_ROCK
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SALT_CURE, "The user salt cures the\ntarget, dealing damage\nevery turn. Steel and\nWater types are strongly\naffected by this move."

movedata MOVE_TRIPLE_DIVE, "Triple Plongeon"
    battleeffect MOVE_EFFECT_HIT_THREE_TIMES
    pss SPLIT_PHYSICAL
    basepower 30
    type TYPE_WATER
    accuracy 95
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TRIPLE_DIVE, "The user performs a\nperfectly timed triple\ndive, hitting the target\nwith splashes of water\nthree times in a row."

movedata MOVE_MORTAL_SPIN, "Toupie Éclat"
    battleeffect MOVE_EFFECT_MORTAL_SPIN
    pss SPLIT_PHYSICAL
    basepower 30
    type TYPE_POISON
    accuracy 100
    pp 15
    effectchance 100
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MORTAL_SPIN, "A spin attack that can\neliminate such moves as\nBind, Wrap and Leech\nSeed. It also poisons\nopposing Pokémon."

movedata MOVE_DOODLE, "Décalquage"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DOODLE, "The target's essence is\ncaptured in a sketch.\nThis makes the Abilities\nof the user and its ally\nmatch the target's."

movedata MOVE_FILLET_AWAY, "Décharnement"
    battleeffect MOVE_EFFECT_ATK_SP_ATK_SPEED_UP_2_LOSE_HALF_MAX_HP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FILLET_AWAY, "The user sharply\nboosts its Attack,\nSp. Atk, and Speed\nstats by using its\nown HP."

movedata MOVE_KOWTOW_CLEAVE, "Génusection"
    battleeffect MOVE_EFFECT_BYPASS_ACCURACY
    pss SPLIT_PHYSICAL
    basepower 85
    type TYPE_DARK
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_KOWTOW_CLEAVE, "The user slashes at the\ntarget after kowtowing\nto make the target let\ndown its guard. This\nattack never misses."

movedata MOVE_FLOWER_TRICK, "Magie Florale"
    battleeffect MOVE_EFFECT_ALWAYS_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_GRASS
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FLOWER_TRICK, "The user throws a rigged\nbouquet of flowers at\nthe target. This attack\nnever misses and always\nlands a critical hit."

movedatalongname MOVE_TORCH_SONG, "ChantFlamboyant", "Chant Flamboyant"
    battleeffect MOVE_EFFECT_RAISE_SP_ATK_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TORCH_SONG, "The user blows out\nraging flames as if\nsinging, scorching the\ntarget. This also boosts\nthe user's Sp. Atk stat."

movedata MOVE_AQUA_STEP, "Danse Aquatique"
    battleeffect MOVE_EFFECT_RAISE_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_WATER
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_AQUA_STEP, "The user toys with the\ntarget and attacks using\nlight and fluid dance\nsteps. This also boosts\nthe user's Speed stat."

movedata MOVE_RAGING_BULL, "Taurogne"
    battleeffect MOVE_EFFECT_REMOVE_SCREENS // Typing portion handled in other_battle_calculators.c.
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RAGING_BULL, "The user performs a\ntackle like a raging\nbull. It can also break\nbarriers, such as Light\nScreen and Reflect."

movedata MOVE_MAKE_IT_RAIN, "Ruée d'Or"
    battleeffect MOVE_EFFECT_MAKE_IT_RAIN
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAKE_IT_RAIN, "The user throws out a\nmass of coins. This also\nlowers the user's Sp.\nAtk stat. Money is\nearned after the battle."

movedata MOVE_PSYBLADE, "Lame Psychique"
    battleeffect MOVE_EFFECT_PSYBLADE
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_PSYCHIC
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PSYBLADE, "The user rends with an\nethereal blade. Its\npower is boosted by 50\npercent if the user is\non Electric Terrain."

movedata MOVE_HYDRO_STEAM, "Hydrovapeur"
    battleeffect MOVE_EFFECT_HIT // Handled in CalcBaseDamage.c.
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_WATER
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HYDRO_STEAM, "The user blasts out\nboiling-hot water. Its\npower is not lowered in\nharsh sunlight but\nrather boosted by 50%."

movedata MOVE_RUINATION, "Cataclysme"
    battleeffect MOVE_EFFECT_HALVE_HP
    pss SPLIT_SPECIAL
    basepower 1
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RUINATION, "The user summons a\nruinous disaster.\nThis cuts the\ntarget’s HP in half."

movedata MOVE_COLLISION_COURSE, "Nitro Crash"
    battleeffect MOVE_EFFECT_HIT // Handled in battle_calc_damage.c.
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_FIGHTING
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_COLLISION_COURSE, "The user causes a\nmassive prehistoric\nexplosion. This move's\npower is boosted more if\nit’s super effective."

movedata MOVE_ELECTRO_DRIFT, "Turbo Volt"
    battleeffect MOVE_EFFECT_HIT // Handled in battle_calc_damage.c.
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_ELECTRIC
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ELECTRO_DRIFT, "The user pierces its\ntarget with futuristic\nelectricity. This move's\npower is boosted more if\nit's supereffective."

movedata MOVE_SHED_TAIL, "Queulonage"
    battleeffect MOVE_EFFECT_SHED_TAIL
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SHED_TAIL, "The user creates\na decoy using its own\nHP, then swaps places\nwith a party Pokémon\nin waiting."

movedata MOVE_CHILLY_RECEPTION, "Neigeux de Mots"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ICE
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CHILLY_RECEPTION, "The user tells a\nchillingly bad joke\nbefore switching out.\nThis summons a snowstorm\nlasting five turns."

movedata MOVE_TIDY_UP, "Grand Nettoyage"
    battleeffect MOVE_EFFECT_TIDY_UP
    pss SPLIT_STATUS
    basepower 0
    type TYPE_NORMAL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TIDY_UP, "The user tidies up and\nremoves entry hazards\nand Substitutes. This\nalso boosts the user’s\nAttack and Speed stats."

movedata MOVE_SNOWSCAPE, "Chute de Neige"
    battleeffect MOVE_EFFECT_WEATHER_SNOW
    pss SPLIT_STATUS
    basepower 0
    type TYPE_ICE
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_FIELD
    priority 0
    flags 0
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SNOWSCAPE, "The user summons a\nsnowstorm lasting five\nturns. This boosts the\nDefense stats of Ice\ntypes."

movedata MOVE_POUNCE, "Bond"
    battleeffect MOVE_EFFECT_LOWER_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_BUG
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_POUNCE, "The user attacks by\npouncing on the\ntarget.\nThis also lowers the\ntarget's Speed stat."

movedata MOVE_TRAILBLAZE, "Désherbaffe"
    battleeffect MOVE_EFFECT_RAISE_SPEED_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_GRASS
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TRAILBLAZE, "The user attacks as if\nleaping out from tall\ngrass. The user's\nnimble footwork raises\nits Speed stat."

movedata MOVE_CHILLING_WATER, "Douche Froide"
    battleeffect MOVE_EFFECT_LOWER_ATTACK_HIT
    pss SPLIT_SPECIAL
    basepower 50
    type TYPE_WATER
    accuracy 100
    pp 20
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_CHILLING_WATER, "The user attacks the\ntarget by showering it\nwith cold water. This\nalso lowers the target's\nAttack stat."

movedata MOVE_HYPER_DRILL, "Hyperceuse"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HYPER_DRILL, "The user spins at high\nspeed to pierce the\ntarget. This attack can\nhit through a move such\nas Protect or Detect."

movedata MOVE_TWIN_BEAM, "Double Laser"
    battleeffect MOVE_EFFECT_HIT_TWICE
    pss SPLIT_SPECIAL
    basepower 40
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TWIN_BEAM, "The user shoots\nmystical beams from its\neyes to inflict damage.\nThe target is hit twice\nin a row."

movedata MOVE_RAGE_FIST, "Poing de Colère"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 50
    type TYPE_GHOST
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_RAGE_FIST, "The user converts its\nrage into energy to\nattack. The more the\nuser has been attacked,\nthe greater the power."

movedata MOVE_ARMOR_CANNON, "Canon Blindé"
    battleeffect MOVE_EFFECT_USER_DEF_SP_DEF_DOWN_HIT
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_FIRE
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags  FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ARMOR_CANNON, "The user shoots its own\narmor out as blazing\nprojectiles. It also\ncuts the user’s Defense\nand Sp. Def stats."

movedata MOVE_BITTER_BLADE, "Lame en Peine"
    battleeffect MOVE_EFFECT_RECOVER_HALF_DAMAGE_DEALT
    pss SPLIT_PHYSICAL
    basepower 90
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BITTER_BLADE, "The user focuses its\nbitter feelings into a\nslash. The user's HP\nis restored by up to\nhalf the damage taken."

movedata MOVE_DOUBLE_SHOCK, "Double Décharge"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 120
    type TYPE_ELECTRIC
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DOUBLE_SHOCK, "The user discharges\nall the electricity\nfrom its body. After\nthis, the user loses\nthe Electric type."

movedata MOVE_GIGATON_HAMMER, "Marteau Mastoc"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 160
    type TYPE_STEEL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_GIGATON_HAMMER, "The user swings its\nwhole body around to\nattack with its huge\nhammer. This move can't\nbe used twice in a row."

movedata MOVE_COMEUPPANCE, "Vindicte"
    battleeffect MOVE_EFFECT_METAL_BURST
    pss SPLIT_PHYSICAL
    basepower 1
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET_SPECIAL
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_COMEUPPANCE, "The user retaliates\nagainst the foe that\nlast inflicted damage\non it with much\ngreater power."

movedata MOVE_AQUA_CUTTER, "Tranch'Aqua"
    battleeffect MOVE_EFFECT_HIGH_CRITICAL
    pss SPLIT_PHYSICAL
    basepower 70
    type TYPE_WATER
    accuracy 100
    pp 20
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_AQUA_CUTTER, "The user expels\npressurized water to\ncut at the target like\na blade. It has a high\ncritical-hit ratio."

// The Torque moves are not normally used by players, so they lack internal descriptions. 
// The given descriptions are sourced from PokeRogue with permission.
movedata MOVE_BLAZING_TORQUE, "Crash Brûlant"
    battleeffect MOVE_EFFECT_BURN_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BLAZING_TORQUE, "The user rams into the\ntarget with blazing\nenergy. This may also\nleave the target with\na burn."

movedata MOVE_WICKED_TORQUE, "Crash Obscur"
    battleeffect MOVE_EFFECT_SLEEP_HIT
    pss SPLIT_PHYSICAL
    basepower 80
    type TYPE_DARK
    accuracy 100
    pp 10
    effectchance 10
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_WICKED_TORQUE, "The user rams into the\ntarget with malicious\nintent. This may put\nthe target to sleep."

movedata MOVE_NOXIOUS_TORQUE, "Crash Toxique"
    battleeffect MOVE_EFFECT_POISON_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_POISON
    accuracy 100
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_NOXIOUS_TORQUE, "The user rams into the\ntarget with a\npoisonous end. This\nmay also poison the\ntarget."

movedata MOVE_COMBAT_TORQUE, "Crash Musclé"
    battleeffect MOVE_EFFECT_PARALYZE_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_FIGHTING
    accuracy 100
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_COMBAT_TORQUE, "The user rams into the\ntarget with great\nforce. This may also\nleave the target with\nparalysis."

movedata MOVE_MAGICAL_TORQUE, "Crash Magique"
    battleeffect MOVE_EFFECT_CONFUSE_HIT
    pss SPLIT_PHYSICAL
    basepower 100
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 30
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MAGICAL_TORQUE, "The user rams into the\ntarget with a fae-like\nforce. This may also\nconfuse the target."

movedata MOVE_BLOOD_MOON, "Lune Rouge"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 140
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BLOOD_MOON, "The user unleashes the\nfull brunt of its spirit\nfrom a full moon.\nThis move can't be used\ntwice in a row."

movedata MOVE_MATCHA_GOTCHA, "Mortier Matcha"
    battleeffect MOVE_EFFECT_RECOVER_HALF_DAMAGE_DEALT_BURN_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_GRASS
    accuracy 90
    pp 15
    effectchance 20
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MATCHA_GOTCHA, "The user fires a blast\nof tea, restoring HP\nby up to half the\ndamage dealt. This may\nalso burn the target."

movedata MOVE_SYRUP_BOMB, "Bombe au Sirop"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 60
    type TYPE_GRASS
    accuracy 85
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SYRUP_BOMB, "The user sets off a\ngooey explosion, which\ncauses the target's\nSpeed stat to drop each\nturn for three turns."

movedata MOVE_IVY_CUDGEL, "Massue Liane"
    battleeffect MOVE_EFFECT_HIT // Typing portion handled in other_battle_calculators.c.
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_GRASS
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_IVY_CUDGEL, "The user strikes with a\ncudgel. It has a high\ncritical hit chance, and\nits type changes with\nthe user's mask."

movedata MOVE_ELECTRO_SHOT, "Fulgurayon"
    battleeffect MOVE_EFFECT_CHARGE_TURN_SP_ATK_UP_RAIN_SKIPS
    pss SPLIT_SPECIAL
    basepower 130
    type TYPE_ELECTRIC
    accuracy 100
    pp 10
    effectchance 100
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ELECTRO_SHOT, "A two-turn attack.\nThe user gathers\nlight, then fires a\nhigh voltage shot\non the second turn."

movedatalongname MOVE_TERA_STARSTORM, "PluieTérastrale", "Pluie Térastrale"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 120
    type TYPE_NORMAL
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_ADJACENT_OPPONENTS
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TERA_STARSTORM, "The user bombards the\ntarget with crystalline\npower. When used by\nStellar Terapagos, this\nmove damages all foes."

movedata MOVE_FICKLE_BEAM, "Laser Hasard"
    battleeffect MOVE_EFFECT_FICKLE_BEAM
    pss SPLIT_SPECIAL
    basepower 80
    type TYPE_DRAGON
    accuracy 100
    pp 5
    effectchance 100 // Handled by random in the effect script.
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_FICKLE_BEAM, "The user shoots a beam\nof light. Sometimes\nthe user's heads shoot\nin unison, doubling\nthe move's power."

movedata MOVE_BURNING_BULWARK, "Rempart Brûlant"
    battleeffect MOVE_EFFECT_PROTECT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_FIRE
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_USER
    priority 4
    flags 0
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_BURNING_BULWARK, "The user’s intensely hot\nfur protects it from\nattacks and also burns\nany attacker that makes\ndirect contact with it."

movedata MOVE_THUNDERCLAP, "Vif Éclair"
    battleeffect MOVE_EFFECT_HIT_FIRST_IF_TARGET_ATTACKING
    pss SPLIT_SPECIAL
    basepower 70
    type TYPE_ELECTRIC
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 1
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_THUNDERCLAP, "The user attacks first\nwith a jolt of\nelectricity. This move\nfails if the target is\nnot readying an attack."

movedata MOVE_MIGHTY_CLEAVE, "Lame Puissante"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 95
    type TYPE_ROCK
    accuracy 100
    pp 5
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MIGHTY_CLEAVE, "Light from atop the\nuser's head cleaves the\ntarget. This move hits\neven if the target\nprotects itself."

movedatalongname MOVE_TACHYON_CUTTER, "LameTachyonique", "Lame Tachyonique"
    battleeffect MOVE_EFFECT_HIT_TWICE
    pss SPLIT_SPECIAL
    basepower 50
    type TYPE_STEEL
    accuracy 0
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TACHYON_CUTTER, "The user attacks by\nlaunching particle\nblades at the target\ntwice in a row. This\nattack never misses."

movedatalongname MOVE_HARD_PRESS, "PressionExtrême", "Pression Extrême"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 0
    type TYPE_STEEL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_HARD_PRESS, "The target is crushed by\nthe user. The more HP\nthe target has left, the\ngreater the move's\npower."

movedata MOVE_DRAGON_CHEER, "Cri Draconique"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_STATUS
    basepower 0
    type TYPE_DRAGON
    accuracy 0
    pp 15
    effectchance 0
    target RANGE_ALLY
    priority 0
    flags FLAG_MIRROR_MOVE | FLAG_PROTECT | FLAG_MAGIC_COAT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_DRAGON_CHEER, "Allies’ morale is raised\nwith a draconic cry,\nboosting their critical\nhit rate. This rouses\nDragon types more."

movedata MOVE_ALLURING_VOICE, "Voix Envoûtante"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 80
    type (FAIRY_TYPE_IMPLEMENTED) ? TYPE_FAIRY : TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_ALLURING_VOICE, "The user attacks using\nits angelic voice. This\nalso confuses the target\nif its stats have been\nboosted during the turn."

movedata MOVE_TEMPER_FLARE, "Indignition"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 75
    type TYPE_FIRE
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_TEMPER_FLARE, "The user desperately\nattacks the target. This\nmove's power is doubled\nif the user's previous\nmove failed."

movedata MOVE_SUPERCELL_SLAM, "Volt Assaut"
    battleeffect MOVE_EFFECT_CRASH_ON_MISS
    pss SPLIT_PHYSICAL
    basepower 100
    type TYPE_ELECTRIC
    accuracy 95
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_SUPERCELL_SLAM, "The user electrifies its\nbody and drops onto the\ntarget. If this move\nmisses, the user takes\ndamage instead."

movedata MOVE_PSYCHIC_NOISE, "Dissonance Psy"
    battleeffect MOVE_EFFECT_PREVENT_HEALING_HIT
    pss SPLIT_SPECIAL
    basepower 75
    type TYPE_PSYCHIC
    accuracy 100
    pp 10
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_PSYCHIC_NOISE, "The user attacks with\nunpleasant sound waves.\nFor two turns, the\ntarget is prevented\nfrom recovering HP."

movedata MOVE_UPPER_HAND, "Prio-Parade"
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_PHYSICAL
    basepower 65
    type TYPE_FIGHTING
    accuracy 100
    pp 15
    effectchance 0
    target RANGE_SINGLE_TARGET
    priority 3
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE | FLAG_CONTACT
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_UPPER_HAND, "The user strikes\nreactively, making the\ntarget flinch. This move\nfails if the target is\nnot readying a priority\nmove."

movedata MOVE_MALIGNANT_CHAIN, "Chaîne Malsaine"
    battleeffect MOVE_EFFECT_BADLY_POISON_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_POISON
    accuracy 100
    pp 5
    effectchance 50
    target RANGE_SINGLE_TARGET
    priority 0
    flags FLAG_KEEP_HP_BAR | FLAG_PROTECT | FLAG_MIRROR_MOVE
    appeal 0x00
    contesttype CONTEST_COOL
    terminatedata
    movedescription MOVE_MALIGNANT_CHAIN, "The user pours toxins\ninto the target through\na corrosive chain. This\nmay also leave the\ntarget badly poisoned."

movedatanoname NUM_OF_MOVES
    battleeffect MOVE_EFFECT_HIT
    pss SPLIT_SPECIAL
    basepower 100
    type TYPE_NORMAL
    accuracy 100
    pp 10
    effectchance 0
    target 0x0000
    priority 0
    flags 0x32
    appeal 0x10
    contesttype CONTEST_BEAUTY
    terminatedata
