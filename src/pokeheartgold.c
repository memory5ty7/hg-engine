#include "../include/pokeheartgold.h"
#include "../include/constants/vars_flags.h"
#include "../include/script.h"

const struct ScriptBankMapping *sScriptBankMapping = (const struct ScriptBankMapping *)0x020FA4A4;

u16 LoadScriptsAndMessagesByMapId(FieldSystem *fieldSystem, struct SCRIPTCONTEXT *ctx, u16 scriptId) {
    if (scriptId >= 7000 && scriptId <= 7000 + MAX_TOTAL_ITEM_NUM) {
        TaskManager *taskman = fieldSystem->taskman;

        if (taskman != NULL && taskman->env != NULL) {
            void **mapObj = FieldSysGetAttrAddr(fieldSystem, 10);

            if (mapObj != NULL && *mapObj != NULL && MapObject_GetSpriteID(*mapObj) == 87) {
                LoadScriptsAndMessagesParameterized(fieldSystem, ctx, 141, 199);
                return scriptId - 7000;
            }
        }
    }

    const struct ScriptBankMapping *mapping_p = sScriptBankMapping;
    int i;
    for (i = 0; i < 30; i++) {
        if (scriptId >= mapping_p[i].scriptIdLo) {
            LoadScriptsAndMessagesParameterized(fieldSystem, ctx, mapping_p[i].scriptBank, mapping_p[i].msgBank);
            return scriptId - mapping_p[i].scriptIdLo;
        }
    }

    if (scriptId >= 1) {
        LoadScriptsAndMessagesForCurrentMap(fieldSystem, ctx);
        return scriptId - 1;
    } else {
        LoadScriptsAndMessagesParameterized(fieldSystem, ctx, 140, 184);
        return 0;
    }
}