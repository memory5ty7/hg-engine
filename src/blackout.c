#include "../include/types.h"
#include "../include/save.h"
#include "../include/constants/vars_flags.h"
#include "../include/task.h"
#include "../include/blackout.h"

void CallTask_Blackout(TaskManager *taskManager) {
    ClearScriptFlag(FLAG_NUZLOCKE_MODE);
    TaskManager_Call(taskManager, Task_Blackout, NULL);
}