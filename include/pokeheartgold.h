#ifndef POKEHEARTGOLD_H
#define POKEHEARTGOLD_H

#include "types.h"
#include "task.h"
#include "message.h"
#include "pokemon.h"

u32 LONG_CALL BattleSystem_GetBattleType(void *bsys);
BOOL LONG_CALL TrainerMessageWithIdPairExists(u32 trainer_idx, u32 msg_id, int heapId);
void LONG_CALL PlayBGM(u16 seqno);

void LONG_CALL CallTask_Blackout(TaskManager *taskManager);

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

void LONG_CALL CallTask_LeaveOverworld(TaskManager *taskManager);
void LONG_CALL CallTask_RestoreOverworld(TaskManager *taskManager);

void LONG_CALL RestoreMonHPBy(struct PartyPokemon *mon, u32 hp, u32 maxHp, u32 restoration);
void LONG_CALL AddMonData(struct PartyPokemon *mon, int attr, int amount);
BOOL LONG_CALL BoostMonMovePpUpBy(struct PartyPokemon *mon, int moveIdx, int nPpUp);
s32 LONG_CALL TryModEV(s32 ev, s32 evSum, s32 by);
void LONG_CALL ApplyItemEffectOnMonMood(struct PartyPokemon *mon, u16 itemId);
BOOL LONG_CALL DoItemFriendshipMod(struct PartyPokemon *mon, s32 friendship, s32 mod, u16 location, int heapID);


int32_t LONG_CALL NPCTrainerGetBattleIntroAndMusicParam(uint32_t trainerClass);
int32_t LONG_CALL WildPokemonGetBattleIntroAndMusicParam(uint32_t arg0, uint32_t arg1);

void LONG_CALL LoadScriptsAndMessagesParameterized(FieldSystem *fieldSystem, struct SCRIPTCONTEXT *ctx, int scriptBank, u32 msgBank);
void LONG_CALL LoadScriptsAndMessagesForCurrentMap(FieldSystem *fieldSystem, struct SCRIPTCONTEXT *ctx);
u32 LONG_CALL MapObject_GetSpriteID(void *object);

struct ScriptBankMapping {
    u16 scriptIdLo;
    u16 scriptBank;
    u16 msgBank;
};

typedef struct Options {
    u16 textSpeed : 4;
    u16 soundMethod : 2;
    u16 battleStyle : 1;
    u16 battleScene : 1;
    u16 buttonMode : 2;
    u16 frame : 5;
    u16 dummy : 1;
} Options;

typedef struct NamingScreenArgs {
    int kind;
    int playerGenderOrMonSpecies; // monSpecies
    int monForm;
    int maxLen;
    int monGender;
    BOOL noInput;
    String *nameInputString;
    u16 nameInputFlat[20];
    int battleMsgId;
    int *pcStorage;
    Options *options;
    int *pMenuInputState;
} NamingScreenArgs;

typedef struct NamingScreenData {
    int state;
    int partyIdx;
    u16 *retVar;
    NamingScreenArgs *args;
    String *unk10;
} NamingScreenData;

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