.text    
main:
    la $a0, input_msg
    li $v0, 4
    syscall

    #input
    li $v0, 5
    syscall

    #store
    move $s0, $v0

    li $s1, 0
    li $s2, 255

    #obtain first 8 bits
    andi $t0, $s0, 255

    srl $s3 , $s0, 8

    add $s0, $t0, $s3

    #repeat for next 8 bits
    andi $t0, $s0, 255

    srl $t1, $s0, 8

    add $s3, $s3, $t1

    add $s0, $t1, $t0

    #repeat for next 8 bits
    andi $t0, $s0, 255

    srl $t1, $s0, 8

    add $s3, $s3, $t1

    add $s0, $t1, $t0

    #repeat for last 8 bits
    andi $t0, $s0, 255

    srl $t1, $s0, 8

    add $s3, $s3, $t1

    add $s0, $t1, $t0

    #check if remainder is 255

    bne $s0, $s2, exit

    addi $s3, $s3, 1

    li $s0, 0

exit:
    li $v0, 4
    la $a0, q_msg
    syscall
    li $v0, 1
    move $a0, $s3
    syscall
    li $v0, 4
    la $a0, r_msg
    syscall
    li $v0, 1
    move $a0, $s0
    syscall
    li $v0, 10
    syscall
    
.data
    input_msg : .asciiz "Enter a number: "
    q_msg: .asciiz "Quotient: "
    r_msg: .asciiz "     Remainder: "