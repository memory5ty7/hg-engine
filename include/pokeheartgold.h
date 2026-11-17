#ifndef POKEHEARTGOLD_H
#define POKEHEARTGOLD_H

#include "types.h"
#include "task.h"
#include "message.h"

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

typedef struct BUGMON {
    u16 species;
    u8 lvlmin;
    u8 lvlmax;
    u8 rate;
    u8 score;
    u8 dummy[2];
} BUGMON;

#define BUGMON_COUNT 10

typedef struct BugContestantData {
    u8 national;
    u8 day;
    u16 species;
    u16 score;
    u16 randmod;
} BugContestantData;

typedef struct BugContestant {
    u8 id;
    u16 score;
    BugContestantData data;
} BugContestant;

#define BUGCONTESTANT_NPC_COUNT 5
#define BUGCONTESTANT_PLAYER    BUGCONTESTANT_NPC_COUNT
#define BUGCONTESTANT_COUNT     (BUGCONTESTANT_NPC_COUNT + 1)

typedef struct BugContest {
    int heapID;                             // Always set to 3
    void *saveData;                             // Pointer to save data
    void *party_bak;                               // Player's party is held for the contest
    void *party_cur;                               // Only the lead Pokemon
    struct PartyPokemon *mon;                                   // The Pokemon you caught in the contest
    u8 lead_mon_idx;                                // Slot number of the Pokemon you battled with
    u8 party_cur_num;                               // Size of the party pre-contest
    u8 day_of_week;                                 // Used to choose NPCs and encounters
    u8 caught_poke : 1;                             // If you've caught a Pokemon in the contest
    u8 national_dex : 1;                            // Used to choose NPCs and encounters
    u8 placement : 6;                               // 0: First, 1: Second, 2: Third, 3: Consolation
    u16 sport_balls;                                // Set to 20, decremented on use
    u16 prize;                                      // Item ID
    u32 elapsed_time;                               // Used to determine when the contest ends
    BUGMON encounters[BUGMON_COUNT];                // Which wild Pokemon you can find
    BugContestant contestants[BUGCONTESTANT_COUNT]; // 5 NPCs + player
    u8 ranking[BUGCONTESTANT_COUNT];                // Index sorting by score at the end
} BugContest;

void CallTask_NamingScreenCustom(TaskManager *taskman, int type, int species, int maxLen, int partyIdx, const u16 *defaultStr, u16 *retVar);
BOOL Task_NamingScreenCustom(TaskManager *taskman);

BugContest * LONG_CALL FieldSystem_BugContest_Get(FieldSystem *fieldSystem);
void * LONG_CALL SaveArray_Party_Get(void *saveData);
NamingScreenArgs *LONG_CALL NamingScreen_CreateArgs(int heapID, int kind, int param, int maxLen, Options *options, void *pMenuInputState);
Options *LONG_CALL Save_PlayerData_GetOptionsAddr(void *saveData);

#endif // POKEHEARTGOLD_H