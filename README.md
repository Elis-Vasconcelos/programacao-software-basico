# Repositório de Exemplos em Assembly para Intel x86-64

Este repositório contém diversos programas em Assembly (NASM) para a arquitetura Intel x86-64, abordando desde operações simples até o cálculo de médias matemáticas e manipulação de strings. Todos os exemplos foram criados para ajudar no aprendizado e prática da linguagem Assembly, especialmente em tarefas comuns de computação.

## Como Compilar e Executar

Para compilar e executar qualquer um dos programas, siga os seguintes passos:

### 1. Instalar o NASM

Certifique-se de que o NASM (Netwide Assembler) está instalado no seu sistema. Você pode baixá-lo [aqui](https://www.nasm.us/).

### 2. Compilar o código

Abra o terminal e navegue até o diretório onde o arquivo `.asm` está localizado. Compile o arquivo com o comando:

```bash
nasm -f elf64 -o nome_do_arquivo.o nome_do_arquivo.asm
```

### 3. Linkar o arquivo objeto

Depois de compilar, você precisa linkar o arquivo objeto para gerar o executável:

```bash
ld -o nome_do_programa nome_do_arquivo.o
```

### 4. Executar o programa

Finalmente, execute o programa gerado:

```bash
./nome_do_programa
```
