#include "../include/types.h"
#include "../include/pokemon.h"
#include "../include/save.h"
#include "../include/constants/file.h"
#include "../include/pokeheartgold.h"
#include "../include/constants/map_sections.h"
#include "../include/constants/vars_flags.h"
#include "../include/npc_trade.h"

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

    //SetMonData(dest, MON_DATA_HP, &curHP);
}

void setAreaCaughtFlag(int mapSec)
{
    u8 buf[64];
    sprintf(buf,"SetAreaCaughtFlag %d\n",mapSec);
    //debugsyscall(buf);
    u16 varID = VAR_MAPSEC_1 + (int)((int)mapSec / 16);
    SetScriptVar(varID , GetScriptVar(varID) | (1 << (mapSec % 16)));
}

BOOL checkAreaCaughtFlag(int mapSec)
{
    u16 varID = VAR_MAPSEC_1 + (int)(mapSec / 16);
    u16 varValue = GetScriptVar(varID);
    return varValue & (1 << mapSec % 16);
}

BOOL HandleDaycareStep(Daycare *dayCare, struct Party *party, FieldSystem *fieldSystem) {
    u32 friendship;
    struct BoxPokemon *parents[2];
    int cycle_ctr;
    u32 i, n;
    u8 steps;
    u8 compat;
    u8 to_sub;
    struct PartyPokemon *mon;

    u32 mapsec = MapHeader_GetMapSec(fieldSystem->location->mapId);

    Daycare_GetBothBoxMonsPtr(dayCare, parents);
    n = 0;
    for (i = 0; i < 2; i++) {
        if (GetBoxMonData(parents[i], MON_DATA_SPECIES_EXISTS, NULL)) {
            DaycareMon_AddSteps(Save_Daycare_GetMonX(dayCare, i), 1);
            n++;
        }
    }
    if (!Save_Daycare_HasEgg(dayCare) && n == 2) {
        steps = DaycareMon_GetSteps(Save_Daycare_GetMonX(dayCare, 1));
        if (steps == 255) {
            compat = Save_Daycare_CalcCompatibilityInternal(dayCare);
            if (compat > (gf_rand() * 100u / 0xFFFFu)) {
                GenerateEggPID(dayCare);
                sub_0209316C(fieldSystem);
            }
        }
    }
    cycle_ctr = Save_Daycare_GetEggCycleCounter(dayCare);

    if (!CheckScriptFlag(FLAG_NUZLOCKE_MODE) || (!checkAreaCaughtFlag(mapsec) && (mapsec == MAPSEC_POKEMON_DAY_CARE)))
    {
        Save_Daycare_SetEggCycleCounter(dayCare, cycle_ctr + 1);
    }

    if (cycle_ctr + 1 == sub_0206CCD8(fieldSystem)) {
        Save_Daycare_SetEggCycleCounter(dayCare, 0);
        to_sub = GetEggCyclesToSubtract(party);
        for (i = 0; i < party->count; i++) {
            mon = Party_GetMonByIndex(party, i);
            if (GetMonData(mon, MON_DATA_IS_EGG, NULL) && !GetMonData(mon, MON_DATA_CHECKSUM_FAILED, NULL)) {
                friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
                if (friendship != 0) {
                    if (friendship >= to_sub) {
                        friendship -= to_sub;
                    } else {
                        friendship -= 1;
                    }
                    SetMonData(mon, MON_DATA_FRIENDSHIP, &friendship);
                } else {
                    setAreaCaughtFlag(mapsec);
                    return TRUE;
                }
            }
        }
    }
    return FALSE;
}