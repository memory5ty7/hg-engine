#include "../../include/battle.h"
#include "../../include/pokemon.h"
#include "../../include/types.h"
#include "../../include/pokeheartgold.h"
#include "../../include/constants/sndseq.h"

BOOL CheckTrainerMessage(void *bsys, struct BattleStruct *ctx) {
    int state = BattleSystem_GetBattleType(bsys); // note: this should be battleType for the following three if statements, but it won't match if an additional variable is used
    int trainerIndex;

    if (state & 0x84) {
        return FALSE;
    }

    if (!(state & BATTLE_TYPE_TRAINER)) {
        return FALSE;
    }

    if (state & BATTLE_TYPE_DOUBLE) {
        return FALSE;
    }

    trainerIndex = BattleWork_GetTrainerIndex(bsys, 1);
    state = 0;

    do {
        switch (state) {
        case 0:
            if (ctx->battlemon[1].hit_count == 1 && !(ctx->server_status_flag2 & BATTLE_STATUS2_FIRST_DAMAGE_MESSAGE) && TrainerMessageWithIdPairExists(trainerIndex, 13, 5)) {
                ctx->server_status_flag2 |= BATTLE_STATUS2_FIRST_DAMAGE_MESSAGE;
                ctx->msg_work = 13;
                return TRUE;
            }
            state++;
            break;
        case 1:
            if (!(ctx->battlemon[1].message_flag & 2) && ctx->battlemon[1].hp <= ctx->battlemon[1].maxhp / 2 && TrainerMessageWithIdPairExists(trainerIndex, 14, 5)) {
                ctx->battlemon[1].message_flag |= 2;
                ctx->msg_work = 14;
                return TRUE;
            }
            state++;
            break;
        case 2:
            if (!(ctx->battlemon[1].message_flag & 3)) {
                int i;
                int aliveMons;
                struct Party *party;
                struct PartyPokemon *mon;

                party = BattleWorkPokePartyGet(bsys, 1);
                aliveMons = 0;

                for (i = 0; i < PokeParty_GetPokeCount(party); i++) {
                    mon = Party_GetMonByIndex(party, i);
                    if (GetMonData(mon, MON_DATA_HP, NULL)) {
                        aliveMons++;
                    }
                }
                if (aliveMons == 1 && TrainerMessageWithIdPairExists(trainerIndex, 15, 5)) {
                    ctx->battlemon[1].message_flag |= 3;
                    ctx->msg_work = 15;

                    Trainer *trainer = BattleSystem_GetTrainer(bsys, 1);

                    u8 trainerClass = trainer->data.trainerClass;

                    BOOL finalMonMusic = FALSE;

                    switch (trainerClass) {
                    case TRAINERCLASS_LEADER_FALKNER:
                    case TRAINERCLASS_LEADER_BUGSY:
                    case TRAINERCLASS_LEADER_WHITNEY:
                    case TRAINERCLASS_LEADER_MORTY:
                    case TRAINERCLASS_LEADER_JASMINE:
                    case TRAINERCLASS_LEADER_CHUCK:
                    case TRAINERCLASS_LEADER_PRYCE:
                    case TRAINERCLASS_LEADER_CLAIR:
                    //case TRAINERCLASS_ELITE_FOUR_WILL:
                    //case TRAINERCLASS_ELITE_FOUR_KOGA:
                    //case TRAINERCLASS_ELITE_FOUR_BRUNO:
                    //case TRAINERCLASS_ELITE_FOUR_KAREN:
                    case TRAINERCLASS_CHAMPION:
                    case TRAINERCLASS_LEADER_BROCK:
                    case TRAINERCLASS_LEADER_MISTY:
                    case TRAINERCLASS_LEADER_LT_SURGE:
                    case TRAINERCLASS_LEADER_ERIKA:
                    case TRAINERCLASS_LEADER_JANINE:
                    case TRAINERCLASS_LEADER_SABRINA:
                    case TRAINERCLASS_LEADER_BLAINE:
                    case TRAINERCLASS_LEADER_BLUE:
                        finalMonMusic = TRUE;
                        break;
                    default:
                        break;
                    }

                    if (finalMonMusic) {
                        Snd_BgmPlay(SEQ_VS_LASTMON);
                    }
                    return TRUE;
                }
            }
            state++;
            break;
        case 3:
            if (!(ctx->battlemon[1].message_flag & 4)) {
                int i;
                int aliveMons;
                struct Party *party;
                struct PartyPokemon *mon;

                party = BattleWorkPokePartyGet(bsys, 1);
                aliveMons = 0;

                for (i = 0; i < PokeParty_GetPokeCount(party); i++) {
                    mon = Party_GetMonByIndex(party, i);
                    if (GetMonData(mon, MON_DATA_HP, NULL)) {
                        aliveMons++;
                    }
                }
                if (aliveMons == 1 && (ctx->battlemon[1].hp <= ctx->battlemon[1].maxhp / 2) && TrainerMessageWithIdPairExists(trainerIndex, 16, 5)) {
                    ctx->battlemon[1].message_flag |= 4;
                    ctx->msg_work = 16;
                    return TRUE;
                }
            }
            state++;
            break;
        case 4:
            break;
        }
    } while (state != 4);

    return FALSE;
}