%include "io.inc"

rotate:
    push ebp
    mov ebp, esp

    GET_DEC 4, eax
    cmp eax, dword 0
    jz end
    test ebx, dword 1

    jz even
odd:
    PRINT_DEC 4, eax
    PRINT_CHAR ' '
    inc ebx
    call rotate
    jmp end

even:
    push eax
    inc ebx
    call rotate
    pop eax
    PRINT_DEC 4, eax
    PRINT_CHAR ' '

end:
    mov esp, ebp
    pop ebp
    ret

section .text
global main
main:
    mov ebx, dword 1
    call rotate
    
    xor eax, eax
    ret