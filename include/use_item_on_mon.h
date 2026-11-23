#ifndef POKEHEARTGOLD_USE_ITEM_ON_MON_H
#define POKEHEARTGOLD_USE_ITEM_ON_MON_H

#include "item.h"
#include "types.h"
#include "pokemon.h"

BOOL LONG_CALL MonMoveCanRestorePP(struct PartyPokemon *mon, int moveIdx);
BOOL LONG_CALL MonMoveRestorePP(struct PartyPokemon *mon, int moveIdx, int ppRestore);

#endif // POKEHEARTGOLD_USE_ITEM_ON_MON_H