#include "../include/types.h"
#include "../include/save.h"
#include "../include/script.h"

// Repurpose to check the chapter number
s32 PlayerProfile_CountBadges(struct PlayerProfile *profile) {

    u16 badges = GetScriptVar(0x40FB);

    return badges;
}