.text
__start:
.globl __start                #start programm
    li a2, 0                  #current shift
    lw a3, shift              #a3 = 3 number of shifts required
    la a4, array              #a4 = address 0 element of array
    la a7, array              #a7 = address 0 element of array
    lw a5, length             #a5 = 11 length of array
    addi t3, a5, -1            
    slli t3, t3, 2
    add s1, a7, t3            #s1 = address of the last array element
    
    li a6, 1                  #current shift count
    beq x0, a3, loop_exit     #if shift == 0 go to loop_exit
    lw t2, 0(a7)              #t2 = array[0]
    
    li a0, 4
    la a1, msg3
    ecall
    li a0, 11                # print new line
    li a1, '\n'
    ecall
    li a0, 4
    la a1, msg1
    ecall
    li a0, 1                 # print to console
    mv a1, a2
    ecall
    li a0, 4
    la a1, msg2
    ecall
    
sub_loop:                    # shifting the array
    lw t0, 4(a4)             # t0 = array[i+1]
    sw t0, 0(a4)             # array[i] = array[i+1]
    
    li a0, 1                 # print to console
    mv a1, t0
    ecall
    
    addi a4, a4, 4           # change address of the next element in the array
    addi a6, a6, 1           # increment current loop iteration number
    
    bltu a6, a5, sub_loop    # loop if current iteration < number of iterations
    
main_loop:
    li a0, 1                  #print to console
    mv a1, t2
    ecall
    
    sw t2, 0(s1)             # array[n-1] = array[0]

    addi a2, a2, 1           # a2 += 1
    beq a2, a3, loop_exit    # a2 == a3 go to loop_exit
    mv a4, a7                # a4 = a7
    lw t2, 0(a4)             # t1 = array[0]
    li a6, 1                 # a6 = 1
    
    li a0, 11                # print new line
    li a1, '\n'
    ecall
    li a0, 4
    la a1, msg1
    ecall
    li a0, 1                 # print to console
    mv a1, a2
    ecall
    li a0, 4
    la a1, msg2
    ecall
    
    jal zero, sub_loop       # jump to sub_loop

loop_exit:
    li a0, 10
    ecall

.rodata                      # directive read only memory
length:
    .word 6
shift:
    .word 4
msg1: .string "Shift "
msg2: .string ": "
msg3: .string "Array: 123456 "

.data
array:
    .word 1, 2, 3, 4, 5, 6