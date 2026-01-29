%include "io.inc"

extern io_get_dec, io_print_dec, io_print_udec

section .bss
a resq 1
b resq 1

section .text
global main
main:

    ; mov ax, 0x11E4
    ; cbw ; ox11E4 -> oxFFE4

    ; mov al, 0xFF ; (-1 signed, 255 unsigned)
    ; mov bl, 0x01 ; (1 signed, 1 unsigned)
    ; add al, bl ; al = 0x00
    ; ; signed - good, unsdigned - bad
    ; ; OF = 0, CF = 1, ZF = 1

    ; adc al, bl ; al = al + bl + CF
    ; sbb al, bl ; al = al - bl - CF


    ; sub al, bl

    ; Long arithmetics
    ; long a, long b, a + b on asm

    ; call io_get_dec
    ; mov dword [a], eax
    ; call io_get_dec
    ; mov dword [a + 4], eax

    ; call io_get_dec
    ; mov dword [b], eax
    ; call io_get_dec
    ; mov dword [b + 4], eax

 
    ; add eax, dword [a + 4]

    ; mov ebx, dword [a]
    ; adc ebx, dword [b]

    ; mov dword [a], ebx
    ; mov dword [a + 4], eax

    ; mov eax, dword [a]
    ; call io_print_udec


    ; mov eax, dword [a + 4]
    ; call io_print_udec

    
    

    xor eax, eax
    ret