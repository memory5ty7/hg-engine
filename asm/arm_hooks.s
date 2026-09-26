.text
.align 2
.arm

.global NNSi_SndArcLoadBank_hook
NNSi_SndArcLoadBank_hook:
ldr r5, =NNSi_SndArcLoadBank_return_address
mov r6, lr
str r6, [r5]
pop {r5-r6}
blx NNSi_SndArcLoadBank
ldr r1, =NNSi_SndArcLoadBank_return_address
ldr r1, [r1]
mov pc, r1

.pool


.global NNS_SndMain_ASM
NNS_SndMain_ASM:
    push {lr}
    blx NNS_SndMain_Hook
    pop {pc}

// The hook overwrites the first 3 instructions, including the start of the reply loop,
// so the loop is rebuilt here and the original resumes right after it.
.global NNS_SndMain_Original
NNS_SndMain_Original:
    push {r4, lr}
    mov r4, #0
NNS_SndMain_RecvReplyLoop:
    mov r0, r4
    bl SND_RecvCommandReply
    cmp r0, #0
    bne NNS_SndMain_RecvReplyLoop
    ldr r3, =0x020C7970
    bx r3
.pool

NNSi_SndArcLoadBank_return_address:
.word 0
