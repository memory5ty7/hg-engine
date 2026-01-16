#ifndef POKEHEARTGOLD_H
#define POKEHEARTGOLD_H

#include "types.h"
#include "pokemon.h"
#include "message.h"
#include "task.h"

void LONG_CALL CallTask_LeaveOverworld(TaskManager *taskManager);
void LONG_CALL CallTask_RestoreOverworld(TaskManager *taskManager);

u32 LONG_CALL BattleSystem_GetBattleType(void *bsys);
BOOL LONG_CALL TrainerMessageWithIdPairExists(u32 trainer_idx, u32 msg_id, int heapId);
void LONG_CALL PlayBGM(u16 seqno);

struct Mail* LONG_CALL Mail_New(int heapID);
PokemonDataBlock* LONG_CALL GetSubstruct(struct BoxPokemon *boxMon, u32 pid, u8 which_struct);
u8 LONG_CALL GetMoveMaxPP(u16 moveId, u8 ppUps);
u32 LONG_CALL CalcMonChecksum(void *_data, u32 size);
String* LONG_CALL GetSpeciesName(u16 species, int heapID);
void LONG_CALL String_Copy(String *dest, const String *src);

DaycareMon* LONG_CALL Save_Daycare_GetMonX(Daycare *daycare, s32 i);
u32 LONG_CALL DaycareMon_GetSteps(DaycareMon *dcmon);
u8 LONG_CALL Save_Daycare_GetEggCycleCounter(Daycare *daycare);
void LONG_CALL DaycareMon_AddSteps(DaycareMon *dcmon, u32 steps);
void LONG_CALL Save_Daycare_SetEggCycleCounter(Daycare *daycare, s32 count);
BOOL LONG_CALL Save_Daycare_HasEgg(Daycare *daycare);
u8 LONG_CALL Save_Daycare_CalcCompatibilityInternal(Daycare *dayCare);
u8 LONG_CALL GetEggCyclesToSubtract(struct Party *party);
u8 LONG_CALL sub_0206CCD8(FieldSystem *fieldSystem);
void LONG_CALL GenerateEggPID(Daycare *dayCare);
BOOL LONG_CALL sub_0209316C(FieldSystem *sys);

void LONG_CALL CallTask_NamingScreen(void *taskman, int type, int species, int maxLen, int partyIdx, const u16 *defaultStr, u16 *retVar);
FieldSystem* LONG_CALL TaskManager_GetFieldSystem(TaskManager *taskManager);
void* LONG_CALL TaskManager_GetEnvironment(TaskManager *taskManager);
void LONG_CALL CallApplicationAsTask(TaskManager *taskManager, void *tmplt, void *work);
int LONG_CALL String_Compare(String *a, String *b);
u16* LONG_CALL String_cstr(String *string);
s64 LONG_CALL String_atoi(String *str, BOOL *flag);
void* LONG_CALL Save_FriendGroup_Get(void *saveData);
BOOL LONG_CALL sub_0202C88C(void *group, u16 *a1);
void LONG_CALL SetName(TaskManager *taskman);
void LONG_CALL NamingScreen_DeleteArgs(void *namingScreenArgs);
String* LONG_CALL _get_species_name(u16 species, int heapID);

#endif // POKEHEARTGOLD_H