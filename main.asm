%include "io.inc"

div3:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp + 8] ;n
    cmp eax, dword 0
    je yes
while_begin: ; x == x / 4 + x % 4 (mod 3)
    cmp eax, dword 3
    jbe while_end
    mov edx, eax
    and eax, dword 3
    shr edx, 2
    add eax, edx
    jmp while_begin
while_end:
    cmp eax, dword 0
    je yes
    cmp eax, dword 3
    je yes
    jmp no
yes:
    PRINT_STRING `YES`
    NEWLINE
    jmp end 
no:
    PRINT_STRING `NO`
    NEWLINE
end:
    mov esp, ebp
    pop ebp
    ret

section .bss
N resd 1

section .text
global main
main:
    GET_UDEC 4, [N]
    mov ecx, dword [N]
for_begin:
    cmp ecx, dword 0
    je for_end
    GET_UDEC 4, eax
    push eax
    call div3
    pop eax
    dec ecx
    jmp for_begin
for_end:
    xor eax, eax
    ret