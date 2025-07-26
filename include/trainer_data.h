#ifndef TRAINER_DATA_H
#define TRAINER_DATA_H

#include "constants/trainerclass.h"
#include "types.h"

#pragma once
#include "pokemon.h"

typedef enum TrainerGender {
    TRAINER_MALE,
    TRAINER_FEMALE,
    TRAINER_DOUBLE,
} TrainerGender;

typedef struct TrainerData {
    /*000*/ u8 trainerType;
    /*001*/ u8 trainerClass;
    /*002*/ u8 unk_2;
    /*003*/ u8 npoke;
    /*004*/ u16 items[4];
    /*00C*/ u32 aiFlags;
    /*010*/ u32 doubleBattle;
} TrainerData;

typedef struct Trainer {
    struct TrainerData data;
    /*014*/ u16 name[7 + 1];
    // Used in the Frontier
    u8 padding[16];
} Trainer; // size=0x34

void LONG_CALL TrainerData_ReadTrData(u32 trno, Trainer *dest);

#endif
