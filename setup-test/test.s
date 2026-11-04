.data
msg: .string "Cross-compiler ARMv7 OK! Risultato somma: %d\n"

.text
.global main

main:
    push {lr}

    mov r1, #12
    mov r2, #30
    add r2, r1, r2      @ somma in r2

    ldr r0, =msg        @ indirizzo stringa in r0
    mov r1, r2          @ risultato in r1
    bl printf           @ chiamata printf

    mov r0, #0
    pop {pc}
