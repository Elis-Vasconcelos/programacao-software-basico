section .data
    saida_msg db 10, "Input dado: ", 10, 0
    entrada1_msg db "Digite o N1 inteiro: ", 0
    entrada2_msg db "Digite o N2 inteiro: ", 0
    entrada3_msg db "Digite o N3 inteiro: ", 0
    saida2_msg db 10, "Output total: ", 10, 0
    numero1_msg db "N1: %d", 10, 0
    numero3_msg db "N3: %d", 10, 0
    numero2_msg db "N2: %d", 10, 0
    fmt db "%.2f", 10, 0
    scan_fmt db "%d", 0

section .bss
    a resd 1
    b resd 1
    c resd 1

section .text
    global main
    extern scanf, printf, calc_media_aritmetica, calc_media_geometrica, calc_media_harmonica

main:
    ; Salvando ponteiro de base e configura stack frame
    push rbp
    mov rbp, rsp

    ; Input N1
    mov rdi, entrada1_msg
    call printf
    mov rdi, scan_fmt
    lea rsi, [a]
    call scanf

    ; Input N2
    mov rdi, entrada2_msg
    call printf
    mov rdi, scan_fmt
    lea rsi, [b]
    call scanf

    ; Input N3
    mov rdi, entrada3_msg
    call printf
    mov rdi, scan_fmt
    lea rsi, [c]
    call scanf

    ; Printa os numeros colocados
    mov rdi, saida_msg
    call printf
    mov rdi, numero1_msg
    mov rsi, [a]
    call printf
    mov rdi, numero2_msg
    mov rsi, [b]
    call printf
    mov rdi, numero3_msg
    mov rsi, [c]
    call printf
    mov rdi, saida2_msg
    call printf

    ; Calculatar e printar a media aritmetica
    mov rdi, [a]
    mov rsi, [b]
    mov rdx, [c]
    call calc_media_aritmetica
    mov rdi, fmt
    movsd xmm0, xmm0
    call printf

    ; Calcular e printar a media geometrica
    mov rdi, [a]
    mov rsi, [b]
    mov rdx, [c]
    call calc_media_geometrica
    mov rdi, fmt
    movsd xmm0, xmm0
    call printf

    ; Calcular e printar a media harmonica
    mov rdi, [a]
    mov rsi, [b]
    mov rdx, [c]
    call calc_media_harmonica
    mov rdi, fmt
    movsd xmm0, xmm0
    call printf

    ; Restorar a pilha e sair
    leave
    mov rax, 0
    ret
