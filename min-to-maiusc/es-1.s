@ min-to-maiusc.s ma solo le lettere minuscole vengono convertite (no simboli)

@ r0 = indirizzo stringa
@ r1 = char stringa

.data
s:	.string "abc ABC {}\n"

.text
.global main

main:
	push {lr}
	ldr r0,=s 			@ recupero dell'indirizzo della stringa in memoria

loop:					@ per ogni carattere della stringa
	ldrb r1, [r0]		@ carichiamo il byte puntato dalla stringa nel registro r1
	cmp r1, #0			@ controlliamo se sia arrivato in fondo (NULL terminated string)
	beq	fine			@ se siamo arrivati, abbiamo finito
	cmp r1, #97			@ confrontiamo il carattere letto con 'a'
	blt cont			@ se non è una lettera minuscola, allora saltiamo il passaggio della trasformazione
	cmp r1, #122	    @ confronto con 'z'
	bgt cont
	sub r1,r1,#32		@ togliamo dalla lettera la diff fra il codice di 'a' (97) e quello di 'A' (65)

cont:
	strb r1, [r0],#1	@ rimettiamo a posto il codice del nuovo carattere nella stringa
						@ e predisponiamo r0 a puntare al prossimo carattere
	b loop				@ eseguiamo un'altra iterazione

fine:
	@ scandita tutta la stringa, stampa risultato
    ldr r0, =s
	bl printf

	pop {pc}
