%include "io.inc"

;int fact(int)
; fact:
;     ...

; int c(int n, int k)

; C:
;     push ebp
;     mov ebp, esp
    
;     mov eax, dword [ebp + 8] ; n
;     mov ecx, dword [ebp + 12] ; k

;     cmp eax, ecx
;     jl ans_zero

;     test eax, eax
;     je ans_1

;     xor edx, edx
;     dec eax
;     push ecx
;     push eax
;     call C

;     add edx, eax
;     pop eax
;     pop ecx

;     dec ecx
;     push ecx
;     push eax



; ans_zero:
;     mov eax, dword 0
;     jmp end

; ans_1:
;     mov eax, dword 1

; end:
;     mov esp, ebp
;     pop ebp
;     ret



; make_point:
;     push ebp
;     mov ebp, esp

;     push ebx
;     mov eax, dword [ebp + 8] ; hiden pointer
;     mov ebx, dword [ebp + 12] ;a
;     mov ecx, dword [ebp + 16] ;b
;     mov edx, dword [ebp + 20] ;c

;     mov dword[eax], ebx
;     mov dword[eax + 4], ecx
;     mov dword[eax + 8], ecx

;     pop ebx
;     mov esp, ebp
;     pop ebp

; Complex C_mult(Complex* a, Complex* b)
; C_mult:
;     push ebp
;     mov ebp, esp

;     push esi
;     push edi
;     push ebx

;     mov esi, dword [ebp + 12]
;     mov edi, dword [ebp + 16]

;     mov eax, dword [esi] ; a->x
;     mov ebx, dword [esi + 4]; a -> y
;     mov ecx, dword [edi]; b->x
;     mov edx, dword [edi + 4]; b->y

;     mov esi, eax
;     imul esi, ecx
;     mov edi, ebx
;     imul esi, edx
;     sub esi, edi

;     lea edi, [ebp + 8]
;     mov dword [edi], esi

;     mov esi, eax
;     imul esi, edx

;     mov edi, ebx
;     imul edi, ecx

;     add esi, edi

;     lea edi, [ebp + 8]
;     mov dword [edi + 4], esi

;     pop ebx
;     pop edi
;     pop esi

;     mov esp, ebp
;     pop ebp
;     ret



section .text
global main
main:
    push ebp
    mov ebp, esp
    sub esp, 12

    lea eax, [esp]


    push dword [c]
    push dword [b]
    push dword [a]
    push eax
    call make_point
    
    add esp, dword 16
    xor eax, eax
    ret