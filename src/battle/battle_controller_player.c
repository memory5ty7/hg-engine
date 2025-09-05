#include "../../include/battle.h"
#include "../../include/battle_controller_player.h"
#include "../../include/constants/battle_message_constants.h"
#include "../../include/constants/vars_flags.h"
#include "../../include/pokemon.h"

void overrideItemUsage(struct BattleSystem *bsys, struct BattleStruct *ctx)
{
    MESSAGE_PARAM mp;
    int battlerId;
    u32 fight_type = BattleTypeGet(bsys);

    for (battlerId = 0; battlerId < bsys->maxBattlers; battlerId++)
    {
        if (ctx->playerActions[battlerId][0] == CONTROLLER_COMMAND_ITEM_INPUT && ctx->com_seq_no[battlerId] == 7)
        {
            if (fight_type & BATTLE_TYPE_TRAINER)
            {
                mp.msg_id = BATTLE_MSG_ITEMS_CANT_BE_USED_HERE; //msg.id  = msg_0197_00593; // Items can't be used here
                mp.msg_tag = TAG_NONE;
                ov12_022639B8(bsys, battlerId, mp);
                ctx->com_seq_no[battlerId] = SSI_STATE_15;
                ctx->ret_seq_no[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;
            } else if (checkAreaCaughtFlag(bsys, bsys->location) && CheckScriptFlag(FLAG_NUZLOCKE_MODE))
            {
                mp.msg_id = BATTLE_MSG_AREA_ALREADY_CAUGHT_POKEMON; //msg.id  = msg_0197_01574; // You have already caught a Pokémon in this Area!
                mp.msg_tag = TAG_NONE;
                ov12_022639B8(bsys, battlerId, mp);
                ctx->com_seq_no[battlerId] = SSI_STATE_15;
                ctx->ret_seq_no[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;                
            } else if (BattleSystem_CheckMonCaught(bsys, ctx->battlemon[BATTLER_ENEMY].species) & CheckScriptFlag(FLAG_NUZLOCKE_MODE))
            {
                mp.msg_id = BATTLE_MSG_ALREADY_CAUGHT_POKEMON; //msg.id  = msg_0197_01575; // You have already caught this Pokémon (or its Evolution Line)!
                mp.msg_tag = TAG_NONE;
                ov12_022639B8(bsys, battlerId, mp);
                ctx->com_seq_no[battlerId] = SSI_STATE_15;
                ctx->ret_seq_no[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;                   
            }
        }
    }
}

BOOL LONG_CALL BattleContext_Main(struct BattleSystem *bsys, struct BattleStruct *ctx)
{
    if (!ctx->fight_end_flag)
    {
        if (BattleSystem_GetBattleOutcomeFlags(bsys) && !(BattleSystem_GetBattleOutcomeFlags(bsys) & 0x40))
        {
            ctx->server_seq_no = CONTROLLER_COMMAND_42;
        }
    }

    sPlayerBattleCommands[ctx->server_seq_no](bsys, ctx);
#if defined (DISABLE_ITEMS_IN_TRAINER_BATTLE)
    overrideItemUsage(bsys, ctx);
#endif

    if (ctx->server_seq_no == CONTROLLER_COMMAND_45)
    {
        return TRUE;
    }
    return FALSE;
}

#include "../../include/constants/map_sections.h"

BOOL CheckEvoLineCaught(struct BattleSystem *bsys, u16 species)
{
    return BattleSystem_CheckMonCaught(bsys, species);
}

void setAreaCaughtFlag(struct BattleSystem *bsys, u8 mapSec)
{
    u16 varID = VAR_MAPSEC_1 + (int)((int)mapSec / 16);
    SetScriptVar(varID , GetScriptVar(varID) | (1 << (mapSec % 16)));
}

BOOL checkAreaCaughtFlag(struct BattleSystem *bsys, u8 mapSec)
{
    u16 varID = VAR_MAPSEC_1 + (int)(mapSec / 16);
    u16 varValue = GetScriptVar(varID);
    return varValue & (1 << mapSec % 16);
}

#include "../../include/constants/battle_script_constants.h"
#include "../../include/npc_trade.h"

#define BATTLE_OUTCOME_WIN         1

void LONG_CALL ReadBattleScriptFromNarc(struct BattleStruct *ctx, int narcId, int fileId);

void ov12_0224D464(struct BattleSystem *bsys, struct BattleStruct *ctx) {
    if (BattleSystem_GetBattleOutcomeFlags(bsys) & BATTLE_RESULT_TRY_FLEE) {
        ctx->server_seq_no = CONTROLLER_COMMAND_44;
    } else if (BattleSystem_GetBattleOutcomeFlags(bsys) == BATTLE_RESULT_LOSE || BattleSystem_GetBattleOutcomeFlags(bsys) == BATTLE_RESULT_DRAW) {
        ReadBattleScriptFromNarc(ctx, 1, SUB_SEQ_BATTLE_LOST);
        ctx->server_seq_no = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->next_server_seq_no = CONTROLLER_COMMAND_44;
    } else if (BattleSystem_GetBattleOutcomeFlags(bsys) == BATTLE_OUTCOME_WIN) {
        ReadBattleScriptFromNarc(ctx, 1, SUB_SEQ_BATTLE_WON);
        ctx->server_seq_no = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->next_server_seq_no = CONTROLLER_COMMAND_44;
    } else if (BattleSystem_GetBattleOutcomeFlags(bsys) == BATTLE_RESULT_CAPTURED_MON) {
        ctx->server_seq_no = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->next_server_seq_no = CONTROLLER_COMMAND_44;
    } else if (BattleSystem_GetBattleOutcomeFlags(bsys) == BATTLE_RESULT_PLAYER_FLED) {
        ctx->server_seq_no = CONTROLLER_COMMAND_44;
    }

    if (!(BattleTypeGet(bsys) & BATTLE_TYPE_TRAINER) && !CheckEvoLineCaught(bsys, ctx->battlemon[BATTLER_ENEMY].species))
    {
        setAreaCaughtFlag(bsys, bsys->location);
    }

    ctx->fight_end_flag = TRUE;
}

int LONG_CALL ov12_022581D4(struct BattleSystem *bsys, struct BattleStruct *ctx, int var, int battlerId);

void BattleSystem_SetPokedexCaught(struct BattleSystem *bsys, int battlerId) {
    u32 flag = ov12_02261258(bsys->opponentData[battlerId]);

    if (!(bsys->battleType & (BATTLE_TYPE_WIRELESS | BATTLE_TYPE_BATTLE_TOWER)) && (flag & 1)) {
        int selectedMonIndex = ov12_022581D4(bsys, bsys->sp, 2, battlerId);
        struct PartyPokemon *mon = Battle_GetClientPartyMon(bsys, battlerId, selectedMonIndex);
        if (!CheckEvoLineCaught(bsys, bsys->sp->battlemon[bsys->sp->defence_client].species))
        {
            setAreaCaughtFlag(bsys, bsys->location);
        }
        SetPokemonGet(bsys->pokedex, mon);
    }
}