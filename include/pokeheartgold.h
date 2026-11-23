#ifndef POKEHEARTGOLD_H
#define POKEHEARTGOLD_H

#include "types.h"
#include "task.h"
#include "message.h"
#include "pokemon.h"

// Gen 9 Items Fix

struct ScriptBankMapping {
    u16 scriptIdLo;
    u16 scriptBank;
    u16 msgBank;
};

void LONG_CALL LoadScriptsAndMessagesParameterized(FieldSystem *fieldSystem, struct SCRIPTCONTEXT *ctx, int scriptBank, u32 msgBank);
void LONG_CALL LoadScriptsAndMessagesForCurrentMap(FieldSystem *fieldSystem, struct SCRIPTCONTEXT *ctx);
u32 LONG_CALL MapObject_GetSpriteID(void *object);

#endif // POKEHEARTGOLD_H