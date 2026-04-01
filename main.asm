%include "io.inc"

find_sequence:
    push ebp
    mov ebp, esp
    push edi
    push ebx
    push esi
    sub esp, dword 4

    mov ecx, dword [N]
    mov edi, 1
    ; for avail
initLoop:
    mov dword [avail + edi*4], dword 1
    inc edi
    cmp edi, ecx
    jle initLoop

    mov ebx, dword 1 ; current pos
    mov eax, dword [M]
    mov dword [ebp-4], eax ; M


mainLoop:
    cmp ebx, dword [K]
    jg end
    ; pos - numbers are used
    ; step = fact[N-pos] / fact[N-K]
    mov eax, dword [N]
    sub eax, ebx
    mov ecx, dword [N]
    sub ecx, dword [K]

    mov eax, dword [fact + eax*4]
    mov ecx, dword [fact + ecx*4]
    mov edx, dword 0
    div ecx
    mov esi, eax ; step

    ; find number
    mov ecx, dword 1 ; x
    mov edx, dword [ebp-4] ; cur M

searchLoop:
    cmp dword [avail + ecx*4], dword 0
    jz next

    cmp edx, esi
    jle choose

    sub edx, esi
    jmp next

choose:
    PRINT_UDEC 4, ecx
    cmp ebx, dword [K]
    je noSpace
    PRINT_CHAR ' '
noSpace:
    mov dword [avail + ecx*4], dword 0
    mov dword [ebp-4], edx
    inc ebx
    jmp mainLoop

next:
    inc ecx
    jmp searchLoop

end:
    add esp, dword 4
    pop esi
    pop ebx
    pop edi
    pop ebp
    ret

section .data
    fact dd 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800

section .bss
    N resd 1
    K resd 1
    M resd 1
    avail resd 11

section .text
global main
main:
    GET_DEC 4, [N]
    GET_DEC 4, [K]
    GET_DEC 4, [M]

    call find_sequence

    NEWLINE
    xor eax, eax
    ret