#ifndef POKEHEARTGOLD_H
#define POKEHEARTGOLD_H

#include "types.h"
#include "task.h"
#include "message.h"
#include "pokemon.h"

void LONG_CALL RestoreMonHPBy(struct PartyPokemon *mon, u32 hp, u32 maxHp, u32 restoration);
void LONG_CALL AddMonData(struct PartyPokemon *mon, int attr, int amount);
BOOL LONG_CALL BoostMonMovePpUpBy(struct PartyPokemon *mon, int moveIdx, int nPpUp);
s32 LONG_CALL TryModEV(s32 ev, s32 evSum, s32 by);
void LONG_CALL ApplyItemEffectOnMonMood(struct PartyPokemon *mon, u16 itemId);
BOOL LONG_CALL DoItemFriendshipMod(struct PartyPokemon *mon, s32 friendship, s32 mod, u16 location, int heapID);

int LONG_CALL PartyMenu_ItemUseFunc_LevelUpLearnMovesLoop(struct PartyMenu *partyMenu);
int LONG_CALL PartyMenu_ItemUseFunc_HPRestoreAnimLoop(struct PartyMenu *partyMenu);
void LONG_CALL PartyMenu_CommitPartyMonPanelWindowsToVram_InVBlank(struct PartyMenu *partyMenu, u8 partySlot);
void LONG_CALL BufferIntegerAsString(MessageFormat *messageFormat, u32 idx, s32 num, u32 numDigits, int strconvmode, BOOL whichCharset);
BOOL LONG_CALL UseItemOnMonInParty(struct Party *party, u16 itemID, s32 partyIdx, u8 moveIdx, u16 location, int heapID);
struct BoxPokemon * LONG_CALL Mon_GetBoxMon(struct PartyPokemon *mon);
void LONG_CALL PartyMenu_DrawMonStatusIcon(struct PartyMenu *partyMenu, u8 partySlot, u8 status);
void LONG_CALL PartyMenu_PrintMonLevelOnWindow(struct PartyMenu *partyMenu, u8 partySlot);
void LONG_CALL sub_0207A7F4(struct PartyMenu *partyMenu, u8 partySlot);
void LONG_CALL sub_0207D5DC(struct PartyMenu *partyMenu, u8 partySlot);

#endif // POKEHEARTGOLD_H