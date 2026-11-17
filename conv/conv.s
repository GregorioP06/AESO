.text
.global conv
.type conv, %function

@ r0 = carattere hex da convertire in dec

conv: @ controllo se sono nel range 0-9
    cmp r0, #48
    blt lettere
    cmp r0, #57
    bgt lettere
    and r1, r0, #15
    b return
lettere: @ controllo se sono nel range a-f (minuscole)
    cmp r0, #97
    blt error
    cmp r0, #102
    bgt error
    and r1, r0, #7
    add r1, r1, #9
return:
    mov r0, r1
    mov pc, lr
error: @ sono fuori range 0-f
    mov r0, #-1
    mov pc, lr
