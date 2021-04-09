# setup.s
.text
__start:
.globl __start
    li a0, 4
    la a1, msg
    ecall
    li a0, 11                # print new line
    li a1, '\n'
    ecall
    
    call main
finish:
    mv a1, a0      # a1 = a0
    li a0,17       # a0 = 17
    ecall          # выход с кодом завершения
    
.rodata
msg: .string "Call main.... "
