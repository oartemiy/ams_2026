%include "io.inc"

section .bss
N resd 1
K resd 1
len resd 1
sum resd 1
bin resb 32
C resd 961 ; pascal treygolnick = 31 * 31

section .text
global main
main:
    GET_UDEC 4, [N]
    GET_UDEC 4, [K]

    mov dword[sum], dword 0
    mov eax, dword [N]
    mov ecx, dword 0
    mov edx, dword 0
    mov ebx, dword 2
to_bin_start:
    cmp eax, dword 0
    jz to_bin_end
    inc ecx
    div ebx

    mov edi, dword 32
    sub edi, ecx
    mov byte[bin + edi], dl
    mov edx, dword 0
    jmp to_bin_start
to_bin_end:
    mov dword [len], ecx
    cmp ecx, dword [K] ; if less than K bits
    jb not_equal
    ; pascal treygolnick

    mov dword[C], dword 1 ; C[0][0] = 1
    mov ecx, dword 1
C_count_begin_1:
    cmp ecx, dword 31
    jz C_count_end_1
    mov eax, ecx
    imul eax, 31 ; prenabrezhenie (because 0 has 31 positions)
    mov dword [C + 4 * eax], dword 1 ; first value always 1 
    add eax, ecx
    mov dword [C + 4 * eax], dword 1 ; last value always 1
    mov edx, 1
C_count_begin_2:
    cmp edx, ecx
    jae C_count_end_2
    mov eax, ecx
    dec eax
    imul eax, 31
    add eax, edx
    mov ebx, dword [C + 4 * eax]
    mov eax, ecx
    dec eax
    imul eax, 31
    lea eax, [eax + edx - 1]
    add ebx, dword [C + 4 * eax]

    mov eax, ecx
    imul eax, 31
    add eax, edx
    mov dword [C + 4 * eax], ebx
    inc edx
    jmp C_count_begin_2

C_count_end_2:
    inc ecx
    jmp C_count_begin_1
C_count_end_1:

    mov ecx, dword 1
for_less_len_begin: ; for less lens formula is easy
    cmp ecx, dword[len]
    jae for_less_len_end

    mov eax, ecx
    dec eax
    cmp eax, dword[K] ; don't count for lens less than K
    jb skip
    
    mov ebx, dword [K] ; po k
    imul eax, 31
    add eax, ebx
    mov eax, dword [C + 4 * eax]
    add dword [sum], eax
skip:
    inc ecx
    jmp for_less_len_begin
for_less_len_end:
    ; PRINT_UDEC 4, [sum]
    ; NEWLINE
    mov ecx, dword 1 ; cur_ind
    mov edi, dword 0 ; zero count
for_eq_len_begin:
    cmp ecx, dword [len]
    jae for_eq_len_end
    cmp edi, dword [K]
    je not_equal
    mov esi, dword 32
    sub esi, dword [len]
    add esi, ecx
    ; PRINT_CHAR '$'
    ; PRINT_UDEC 4, esi
    ; NEWLINE
    mov al, byte [bin + esi]
    cmp al, byte 1
    jne cont
    mov eax, dword [K]
    sub eax, edi
    dec eax
    mov ebx, dword [len]
    sub ebx, ecx
    dec ebx
    
    imul ebx, 31
    add eax, ebx
    ; PRINT_UDEC 4, eax
    ; PRINT_CHAR ' '
    ; PRINT_UDEC 4, ebx
    ; NEWLINE
    mov eax, dword[C + 4 * eax]
    add dword [sum], eax

    inc ecx
    jmp for_eq_len_begin
cont: 
    inc edi
    inc ecx
    jmp for_eq_len_begin

for_eq_len_end:
    cmp edi, dword [K]
    jne not_equal
    add dword[sum], dword 1
not_equal:
    PRINT_UDEC 4, [sum]
    NEWLINE
    xor eax, eax
    ret