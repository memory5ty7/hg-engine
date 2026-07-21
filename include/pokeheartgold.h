#ifndef POKEHEARTGOLD_H
#define POKEHEARTGOLD_H

#include "types.h"

u32 LONG_CALL BattleSystem_GetBattleType(void *bsys);
BOOL LONG_CALL TrainerMessageWithIdPairExists(u32 trainer_idx, u32 msg_id, int heapId);
void LONG_CALL PlayBGM(u16 seqno);

#endif \\ POKEHEARTGOLD_H