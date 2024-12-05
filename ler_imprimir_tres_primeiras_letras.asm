section .data
    letra db 'a', 0  ;

section .text
    global _start

_start:
    ; Lê letra
    mov rax, 0
    mov rdi, 0
    mov rsi, letra
    mov rdx, 1
    syscall

    ; Converte em maiúscula
    sub byte [letra], 32

    ; Imprime a letra
    mov rax, 1
    mov rdi, 1
    mov rsi, letra
    mov rdx, 1
    syscall

    ; Encerre o programa
    mov rax, 60
    xor rdi, rdi
    syscall
