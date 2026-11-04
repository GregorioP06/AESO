@ es-1.s ma strb eseguita solo se serve

@ r0 = indirizzo stringa
@ r1 = char stringa

.data
s:	.string "abc ABC {}\n"

.text
.global main

main:
	push {lr}
	ldr r0, =s 			@ carico indirizzo stringa

loop:
	ldrb r1, [r0]		@ carico carattere (1 byte)
	cmp r1, #0			@ controllo se NULL terminator
	beq	fine
	cmp r1, #97			@ confronto con 'a'
	blt cont			@ se < prossima iterazione
	cmp r1, #122	    @ confronto con 'z'
	bgt cont            @ se > prossima iterazione
	sub r1,r1,#32		@ converto in maiuscolo (sottraendo 32)
	strb r1, [r0]	    @ salvo il nuovo carattere nella stringa

cont:
    add r0, #1          @ incremento r0 per farlo puntare al prossimo carattere (byte)
	b loop

fine:                   @ fine stringa, stampa risultato
    ldr r0, =s
	bl printf

	pop {pc}
