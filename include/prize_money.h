#ifndef PRIZE_MONEY_H
#define PRIZE_MONEY_H

#include "types.h"

typedef struct TrainerMoney {
    u16 class;
    u16 multiplier;
} TrainerMoney;

extern struct TrainerMoney PrizeMoney[];

#endif