%include "io.inc"

section .bss
arr resd 10000

section .text
global main
main:
    GET_UDEC 4, eax ; N
    mov ecx, dword 0
input_for_begin:
    cmp ecx, eax
    je input_for_end
    GET_DEC 4, [arr + ecx * 4]
    inc ecx
    jmp input_for_begin
input_for_end:
    mov ecx, dword 1
first_sort_for_begin:
    cmp ecx, eax
    je first_sort_for_end
    push ecx
    mov ecx, dword 1
    second_sort_for_begin:
        cmp ecx, eax
        je second_sort_for_end
        mov ebx, dword [arr + 4 * ecx - 4]
        cmp ebx, dword [arr + 4 * ecx]
        jle if_end
        if_start:
            ; swap
            mov edx, dword[arr + 4 * ecx]
            mov dword [arr + 4 * ecx], ebx
            mov dword [arr + 4 * ecx - 4], edx
            
        if_end:
            inc ecx
            jmp second_sort_for_begin


    second_sort_for_end:
    pop ecx
    inc ecx
    jmp first_sort_for_begin


first_sort_for_end:
    mov ecx, 0
print_for_begin:
    cmp ecx, eax
    je print_for_end
    PRINT_DEC 4, [arr + 4 * ecx]
    PRINT_CHAR ' '
    inc ecx
    jmp print_for_begin

print_for_end:
    NEWLINE
end:
    xor eax, eax
    ret