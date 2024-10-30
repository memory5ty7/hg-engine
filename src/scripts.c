#include "../include/types.h"
#include "../include/script.h"
#include "../include/bag.h"
#include "../include/repel.h"

// script command 0xD0, DummyTextTrap/scrcmd_208
u32 ScrCmd_master_new_script_command(SCRIPTCONTEXT *ctx)
{
    u32 sw = ScriptReadByte(ctx);
    u32 arg0 = ScriptReadHalfword(ctx);

    switch (sw)
    {
    case 0:
        // Register Item provided in arg0
        SaveData *saveData = SaveBlock2_get();
        BAG_DATA *bag = Sav2_Bag_get(saveData);
        Bag_TryRegisterItem(bag, arg0);
        break;
    case 1:
        // Activate/deactivate Repellent
    #ifdef IMPLEMENT_REUSABLE_REPELS
        Repel_Use();
    #endif
        break;
    default:
        break;
    };
};