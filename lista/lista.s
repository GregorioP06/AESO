@ prendi numeri da argv e crea una lista, allocando ogni elemento con malloc
@ parto dall'ulitmo e inserisco in testa

@ head = null
@ for (i=argc-1; i>1; i--) {
@     new = malloc(8)
@     new.val = argv[i]
@     new.next = head
@     head = new
@ }

@ r4 = argc
@ r5 = argv
@ r6 = head
@ r7 = indice

.text
.global main

main:
    push {r4-r7, lr}
    mov r4, r0      @ argc in r4
    mov r5, r1      @ argv in r5
    mov r6, #0      @ head = null in r6
    mov r7, r4      @ i = argc in r7
    sub r7, #1      @ i--
loop:
    cmp r7, #1
    beq fine
    mov r0, #8      @ argomento di malloc (voglio 8 byte)
    bl malloc
    push {r0}
    ldr r0, [r5, r7, lsl #2]    @ carico il valore da argv
    bl atoi                     @ lo converto in intero
    mov r1, r0      @ mi salvo il risultato in r1
    pop {r0}        @ riprendo il puntatore al new
    str r1, [r0]    @ carico in new.val il valore intero
    str r6, [r0, #4]    @ carico in new.next
    mov r6, r0      @ aggiorno la testa
    sub r7, r7, #1  @i--
    b loop
fine:
    mov r0, #0
    pop {r4-r7, pc}
