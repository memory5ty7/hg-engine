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

#endif // POKEHEARTGOLD_H