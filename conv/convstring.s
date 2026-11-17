.text
.global convstring
.type convstring, %function

@ r4 = indirizzo stringa
@ r5 = totalizzatore

convstring:
    push {r4, r5, lr}
    mov r4, r0
    mov r5, #0
loop:
    ldrb r0, [r4], #1
    cmp r0, #0      @ se trovo null end
    beq end
    bl conv
    lsl r5, r5, #4
    add r5, r5, r0
    b loop
end:
    mov r0, r5
    pop {r4, r5, pc}
