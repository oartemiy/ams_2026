%include "io.inc"


; uint reverse(uint n)
reverse:
    push ebp
    mov ebp, esp

    mov eax, dword [ebp + 8] ; n
    mov ecx, dword 0 ; ans
    push ebx
    mov ebx, dword 10

reverse_begin:
    mov edx, dword 0
    div ebx
    imul ecx, ebx
    add ecx, edx
    cmp eax, dword 0
    jne reverse_begin

reverse_end:
    mov eax, ecx
    pop ebx
    mov esp, ebp
    pop ebp
    ret


section .bss
    M resd 1
    N resd 1

section .text
global main
main:
    GET_UDEC 4, [M]
    GET_UDEC 4, [N]
    mov edi, dword [M]
    mov esi, dword [N]
for_begin:
    cmp esi, dword 0
    jz for_end
    push edi
    call reverse
    add edi, eax
    add esp, dword 4
    dec esi
    jmp for_begin

for_end:
    push edi
    call reverse
    add esp, dword 4
    cmp edi, eax
    jz palindrome
    PRINT_STRING `No`
    NEWLINE
    jmp end

palindrome:
    PRINT_STRING `Yes`
    NEWLINE
    PRINT_UDEC 4, edi
    NEWLINE
end:
    xor eax, eax
    ret