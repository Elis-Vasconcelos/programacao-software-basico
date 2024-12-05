section .bss
    input resb 100

section .text
    global _start

_start:
    ; Leia a string
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 100
    syscall

    ; Imprima as 3 primeiras letras
    mov rax, 1
    mov rdi, 1
    mov rsi, input
    mov rdx, 3
    syscall

    ; Encerre o programa
    mov rax, 60
    xor rdi, rdi
    syscall