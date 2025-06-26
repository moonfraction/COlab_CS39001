.data
input1: .asciiz "Enter first number: "
input2: .asciiz "Enter second number: "
output: .asciiz "Product of the two numbers is: "
out_of_range_err: .asciiz "Error: Number(s) entered is(are) out of range.\n"

.text
main:
    li $v0, 4
    la $a0, input1
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 4
    la $a0, input2
    syscall

    li $v0, 5
    syscall
    move $s1, $v0

    # Check if the input numbers are in the 16-bit signed integer range
    li $t6, -32768
    li $t7, 32767
    blt $s0, $t6, out_of_range
    bgt $s0, $t7, out_of_range
    blt $s1, $t6, out_of_range
    bgt $s1, $t7, out_of_range

    move $a0, $s0 # n1 = M
    move $a1, $s1 # n2 = Q
    jal multiply_booth

    move $s2, $v0
    
    li $v0, 4
    la $a0, output
    syscall

    move $a0, $s2
    li $v0, 1
    syscall

    li $v0, 10
    syscall

out_of_range:
    li $v0, 4
    la $a0, out_of_range_err
    syscall

    li $v0, 10
    syscall

multiply_booth:
    # initialise Q-1, A and n
    move 	$t0, $zero
    move 	$t1, $zero
    li      $t2, 32


multiply_loop:
    andi    $t3, $a1, 1
    beq	$t3, $t0, right_shift
    beqz   $t0, case_10 #10 :: A<- A - M

    add		$t1, $t1, $a0		# A <- A + M
    b   right_shift


case_10:
    sub		$t1, $t1, $a0		# A <- A - M

right_shift:
    # arithmetic right shift of AQQ-1
    andi    $t3, $a1, 1     # extract Q0 in $t3
    move    $t0, $t3        # set Q-1 to Q0
    srl     $a1, $a1, 1     # logically shift Q right by 1 bit
    andi    $t3, $t1, 1     # extract A0 in $t3
    sll     $t3, $t3, 31    # shift left by 31 bits, this step and the last one together put the LSB of A in MSB of $t3
    or      $a1, $a1, $t3   # this step transfers the MSB of $t3 to Q
    sra     $t1, $t1, 1     # arithmetic shift right A by 1 bit

    # n <- n-1
    addi	$t2, $t2, -1

    # if n > 0 then loop
    bgtz    $t2, multiply_loop

    # if n = 0 then return after storing return value in $v0
    move 	$v0, $a1
    jr		$ra

