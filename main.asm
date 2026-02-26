%include "io.inc"

section .bss
arr resd 10
matr resd 9


section .data
A dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16

section .text
global main
main:
    ; arrays
;     mov ecx, dword 0
; for_start:
;     cmp ecx, dword 10
;     jge for_end

;     mov eax, ecx
;     inc eax
;     mov dword[arr + 4 * ecx], eax 

;     inc ecx
;     jmp for_start

; for_end:

    ; eax = pointer to arr
;     lea edi, [arr]

;     mov ecx, dword 0
; for_start:
;     cmp ecx, dword 10
;     jge for_end

;     mov eax, ecx
;     inc eax
;     mov dword[edi], eax 
;     add edi, dword 4

;     inc ecx
;     jmp for_start

; for_end:
;     lea edi, [matr]
;     mov ecx, dword 0
; first_for_start:
;     cmp ecx, dword 0
;     jge first_for_end
;     mov ebx, dword 0
;     second_for_start:
;         cmp ebx, dword 3
;         jle second_for_end

;         mov eax, ecx
;         add eax, ebx
;         mov dword[edi], eax
;         add edi, 4

;     second_for_end:

; first_for_end:


first_for_start:
    cmp ecx, dword 4
    jge first_for_end

    mov ebx, dword ecx

    second_for_start:
        cmp ebx, ecx
        jle second_for_end

        mov eax, ecx
        shl eax, 2
        add eax, ebx ; i * M + j
        

        mov edx, ebx
        shl edx, 2
        add eax, ecx ; j * M + i

        mov esi, dword[A + eax * 4]
        mov edi, dword[A + edx * 4]
        mov dword[A + edx * 4], esi
        mov dword[A + eax * 4], edi


    second_for_end:

first_for_end:

    xor eax, eax
    ret