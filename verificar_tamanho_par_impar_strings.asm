section .data
  msg_par db "tamanho par", 10, 0
  msg_impar db "tamanho impar", 10, 0

section .text
  global _start

_start:
  %defstr str1 hi          ; Deve imprimir que "hi" tem tamanho par
  %strlen charcnt1 str1
  
  %defstr str2 bye          ; Deve imprimir que "bye" tem tamanho impar
  %strlen charcnt2 str2

  mov rax, charcnt1
  mov rbx, charcnt2

  ; Verifica se o comprimento de str1 é par ou ímpar
  test rax, 1
  jz str1_par

str1_impar:
  ; Imprime a mensagem de quantidade ímpar para str1
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_impar
  mov rdx, 14
  syscall
  jmp check_str2

str1_par:
  ; Imprime a mensagem de quantidade par para str1
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_par
  mov rdx, 12
  syscall

check_str2:
  ; Verifica se o comprimento de str2 é par ou ímpar
  test rbx, 1
  jz str2_par

str2_impar:
  ; Imprime a mensagem de quantidade ímpar para str2
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_impar
  mov rdx, 14
  syscall
  jmp exit

str2_par:
  ; Imprime a mensagem de quantidade par para str2
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_par
  mov rdx, 11
  syscall

exit:
  ; Saída do programa
  mov rax, 60
  xor rdi, rdi
  syscall