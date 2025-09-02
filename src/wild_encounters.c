#include "../include/types.h"

void WildEncounters_ReplaceTimedEncounters(u8 *r0, u8 *r1) {
    u32 r3, r4, r5;
    u32 r2 = 0;

    r5 = (u32)r0;
    r4 = (u32)r1;

    r3 = r5 + 0x14;

    do {
        u16 value = *(u16 *)r3;
        *(u16 *)r4 = value;
        u8 byte_value = *(u16 *)(r5 + 8);
        *(u16 *)(r4 + 4) = byte_value;
        *(u16 *)(r4 + 6) = byte_value;
        r4 += 8;
        r3 += 2;
        r2++;
    } while (r2 < 12);
}

void WildEncounters_ReplaceRadioEncounters(u32 r1, u32 r2) {
    u32 r3, r4, r5;
    r5 = r1;
    r4 = r2;

    return;
}