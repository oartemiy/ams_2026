%include "io.inc"

section .text
global main
main:
    ; if, cycles and so on
    ; if (a>b) x = 1
    ; 1
;     mov eax, [a]
;     mov ebx, [b]
;     cmp eax, ebx
;     jng end_if ; not grater, we made otricanie

;     mov [x], 1
; end_if:
    

    ; 2
;     mov eax, [a]
;     mov ebx, [b]
;     cmp eax, ebx
;     jnl else
;     mov [x], 1
;     jmp end_if
; else:
;     mov[x], 2

; end_if:

;     ; while (ecx > 0) --ecx
; while_begin:
;     cmp ecx, 0
;     jng while_end
;     dec ecx
;     jmp while_begin

; while_end:

    ; for statement
;     mov ecx, 0
; for_begin:
;     cmp ecx, 10
;     jnl for_end

;     inc ecx
;     jmp for_begin

; for_end:


    ; loop
;     mov ecx, 10
; label:
;     loop label ; ecx--, if not ecx == 0 then jmp label

    ; two fors

    ;     mov ecx, 0
; outher_for_begin:
;     cmp ecx, 10
;     jnl outher_for_end
;     push ecx
;         inter_for_begin:
;             cmp ecx, 10
;             jnl inter_for_end

;             inc ecx
;             jmp inter_for_begin

;         inter_for_end:
;         pop ecx

;             inc ecx
;             jmp outher_for_begin

; outher_for_end:

;     mov eax, [x]
;     mov ebx, [y]
;     mov ecx, [z]
;     cmp eax, ebx
;     jg true_part
;     cmp ecx, 0
;     jnz end_if
; true_part:
;     add eax, ebx
;     mov [x], ebx

; end_if:

    ; mov eax, [x]
    ; mov ebx, [y]
    ; mov ecx, [z]
    ; cmp eax, ebx
    ; cmp eax, ebx
    ; jnle else_part
    ; inc ecx
    ; jz else_part

    ; ; true_part:
    ; mul ecx
    ; mov [b], eax
    ; jmp end_if
    ; else_part:
    ; mov [c], 0

    ; switch
    mov eax, [x]

    cmp eax, 2
    jg default_case
    jmp [jump_table + eax * 4]
    
; before runtime
jump_table:
    dd case0
    dd case1
    dd case2

    case0:
        call func0
        jmp end_switch

    case1:
        call func1
        jmp end_switch


    case2:
        call func2
        jmp end_switch

    default_case:
        call func_default
    
    end_switch:

    xor eax, eax
    ret