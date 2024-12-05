section .data
    msg_input db "Digite seu nome:", 0
    msg_welcome db "é bem-vindo(a) ao semestre da disciplina de PSB", 0

section .bss
    name resb 50

section .text
    global _start

_start:
    ; Pergunte pelo nome do aluno
    mov rax, 1           ; número da syscall para sys_write
    mov rdi, 1           ; descritor de arquivo 1 (stdout)
    mov rsi, msg_input   ; endereço da mensagem de entrada
    mov rdx, 17          ; comprimento da mensagem de entrada
    syscall

    ; Leia o nome do aluno
    mov rax, 0           ; número da syscall para sys_read
    mov rdi, 0           ; descritor de arquivo 0 (stdin)
    mov rsi, name        ; endereço para armazenar a entrada
    mov rdx, 50          ; número máximo de bytes a serem lidos
    syscall

    ; Imprima o nome
    mov rax, 1           ; número da syscall para sys_write
    mov rdi, 1           ; descritor de arquivo 1 (stdout)
    mov rsi, name        ; endereço do nome do aluno
    mov rdx, 50          ; comprimento do nome (máximo)
    syscall

    ; Imprima a mensagem de boas-vindas
    mov rax, 1           ; número da syscall para sys_write
    mov rdi, 1           ; descritor de arquivo 1 (stdout)
    mov rsi, msg_welcome ; endereço da mensagem de boas-vindas
    mov rdx, 50          ; comprimento da mensagem de boas-vindas
    syscall

    ; Encerre o programa
    mov rax, 60          ; número da syscall para sys_exit
    xor rdi, rdi         ; código de saída 0
    syscall
