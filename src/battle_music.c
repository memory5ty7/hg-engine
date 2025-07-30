#include "../include/battle_music.h"
#include "../include/save.h"
#include "../include/constants/sndseq.h"
#include "../include/types.h"
#include "../include/constants/trainerclass.h"
#include "../include/constants/sndseq.h"

// For some reason, the repointed music table doesn't work (?) so I'll use this one
u8 MusicComboTable[][2] =
{
    {TRAINERCLASS_OAK, ANIM_MUSIC_COMBO_JOHTO_TRAINER},
    {TRAINERCLASS_WHITNEY, ANIM_MUSIC_COMBO_LEADER},
    {TRAINERCLASS_RILEY, ANIM_MUSIC_COMBO_LEADER},
    {TRAINERCLASS_GARDENIA, ANIM_MUSIC_COMBO_LEADER},
    {TRAINERCLASS_BEDE, ANIM_MUSIC_COMBO_LEADER},
    {TRAINERCLASS_OLIVIA, ANIM_MUSIC_COMBO_LEADER},
    {TRAINERCLASS_ZINNIA, ANIM_MUSIC_COMBO_LEADER},
    {TRAINERCLASS_WALLACE, ANIM_MUSIC_COMBO_LEADER},
    {TRAINERCLASS_BENGA, ANIM_MUSIC_COMBO_LEADER},
    {TRAINERCLASS_SADA, ANIM_MUSIC_COMBO_ELITE_FOUR},
    {TRAINERCLASS_LEON, ANIM_MUSIC_COMBO_ELITE_FOUR},
    {TRAINERCLASS_DIANTHA, ANIM_MUSIC_COMBO_ELITE_FOUR},
    {TRAINERCLASS_TURO, ANIM_MUSIC_COMBO_ELITE_FOUR},
    {TRAINERCLASS_STEVEN, ANIM_MUSIC_COMBO_CHAMPION},
};

u16 NPCTrainerGetBattleIntroAndMusicParam(u16 trainerClass) {
    
    u16 i = 0;
    u16 trainerCombo = 0x29;

    while (i < 10) {
        u16 currentClass = MusicComboTable[i][0];
    
        if (trainerClass != currentClass) {
            i++;
            continue;
        }

        trainerCombo = MusicComboTable[i][1];

        return trainerCombo;
    }

    // If the Trainer Class is not found in the table, we will use the battle theme from the script variable
    u16 battleTheme = GetScriptVar(VAR_BATTLE_THEME);

    // If no match found, return a random OST
    if (battleTheme == 0)
    {
        battleTheme = gf_rand() % 5 + 1;
    }
    
    trainerCombo = battleTheme + ANIM_MUSIC_COMBO_CHAMPION;
    
    return trainerCombo;
}