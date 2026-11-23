#include "../../include/pokeheartgold.h"
#include "../../include/constants/file.h"
#include "../../include/summary.h"
#include "../../include/battle.h"

int PartyMenu_ItemUseFunc_LevelUp(struct PartyMenu *partyMenu) {
    struct PartyPokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    partyMenu->levelUpStatsTmp[0] = GetMonData(mon, MON_DATA_MAXHP, NULL);
    partyMenu->levelUpStatsTmp[1] = GetMonData(mon, MON_DATA_ATTACK, NULL);
    partyMenu->levelUpStatsTmp[2] = GetMonData(mon, MON_DATA_DEFENSE, NULL);
    partyMenu->levelUpStatsTmp[3] = GetMonData(mon, MON_DATA_SPECIAL_ATTACK, NULL);
    partyMenu->levelUpStatsTmp[4] = GetMonData(mon, MON_DATA_SPECIAL_DEFENSE, NULL);
    partyMenu->levelUpStatsTmp[5] = GetMonData(mon, MON_DATA_SPEED, NULL);

    {
        u32 *levelUpLearnset = sys_AllocMemory(HEAPID_DEFAULT, 41 * sizeof(u32));
        u32 species = (u16)GetMonData(mon, MON_DATA_SPECIES, NULL);
        u32 form = GetMonData(mon, MON_DATA_FORM, NULL);
        u32 level = (u8)GetMonData(mon, MON_DATA_LEVEL, NULL);
        int last_id = 0;

        LoadLevelUpLearnset_HandleAlternateForm(species, (int)form, levelUpLearnset);
        while (levelUpLearnset[last_id] != LEVEL_UP_LEARNSET_END
            && LEVEL_UP_LEARNSET_LEVEL(levelUpLearnset[last_id]) <= level) {
            last_id++;
        }

        partyMenu->args->levelUpMoveSearchState = last_id;
        sys_FreeMemoryEz(levelUpLearnset);
    }

    UseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, 0, PartyMenu_GetCurrentMapSec(partyMenu), HEAP_ID_PARTY_MENU);

    partyMenu->monsDrawState[partyMenu->partyMonIndex].level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    partyMenu->monsDrawState[partyMenu->partyMonIndex].hp = GetMonData(mon, MON_DATA_HP, NULL);
    partyMenu->monsDrawState[partyMenu->partyMonIndex].maxHp = GetMonData(mon, MON_DATA_MAXHP, NULL);
    String *string = NewString_ReadMsgData(partyMenu->msgData, 177);
    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
    BufferIntegerAsString(partyMenu->msgFormat, 1, partyMenu->monsDrawState[partyMenu->partyMonIndex].level, 3, 0, TRUE);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    int statusIcon = Summary_PickStatusIcon(mon);
    PartyMenu_DrawMonStatusIcon(partyMenu, partyMenu->partyMonIndex, statusIcon);
    if (statusIcon == 7) {
        partyMenu->monsDrawState[partyMenu->partyMonIndex].status = 7;
        PartyMenu_PrintMonLevelOnWindow(partyMenu, partyMenu->partyMonIndex);
    }
    sub_0207A7F4(partyMenu, partyMenu->partyMonIndex);
    partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_HPRestoreAnimLoop;
    sub_0207D5DC(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_CommitPartyMonPanelWindowsToVram_InVBlank(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_LevelUpLearnMovesLoop;
    partyMenu->levelUpLearnMovesLoopState = 0;
    return PARTY_MENU_STATE_ITEM_USE_CB;
}