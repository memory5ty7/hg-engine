#ifndef BATTLE_CONTROLLER_PLAYER_H
#define BATTLE_CONTROLLER_PLAYER_H

#include "battle.h"

#define BATTLE_OUTCOME_WIN         1

typedef void (*ControllerFunction)(struct BattleSystem *, struct BattleStruct *);

extern const ControllerFunction sPlayerBattleCommands[];

void LONG_CALL ov12_022639B8(struct BattleSystem *bsys, int battlerId, MESSAGE_PARAM msg);
u8 LONG_CALL BattleSystem_GetBattleOutcomeFlags(struct BattleSystem *bsys);
BOOL LONG_CALL BattleContext_Main(struct BattleSystem *bsys, struct BattleStruct *ctx);

BOOL LONG_CALL BattleSystem_CheckMonCaught(struct BattleSystem *bsys, int battlerId);
BOOL CheckEvoLineCaught(struct BattleSystem *bsys, u16 species, u16 form_no);
void setAreaCaughtFlag(u8 mapSec);
BOOL checkAreaCaughtFlag(u8 mapSec);

void ov12_0224D464(struct BattleSystem *bsys, struct BattleStruct *ctx);
int LONG_CALL ov12_022581D4(struct BattleSystem *bsys, struct BattleStruct *ctx, int var, int battlerId);
void LONG_CALL ReadBattleScriptFromNarc(struct BattleStruct *ctx, int narcId, int fileId);

#endif
