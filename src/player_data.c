#include "../include/types.h"
#include "../include/save.h"

s32 PlayerProfile_CountBadges(struct PlayerProfile *profile) {
    s32 badges = GetScriptVar(VAR_FIGHTS_WON);

    return badges;
}