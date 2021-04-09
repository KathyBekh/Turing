#shuft_sub.s
.text
shift_sub:
.globl shift_sub
    li a2, 0                # current shift
    li a6, 1                # текущее сдвинутое кол-во элементов
    beq a2, a3, loop_exit   # 
    lw t2, 0(a7)            # t1 = array[0]
    
    li a0, 4                # print to console "shift "
    la a1, msg1
    ecall
    li a0, 1                 # print to console shift (a2)
    mv a1, a2
    ecall
    li a0, 4
    la a1, msg2              #print to console " : "
    ecall
    
sub_loop:
    lw t0, 4(a4)             # t0 = array[i+1]
    sw t0, 0(a4)             # array[i] = array[i+1]
    
    li a0, 1                 # print to console shifting number
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
    ret
    
.rodata
    msg1: .string "Shift "
    msg2: .string ": "
