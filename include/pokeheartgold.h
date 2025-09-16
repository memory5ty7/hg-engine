#ifndef POKEHEARTGOLD_H
#define POKEHEARTGOLD_H

#include "types.h"
#include "pokemon.h"
#include "msgdata.h"

u32 LONG_CALL BattleSystem_GetBattleType(void *bsys);
BOOL LONG_CALL TrainerMessageWithIdPairExists(u32 trainer_idx, u32 msg_id, int heapId);
void LONG_CALL PlayBGM(u16 seqno);

struct Mail* LONG_CALL Mail_New(int heapID);
PokemonDataBlock* LONG_CALL GetSubstruct(struct BoxPokemon *boxMon, u32 pid, u8 which_struct);
int LONG_CALL CalcLevelBySpeciesAndExp(u16 species, u32 experience);
u8 LONG_CALL GetMoveMaxPP(u16 moveId, u8 ppUps);
u32 LONG_CALL CalcMonChecksum(void *_data, u32 size);
String* LONG_CALL GetSpeciesName(u16 species, int heapID);
void LONG_CALL String_Copy(String *dest, const String *src);

#endif // POKEHEARTGOLD_H