%include "io.inc"


    ; C: 
    ; int a[4], short b[4]
    ; uint c[4], ushort d[4]
    ; char p[4], uchar q[4]
    ; long l;

section .bss
a resd 4
b resw 4
c resd 4
d resw 4
p resb 5
q resb 4
l resq 1

section .text
global main
main:
    ; a[0] = b[0] + b[1] - b[2]
    mov ax, word[b]
    add ax, word[b + 2]
    sub ax, word[b + 4]
    movsx dword[a], ax

    ; p[0] = a[0] + d[3]
    movzx eax, word[d + 6]
    add eax, dword[a]
    mov byte[p], al

    ; a[0] /= a[1]
    mov eax, dword[a]
    cdq
    idiv dword[a + 4]
    mov dword[a], eax

    ; eax = q[0] | (q[1] << 8) | (q[2] << 16)

    mov al, byte[q + 2]
    mov eax, 16
    mov al, byte[q]
    mov ah, byte[q + 1]


    ; a[1] = c[0] * d[3]
    movzx eax, word[d + 6]
    mul dword[c]
    mov dword[a + 4], eax

    ; l = c[0] * d[3]
    movzx eax, word[d + 6]
    mul dword[c]
    mov dword[l], edx
    mov dword[l + 4], eax

    ; a[0] = a[0] << a[1]
    shl dword[a], byte[a + 7]

    ;b[2] = l / p[2]

    movsx ebx, byte[p + 2] ; signed mov
    mov edx, dword[l]
    mov eax dword[l + 4]
    idiv edx

    mov word[b + 4], ax


    ; word[eax] == переменная который лежит в eax

    ; div – unsigned, idiv – signed
    ; GET_DEC 4, eax
    ; GET_DEC 4, ebx
    ; cdq
    ; idiv ebx

    ; PRINT_DEC 4, eax
    ; NEWLINE
    ; PRINT_DEC 4, edx
    ; NEWLINE

    ; shifts

    ; shl, shr – logic shifts
    ; sar sal – arithmetic shifts

   
    xor eax, eax
    ret