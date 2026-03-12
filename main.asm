%include "io.inc"

; int max_f(int* a, int n)
max_f:
    push ebp ; start
    mov ebp, esp
    
    mov ecx, dword[ebp + 12] ; n
    push esi
    mov esi, dword[ebp + 8] ; a

    mov eax, dword[esi + ecx * 4 - 4] ; a[n - 1]
    looplabel:
        cmp eax, dword[esi + ecx * 4 - 4]
        jng skip
        mov eax, dword[esi + ecx * 4 - 4]
        skip:
    loop looplabel


    pop esi
    mov esp, ebp ; free
    pop ebp ; end
    ret


; int average(int a, int b, int c)
average:
    ...


;void p_swap(int* a, int* b)
p_swap:
    push ebp
    mov ebp, esp

    mov eax, dword[ebp + 8]
    mov ecx, dword[ebp + 12]

    mov esi, dword [eax]
    mov edi, dword [ecx]

    mov dword[eax], edi
    mov dword[ecx], esi

    mov esp, ebp
    pop ebp
    ret


; a[n], b[n], n, int(f*)(int)
; f(x) -> eax
func_calc:
    push ebp
    mov ebp, esp

    push esi
    push edi

    mov ecx, dword [ebp + 16] ; n
    mov esi, dword [ebp + 8] ; a
    mov edi, dword [ebp + 12] ; b
    mov edx, dword [ebp + 20] ; f

    loop_label:
        push dword [esi + 4 * ecx - 4]

        ;saving registers
        push eax
        push ecx
        push edx

        call edx
        ; getting back registers
        pop edx
        pop ecx
        pop eax

        pop dword [esi + 4 * ecx - 4]
        mov dword [edi + 4 * ecx - 4], eax
        
    loop loop_label

    pop edi
    pop esi

    mov esp, ebp
    pop ebp
    ret


section .text
global main
main:
    push n
    push a
    call max_f
    add esp, 8

    xor eax, eax
    ret