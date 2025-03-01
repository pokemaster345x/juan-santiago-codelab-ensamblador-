.section .data
mensaje: .string "hola mundo\n"  # Define el mensaje

.section .text
.globl _start                    # Hacemos _start visible para el enlazador

_start:
    # Configuración para la llamada al sistema "write"
    mov $1, %rax                # rax = 1 (syscall para escribir)
    mov $1, %rdi                # rdi = 1 (descriptor de archivo: stdout)
    mov $mensaje, %rsi          # rsi = dirección del mensaje
    mov $11, %rdx               # rdx = longitud del mensaje (11 bytes)
    syscall                     # Llamada al sistema

    # Configuración para la llamada al sistema "exit"
    mov $60, %rax               # rax = 60 (syscall para exit)
    xor %rdi, %rdi              # rdi = 0 (código de salida: 0)
    syscall                     # Llamada al sistema
