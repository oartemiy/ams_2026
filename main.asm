%include "io.inc"

section .bss
x resb 1
y resb 1

section .text
global main
main:
    GET_CHAR [x]
    GET_DEC 1, [y]

    mov al, [x]
    sub al, byte 'A'
    add al, byte 1
    mov byte [x], byte al

    mov al, 8
    mov bl, 8
    sub al, byte [x]
    sub bl, byte [y]

    mul bl
    mov ah, 0
    mov bl, 2

    div bl

    PRINT_DEC 1, al
    NEWLINE

    xor eax, eax
    ret