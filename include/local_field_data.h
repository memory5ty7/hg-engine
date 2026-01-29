#ifndef LOCAL_FIELD_DATA_H
#define LOCAL_FIELD_DATA_H

#include "types.h"
#include "pokemon.h"

typedef struct LocalFieldData {
    Location currentPosition;
    Location entrancePosition;
    Location previousPosition;
    Location dynamicWarp;
    Location specialSpawn;
    u16 musicId;
    u16 weather;
    u16 lastSpawn;
    u8 cameraType;
    //struct PlayerSaveData player;
    //u16 poisonStepCounter;
    //u16 safariStepCounter;
    //u16 safariBallCounter;
    //u8 filler7A[6];
} LocalFieldData;

#endif // LOCAL_FIELD_DATA_H