%include "io.inc"

squareX2:
    push ebp
    mov ebp, esp
    mov eax, dword [x1]
    mov edx, dword [y2]
    sub edx, dword [y3]
    imul eax, edx
    mov ecx, eax
    mov eax, dword [x2]
    mov edx, dword [y3]
    sub edx, dword [y1]
    imul eax, edx
    add ecx, eax
    mov eax, dword [x3]
    mov edx, dword [y1]
    sub edx, dword [y2]
    imul eax, edx
    add ecx, eax
    mov eax, ecx
    push eax
    call absi
    add esp, dword 4

    mov esp, ebp
    pop ebp
    ret

; uint abs(int a) -> a
absi:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp + 8]
    cdq
    xor eax, edx
    shr edx, 31
    add eax, edx
    mov esp, ebp
    pop ebp
    ret

; int gcd(int a, int b) -> eax
gcd:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp + 8]
    mov ecx, dword [ebp + 12]
while_begin:
    cmp ecx, dword 0
    ; PRINT_UDEC 4, ecx
    ; PRINT_CHAR ' '
    ; PRINT_UDEC 4, eax
    ; NEWLINE
    jz while_end
    mov edx, dword 0
    div ecx
    mov eax, ecx
    mov ecx, edx
    jmp while_begin
while_end:
    mov esp, ebp
    pop ebp
    ret


countGraniza:
    push ebp
    mov ebp, esp
    push edi
    push esi
    mov eax, dword [x1]
    sub eax, dword [x2]
    push eax
    call absi
    add esp, dword 4
    mov esi, eax

    mov eax, dword [y1]
    sub eax, dword [y2]
    push eax
    call absi
    add esp, dword 4
    push eax
    push esi
    call gcd
    add esp, dword 8
    mov edi, eax

    mov eax, dword [x2]
    sub eax, dword [x3]
    push eax
    call absi
    add esp, dword 4
    mov esi, eax

    mov eax, dword [y2]
    sub eax, dword [y3]
    push eax
    call absi
    add esp, dword 4
    push eax
    push esi
    call gcd
    add esp, dword 8
    add edi, eax

    mov eax, dword [x3]
    sub eax, dword [x1]
    push eax
    call absi
    add esp, dword 4
    mov esi, eax

    mov eax, dword [y3]
    sub eax, dword [y1]
    push eax
    call absi
    add esp, dword 4
    push eax
    push esi
    call gcd
    add esp, dword 8
    add edi, eax
    mov eax, edi

    pop esi
    pop edi
    mov esp, ebp
    pop ebp
    ret

section .bss
x1 resd 1
y1 resd 1
x2 resd 1
y2 resd 1
x3 resd 1
y3 resd 1

section .text
global main
main:
    GET_DEC 4, [x1]
    GET_DEC 4, [y1]
    GET_DEC 4, [x2]
    GET_DEC 4, [y2]
    GET_DEC 4, [x3]
    GET_DEC 4, [y3]

    call countGraniza
    mov edi, eax
    call squareX2
    ; PRINT_UDEC 4, eax
    ; NEWLINE
    add eax, dword 2
    sub eax, edi
    mov edx, dword 0
    mov ebx, dword 2
    div ebx
    PRINT_UDEC 4, eax
    NEWLINE
    xor eax, eax
    ret