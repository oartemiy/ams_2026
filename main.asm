%include "io.inc"

section .bss
N resd 1

section .text
global main
main:
    GET_UDEC 4, [N]
    mov eax, dword[N]
    mov ebx, dword 0
while_begin:
    cmp eax, dword 0
    jz while_end
    mov ecx, eax
    and ecx, 1
    add ebx, ecx
    shr eax, 1
    jmp while_begin

while_end:
    PRINT_UDEC 4, ebx
    NEWLINE
    xor eax, eax
    ret