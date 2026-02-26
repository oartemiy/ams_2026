%include "io.inc"

section .bss
A resd 1
B resd 1

section .text
global main
main:
    GET_UDEC 4, [A]
    GET_UDEC 4, [B]
    mov eax, dword[A]
    mov ebx, dword[B]
    cmp eax, ebx
    jb swap
    jmp start_gcd
swap:
    mov edx, eax
    mov eax, ebx
    mov ebx, edx
start_gcd:
    mov edx, dword 0
    div ebx
    cmp edx, 0
    jz end_gcd
    mov eax, ebx
    mov ebx, edx
    jmp start_gcd

end_gcd:
    PRINT_UDEC 4, ebx
    NEWLINE
    xor eax, eax
    ret