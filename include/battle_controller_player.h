#ifndef BATTLE_CONTROLLER_PLAYER_H
#define BATTLE_CONTROLLER_PLAYER_H

#include "battle.h"

typedef void (*ControllerFunction)(struct BattleSystem *, struct BattleStruct *);

extern const ControllerFunction sPlayerBattleCommands[];

void LONG_CALL ov12_022639B8(struct BattleSystem *bsys, int battlerId, MESSAGE_PARAM msg);
u8 LONG_CALL BattleSystem_GetBattleOutcomeFlags(struct BattleSystem *bsys);
BOOL LONG_CALL BattleContext_Main(struct BattleSystem *bsys, struct BattleStruct *ctx);

BOOL LONG_CALL BattleSystem_CheckMonCaught(struct BattleSystem *bsys, int battlerId);

BOOL CheckEvoLineCaught(struct BattleSystem *bsys, u16 species);
void setAreaCaughtFlag(struct BattleSystem *bsys, u8 mapSec);
BOOL checkAreaCaughtFlag(struct BattleSystem *bsys, u8 mapSec);
void ov12_0224D464(struct BattleSystem *bsys, struct BattleStruct *ctx);

#endif
