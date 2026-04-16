%include "io.inc"
section .text
global main
main:
    xor ebx, ebx
    xor eax, eax
    
.start_read:
    cmp ebx, 32
    je .end_read
    
    GET_DEC 4, eax
    mov ecx, ebx
    sub ecx, eax
        
    cmp ecx, 0
    jge .left_side
    mov ecx, 0
    
.left_side:
    mov edx, ebx
    add edx, eax
    cmp edx, 31
    jle .right_side
    mov edx, 31
    
.right_side:
    mov esi, ecx
    mov edi, edx
    
.cycle_bit:
    mov eax, 0
    cmp esi, edi
    jg .cycle_end
    
    bts eax, esi

    inc esi
    jmp .cycle_bit
    
.cycle_end:
    inc ebx
    jmp .start_read
    
.end_read:
    PRINT_UDEC 4, eax
    xor eax, eax
    ret