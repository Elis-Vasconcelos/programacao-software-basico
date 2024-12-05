section .data
    msg_input1 db "Primeiro número: ", 0
    msg_input2 db "Segundo número: ", 0
    msg_output db "Resultado: ", 0

section .bss
    num1 resq 1
    num2 resq 1
    result resq 1

section .text
    global _start

_start:
    ; Pergunte pelo primeiro número
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_input1
    mov rdx, 17
    syscall

    ; Leia o primeiro número
    mov rax, 0
    mov rdi, 0
    mov rsi, num1
    mov rdx, 50
    syscall

    ; Pergunte pelo segundo número
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_input2
    mov rdx, 16
    syscall

    ; Leia o segundo número
    mov rax, 0
    mov rdi, 0
    mov rsi, num2
    mov rdx, 50
    syscall

    ; Calcule a soma
    mov rax, [num1]
    add rax, [num2]
    sub rax, 48
  
    ; Imprime o resultado
    mov [result], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 50
    syscall

    ; Encerre o programa
    mov rax, 60
    xor rdi, rdi
    syscall