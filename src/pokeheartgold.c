#include "../include/types.h"
#include "../include/bag.h"
#include "../include/battle.h"
#include "../include/config.h"
#include "../include/debug.h"
#include "../include/overlay.h"
#include "../include/pokemon.h"
#include "../include/rtc.h"
#include "../include/save.h"
#include "../include/script.h"
#include "../include/sound.h"
#include "../include/constants/ability.h"
#include "../include/constants/file.h"
#include "../include/constants/game.h"
#include "../include/constants/hold_item_effects.h"
#include "../include/constants/item.h"
#include "../include/constants/moves.h"
#include "../include/constants/sndseq.h"
#include "../include/constants/species.h"
#include "../include/constants/weather_numbers.h"
#include "../include/pokeheartgold.h"
#include "../include/constants/map_sections.h"

void CopyBoxPokemonToPokemon(const struct BoxPokemon *src, struct PartyPokemon *dest)
{
    u32 sp0 = 0;
    CAPSULE sp4;
    struct Mail *mail;
    dest->box = *src;
    if (dest->box.box_lock) {
        dest->box.party_lock = TRUE;
    }

    u32 curHP = GetBoxMonData(src, MON_DATA_RESERVED_114, NULL);

    SetMonData(dest, MON_DATA_STATUS, &sp0);
    SetMonData(dest, MON_DATA_HP, &sp0);
    SetMonData(dest, MON_DATA_MAXHP, &sp0);
    mail = Mail_New(HEAPID_DEFAULT);
    SetMonData(dest, MON_DATA_MAIL_STRUCT, mail);
    sys_FreeMemoryEz(mail);
    SetMonData(dest, MON_DATA_CAPSULE, &sp0);
    MI_CpuClearFast(&sp4, sizeof(sp4));
    SetMonData(dest, MON_DATA_SEAL_COORDS, &sp4);
    RecalcPartyPokemonStats(dest);

    SetMonData(dest, MON_DATA_HP, &curHP);
}