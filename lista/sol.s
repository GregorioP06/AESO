@ r4 = argc
@ r5 = argv
@ r6 = indice
@ r7 = puntatore a testa lista

@ inserimento in testa dei numeri passati per argomento

@ for (i=1; i < argv; i++) {
@ new = malloc(8)
@ new.val = atoi(argv[i])
@ new.next = head
@ head = new
@ }

.text
.global main

main:
    push {r4,r5,r6,r7,LR}
    mov r4, r0  @ argc
    mov r5, r1  @ argv
    mov r6, #1  @ indice
loop:
    cmp r6, r4  @ while indice != argc
    beq fine
    mov r0, #8  @ 8 (byte da chiedere a malloc)
    bl malloc   @ r0 = return della malloc
    str r7, [r0, #4]
    mov r7, r0
    ldr r0, [r5, r6, lsl #2]    @ r0 = [r5 + r6 * 4]
    bl atoi     @ in numero
    str r0, [r7]
    add r6, r6, #1  @ indice++
    b loop
fine:
    mov r0, #0  @ return value
    pop {r4-r7,lr}
    mov pc, lr
