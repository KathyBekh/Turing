# main.s
.text
main:
.globl main
    li a0, 4                # print to console "Array: "
    la a1, msg3
    ecall
    li a0, 11               # print new line
    li a1, '\n'
    ecall
    li a0, 4                # print to console "Array: "
    la a1, msg4
    ecall
    li a0, 11               # print new line
    li a1, '\n'
    ecall
                           
    lw a3, shift            # a2 = 2 number of shift
    la a4, array            # a4 = adress 0 element of array
    la a7, array            # a4 = adress 0 element o
    lw a5, array_length     # a5 = 8
    addi t3, a5, -1            
    slli t3, t3, 2
    add s1, a7, t3            #s1 = address of the last array element
    
    addi sp, sp, -16        # выделение памяти в стеке
    sw ra, 12(sp)           # save adras for return
    call shift_sub    
    lw ra, 12(sp)
    addi sp, sp, 16
    ret                     # jalr zero, ra, 0
.rodata
array_length:
     .word 6
msg3: .string "Array: 123456 "
msg4: .string "Call shift_sub.... "
shift:
     .word 5
.data
array:
     .word 1, 2, 3, 4, 5, 6