.nds
.thumb

// Thanks to Drayano for this mart template! -sauceyaTTa
// Changes items obtainable in some Poké Marts

.open "base/arm9.bin", 0x02000000

/* Values for badge restrictions as it isn't 1:1 */
ZERO_BADGES equ 1
ONE_BADGE equ 2
THREE_BADGES equ 3
FIVE_BADGES equ 4
SEVEN_BADGES equ 5
EIGHT_BADGES equ 6

/* General Poké Mart Table */
.org 0x020FBF22

.halfword ITEM_POKE_BALL
.halfword ZERO_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

.halfword ITEM_NONE
.halfword EIGHT_BADGES

/** Special Mart Index - This is not in byte order
const u16 *_0210FA3C[] = {
    _020FBA54, 0    // Dawn's Reach
    _020FBA78, 1    // Lost Path
    _020FBAB0, 2    // Dunes of Silence 1
    _020FBBEA, 3    // Tower of Heaven 1
    _020FBC1A, 4    // Gates of the Underworld
    _020FBBB4, 5    // End of the World 1
    _020FBAFA, 6    // Dunes of Silence 5
    _020FBC34, 7    // Depths of Styx
    _020FBACA, 8    // Dunes of Silence 3
    _020FBA60, 9    // Veil of Roses
    _020FBA88, 10   // Misty Trail
    _020FBAD4, 11   // Dunes of Silence 4
    _020FBA80, 12   // The Nest
    _020FBB84, 13   // Cradle of Stone
    _020FBAC0, 14   // Dunes of Silence 2
    _020FBA70, 15   // Broken Phalanx
    _020FBA98, 16   // Heart of the Maze
    _020FBA5A, 17   // Golden Fields
    _020FBC02, 18   // Tower of Heaven 2
    _020FBC4E, 19   // Temple of Cronus
    _020FBC68, 20
    _020FBA68, 21   // Gray Wasteland
    _020FBBC6, 22   // End of the World 2
    _020FBB08, 23   // Dunes of Silence 6
    _020FBA90, 24   // Maze Entrance
    _020FBAA0, 25
    _020FBAA8, 26   // Ancient Ruins
    _020FBB16, 27   // Dunes of Silence 7
    _020FBAB8, 28
    _020FBBD8, 29   // Frozen Skyreach
};
*/

/* Dawn's Reach */
.org 0x020FBA54
.halfword ITEM_ORAN_BERRY
.halfword 0xFFFF

/* Golden Fields */
.org 0x020FBA5A
.halfword ITEM_LUM_BERRY
.halfword 0xFFFF

/* Veil of Roses */
.org 0x020FBA60
.halfword ITEM_SITRUS_BERRY
.halfword ITEM_SHELL_BELL
.halfword 0xFFFF

/* Gray Wasteland */
.org 0x020FBA68
.halfword ITEM_SUN_STONE
.halfword ITEM_MOON_STONE
.halfword ITEM_IRON_BALL
.halfword 0xFFFF

/* Broken Phalanx */
.org 0x020FBA70
.halfword ITEM_HEAVY_DUTY_BOOTS
.halfword ITEM_LEAF_STONE
.halfword ITEM_ICE_STONE
.halfword 0xFFFF

/* Lost Path */
.org 0x020FBA78
.halfword ITEM_FOCUS_SASH
.halfword 0xFFFF

/* The Nest */
.org 0x20FBA80
.halfword ITEM_FIRE_STONE
.halfword ITEM_WATER_STONE
.halfword ITEM_THUNDER_STONE
.halfword 0xFFFF

/* Misty Trail */
.org 0x020FBA88
.halfword ITEM_SAFETY_GOGGLES
.halfword 0xFFFF

/* Maze Entrance */
.org 0x020FBA90
.halfword ITEM_SHINY_STONE
.halfword ITEM_DUSK_STONE
.halfword ITEM_DAWN_STONE
.halfword 0xFFFF

/* Heart of the Maze */
.org 0x020FBA98
.halfword ITEM_LIECHI_BERRY
.halfword ITEM_GANLON_BERRY
.halfword ITEM_SALAC_BERRY
.halfword ITEM_PETAYA_BERRY
.halfword ITEM_APICOT_BERRY
.halfword ITEM_ROCKY_HELMET
.halfword 0xFFFF

/* Ancient Ruins */
.org 0x020FBAA8
.halfword ITEM_LEFTOVERS
.halfword 0xFFFF

/* Dunes of Silence */
.org 0x020FBAB0
.halfword ITEM_LONELY_MINT
.halfword ITEM_ADAMANT_MINT
.halfword ITEM_NAUGHTY_MINT
.halfword ITEM_BRAVE_MINT
.halfword 0xFFFF

.org 0x020FBAC0
.halfword ITEM_BOLD_MINT
.halfword ITEM_IMPISH_MINT
.halfword ITEM_LAX_MINT
.halfword ITEM_RELAXED_MINT
.halfword 0xFFFF

.org 0x020FBACA
.halfword ITEM_MODEST_MINT
.halfword ITEM_MILD_MINT
.halfword ITEM_RASH_MINT
.halfword ITEM_QUIET_MINT
.halfword 0xFFFF

.org 0x020FBAD4
.halfword ITEM_CALM_MINT
.halfword ITEM_GENTLE_MINT
.halfword ITEM_CAREFUL_MINT
.halfword ITEM_SASSY_MINT
.halfword 0xFFFF

.org 0x020FBAFA
.halfword ITEM_TIMID_MINT
.halfword ITEM_HASTY_MINT
.halfword ITEM_JOLLY_MINT
.halfword ITEM_NAIVE_MINT
.halfword 0xFFFF

.org 0x020FBB08
.halfword ITEM_SERIOUS_MINT
.halfword 0xFFFF

.org 0x020FBB16
.halfword ITEM_HOUNDOOMINITE
.halfword ITEM_MANECTITE
.halfword ITEM_ABSOLITE
.halfword ITEM_GLALITITE
.halfword ITEM_SHARPEDONITE
.halfword 0xFFFF

/* Cradle of Stone */
.org 0x020FBB84
.halfword ITEM_GARDEVOIRITE
.halfword ITEM_GALLADITE
.halfword 0xFFFF

/* End of the World */
.org 0x020FBBB4
.halfword ITEM_CUSTAP_BERRY
.halfword ITEM_TOXIC_ORB
.halfword ITEM_FLAME_ORB
.halfword ITEM_HEART_SCALE
.halfword 0xFFFF

.org 0x020FBBC6
.halfword ITEM_SLOWBRONITE
.halfword ITEM_AGGRONITE
.halfword ITEM_MEDICHAMITE
.halfword ITEM_AMPHAROSITE
.halfword ITEM_PINSIRITE
.halfword ITEM_HERACRONITE
.halfword 0xFFFF

/* Frozen Skyreach */
.org 0x020FBBD8
.halfword ITEM_ABILITY_CAPSULE
.halfword 0xFFFF

/* Tower of Heaven */
.org 0x020FBBEA
.halfword ITEM_CHOICE_BAND
.halfword ITEM_CHOICE_SPECS
.halfword ITEM_CHOICE_SCARF
.halfword 0xFFFF

.org 0x020FBC02
.halfword ITEM_VENUSAURITE
.halfword ITEM_CHARIZARDITE_X
.halfword ITEM_BLASTOISINITE
.halfword ITEM_SCEPTILITE
.halfword ITEM_BLAZIKENITE
.halfword ITEM_SWAMPERTITE
.halfword 0xFFFF

/* Gates of the Underworld */
.org 0x020FBC1A
.halfword ITEM_SABLENITE
.halfword ITEM_GENGARITE
.halfword ITEM_AERODACTYLITE
.halfword 0xFFFF

/* Depths of Styx */
.org 0x020FBC34
.halfword ITEM_GARCHOMPITE
.halfword ITEM_SALAMENCITE
.halfword ITEM_METAGROSSITE
.halfword 0xFFFF

/* Temple of Cronus */
.org 0x020FBC4E
.halfword ITEM_LATIASITE
.halfword ITEM_LATIOSITE
.halfword 0xFFFF

.close
