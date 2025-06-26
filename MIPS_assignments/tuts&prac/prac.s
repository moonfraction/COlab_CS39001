.data
input1: .asciiz "Enter first number: "
input2: .asciiz "Enter second number: "
output: .asciiz "Product of the two numbers are: "
out_of_range_err: .asciiz "Error: Number(s) entered is(are) out of range.\n"
spc : .asciiz " "

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

    blt $s0, -32768, out_of_range
    bgt $s0, 32767, out_of_range
    blt $s1, -32768, out_of_range
    bgt $s1, 32767, out_of_range

    move $a0, $s0 #n1 = M
    move $a1, $s1 #n2 = Q
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
    li $t0, 0 #Q-1
    li $t1, 0 #A
    li $t2, 32 #count

loop:
    andi $t3, $a1, 1 #Q0
    beq $t3, $t0, right_shift
    beqz $t0, sub_M #10 :: A<- A - M

    add $t1, $t1, $a0 #10 :: A<- A + M
    b right_shift

sub_M:
    sub $t1, $t1, $a0  #A<- A + M


right_shift:
    andi $t3, $a1, 1 #Q0
    move $t0, $t3 #Q-1 <- Q0
    srl $a1, $a1, 1 #Q <- Q >> 1
    andi $t3, $t1, 1 #A0
    sll $t3, $t3, 31 #A0 << 31
    or $a1, $a1, $t3 # Q <- Q | A0
    sra $t1, $t1, 1 #A <- A >> 1

    addi $t2, $t2, -1
    bgtz $t2, loop

    move $v0, $a1
    jr $ra
