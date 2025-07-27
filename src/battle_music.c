#include "../include/battle_music.h"
#include "../include/music_tables.h"
#include "../include/save.h"
#include "../include/constants/sndseq.h"

u16 NPCTrainerGetBattleIntroAndMusicParam(u16 trainerClass) {
    
    u16 i = 0;
    u16 trainerCombo = 0x29;

    while (i < 13) {
        u16 currentClass = MainMusicComboTable[i][0];
    
        if (trainerClass != currentClass) {
            i++;
            continue;
        }

        trainerCombo = MainMusicComboTable[i][1];

        return trainerCombo;
    }

    u16 battleTheme = GetScriptVar(VAR_BATTLE_THEME);

    if (battleTheme == 0)
    {
        battleTheme = gf_rand() % 5 + 1;
    }
    
    trainerCombo = battleTheme + ANIM_MUSIC_COMBO_CHAMPION;
    
    return trainerCombo;
}