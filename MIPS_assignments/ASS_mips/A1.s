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
    li $s3, 1
    li $s1, 2
    
    la $a0, prime_msg
    li $v0, 4
    syscall

main_loop:
    #exit if factorization complete
    beq $s3, $s0, exit
    j check_divisible

check_divisible:
    div $s0, $s1
    mfhi $s2
    #if divisble go to print_function
    beq $s2, $zero, print_function
    #else increment factor
    addi $s1, $s1, 1
    #go back to main loop to check exit status
    j main_loop


print_function:
    li $v0, 1
    move $a0, $s1
    syscall
    li $v0, 11
    li $a0, ' '
    syscall
    div $s0, $s1
    mflo $s0
    #check divisibility again
    div $s0 $s1
    mfhi $s2
    #if divisible print again
    beq $s2, $zero, print_function
    #otherwise go back to check divisble
    j check_divisible
exit:
    li $v0, 10
    syscall

.data
    input_msg : .asciiz "Enter a number: "
    prime_msg: .asciiz "Prime Factorization: "