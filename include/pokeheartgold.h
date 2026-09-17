#ifndef POKEHEARTGOLD_H
#define POKEHEARTGOLD_H

#include "types.h"
#include "task.h"
#include "message.h"
#include "pokemon.h"

void LONG_CALL RestoreMonHPBy(struct PartyPokemon *mon, u32 hp, u32 maxHp, u32 restoration);
void LONG_CALL AddMonData(struct PartyPokemon *mon, int attr, int amount);
BOOL LONG_CALL BoostMonMovePpUpBy(struct PartyPokemon *mon, int moveIdx, int nPpUp);
s32 LONG_CALL TryModEV(s32 ev, s32 evSum, s32 by);
void LONG_CALL ApplyItemEffectOnMonMood(struct PartyPokemon *mon, u16 itemId);
BOOL LONG_CALL DoItemFriendshipMod(struct PartyPokemon *mon, s32 friendship, s32 mod, u16 location, int heapID);

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

typedef struct SpriteManager {
    void *spriteList;
    void *spriteHeaderList;                // 4
    void *_2dGfxResHeader;                        // 8
    void *_2dGfxResMan[6];         // C
    void *_2dGfxResObjList[6]; // 24
    int numGfxResObjects[6];
    int numGfxResObjectTypes;
} SpriteManager; // size: 0x58

typedef struct PokemonPreview {
    SpriteManager spriteManager;
    void *managedSprite;
    void *bgConfig;
    u8 bgLayer;
    u8 x;
    u8 y;
    u8 state;
} PokemonPreview;

PokemonPreview *LONG_CALL sub_0200F5C4(void *bgConfig, u8 x, u8 y, int layer, u32 heapID); // CreatePokemonPreviewTask
void LONG_CALL sub_0200F600(PokemonPreview *preview, u32 heapID); // sub_0200ED50
void LONG_CALL sub_0200F62C(PokemonPreview *preview); // LoadPokemonPreviewResources
void LONG_CALL sub_0200F684(PokemonPreview *preview, u8 x, u8 y); // CreatePokemonPreviewSprite
void LONG_CALL sub_0200F6D4(void *param0, u16 species, u8 gender); // LoadAndDrawPokemonPreviewSprite
void LONG_CALL sub_0200F82C(PokemonPreview *preview, u8 palette, u16 tile); // DrawPokemonPreviewWindow
void LONG_CALL Bg_CopyTilemapBufferToVRAM(void *bgConfig, u8 bgLayer); // BgCommitTilemapBufferToVram
void LONG_CALL sub_0200F9DC(struct PokemonPreview *preview); // ErasePokemonPreviewWindow
void LONG_CALL Sprite_DeleteAndFreeResources(void *managedSprite);
void LONG_CALL FieldSpriteManager_ReleaseWithoutResDat(void *fieldSpriteManager);
void LONG_CALL SpriteTransfer_DeleteAllCharTransferTasks(void *charResObjList);
void LONG_CALL SpriteTransfer_DeleteAllPlttTransferTasks(void *plttResObjList);
void LONG_CALL Delete2DGfxResObjList(void *list);
void LONG_CALL Destroy2DGfxResObjMan(void *mgr);
BOOL LONG_CALL SpriteList_Delete(void *spriteList);

void LONG_CALL SpriteResourceManager_Cleanup(void *spriteManager);

typedef struct FieldSpriteManager {
    void *spriteList;
    u8 renderer[296];
    void *spriteResourceHeaderList;
    void *spriteResManagers[6];
    void *spriteResObjLists[6];
    u16 numResMans; // unk_160
    u16 heapID;
} FieldSpriteManager;

typedef struct Sprite {
    u8 raw[0x104];
} Sprite;

typedef struct SpriteList {
    void *sprites;                  // 0x000
    int numSprites;                   // 0x004
    void **stack;                   // 0x008
    int stackPointer;                 // 0x00C
    Sprite dummy;                     // 0x010
    void *renderer; // 0x114
    void *animBuff;                   // 0x118
    void *animBank; // 0x11C
    u32 flag;                         // 0x120
} SpriteList;

BOOL LONG_CALL SpriteList_DeleteAllSprites(SpriteList *spriteList);
void LONG_CALL SpriteList_Init(SpriteList *spriteList);

#endif // POKEHEARTGOLD_H