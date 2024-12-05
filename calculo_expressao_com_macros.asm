section .data
    novalinha db 10                  ; Caractere de nova linha

section .bss
    buffer resb 20                 ; Buffer para armazenar o resultado inteiro convertido

section .text
global _start

%define quadrado(x) x*x
%define cubo(x) x*x*x
%define dois_x_mais_y(x, y) (2*x)+y
%define expressao(x, y, z) ((4+x)*y)/z

_start:
    ; Calcular x^2 e imprimir
    mov rax, quadrado(5)           ; Exemplo com x = 5
    call print_result              ; Resultado esperado = 25

    ; Calcular x^3 e imprimir
    mov rax, cubo(5)               ; Exemplo com x = 5
    call print_result              ; Resultado esperado = 125

    ; Calcular (2*x) + y e imprimir
    mov rax, dois_x_mais_y(6, 3)   ; Exemplo com x = 5, y = 3
    call print_result              ; Resultado esperado = 15

    ; Calcular ((4 + x) * y) / z e imprimir
    mov rax, expressao(5, 3, 2)    ; Exemplo com x = 5, y = 3, z = 2
    call print_result              ; Resultado esperado = 13

    ; Encerrar o programa
    mov rax, 60                    ; Número da syscall sys_exit
    xor rdi, rdi                   ; Código de saída 0
    syscall

print_result:
    ; Converter o resultado em RAX para uma string e armazenar no buffer
    mov rsi, buffer
    call int_to_string

    ; Imprimir o número convertido
    mov rax, 1                     ; Número da syscall sys_write
    mov rdi, 1                     ; Descritor de arquivo 1 = stdout
    mov rdx, rsi                   ; Endereço da string convertida
    call print_string

    ; Imprimir nova linha
    mov rax, 1                     ; Número da syscall sys_write
    mov rdi, 1                     ; Descritor de arquivo 1 = stdout
    mov rsi, novalinha               ; Endereço do caractere de nova linha
    mov rdx, 1                     ; Comprimento do caractere de nova linha
    syscall

    ret

int_to_string:
    ; Função para converter o inteiro em RAX para uma string em RSI (buffer)
    mov rcx, 10                    ; Base 10
    xor rbx, rbx                   ; Limpar RBX
    lea rdi, [rsi+19]              ; Apontar RDI para o final do buffer
    mov byte [rdi], 0              ; Terminar a string com nulo

.convert_loop:
    xor rdx, rdx
    div rcx                        ; Dividir RAX por 10
    add dl, '0'                    ; Converter o resto para ASCII
    dec rdi                        ; Mover para a posição anterior
    mov [rdi], dl                  ; Armazenar o caractere no buffer
    test rax, rax
    jnz .convert_loop              ; Repetir até que RAX seja 0

    ; Ajustar a posição dos dígitos no buffer
    mov rsi, rdi                   ; Apontar RSI para o primeiro dígito
    mov rdi, buffer                ; Restaurar RDI para o início do buffer

    ret

print_string:
    ; Função para imprimir uma string terminada em nulo
    mov rax, 1                     ; Número da syscall sys_write
    syscall
    ret
