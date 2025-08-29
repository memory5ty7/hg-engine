#include "../include/types.h"
#include "../include/pokemon.h"
#include "../include/use_item_on_mon.h"
#include "../include/save.h"
#include "../include/constants/vars_flags.h"

void HealParty(struct Party *party) {
    int i, j;

    int partyCount = party->count;
    for (i = 0; i < partyCount; i++) {
        struct PartyPokemon *mon = Party_GetMonByIndex(party, i);
        if (GetMonData(mon, MON_DATA_SPECIES_EXISTS, NULL)) {
            u32 sp8 = GetMonData(mon, MON_DATA_MAXHP, NULL);
            u32 curHP = GetMonData(mon, MON_DATA_HP, NULL);

            if (!CheckScriptFlag(FLAG_NUZLOCKE_MODE) || curHP != 0)
            {
                SetMonData(mon, MON_DATA_HP, &sp8);

                sp8 = 0;
                SetMonData(mon, MON_DATA_STATUS, &sp8);

                for (j = 0; j < 4; j++) {
                    if (MonMoveCanRestorePP(mon, j) == 1) {
                        MonMoveRestorePP(mon, j, 127);
                    }
                }
            }
        }
    }
}