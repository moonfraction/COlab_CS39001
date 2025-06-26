.text

main:
    li      $v0,    4
    la      $a0,    input_base
    syscall 
    li     $v0,    5
    syscall
    move    $s1,    $v0

    li      $v0,    4
    la      $a0,    input_exp
    syscall
    li     $v0,    5
    syscall
    move    $s2,    $v0

    li      $v0,    4
    la      $a0,    input_mod
    syscall
    li     $v0,    5
    syscall
    move    $s3,    $v0
    li      $v0,    4
    
    #if exp is zero jump to exception handling
    beq $s2, $zero, exception1
    li $s0, 0 #itrator for bin rep
    jal DecimalToBinary

    jal print_binary

    li $s4, 1 # stores the answer
    move $a1, $s0 #iterator
    addi $a1, $a1, -4
    jal mod_exp

    j exit 

DecimalToBinary:
    andi    $t0,    $s2,    1
    sw      $t0,    binary($s0)
    addi    $s0,    $s0,    4
    srl     $s2,    $s2,    1
    bne     $s2,    $zero,  DecimalToBinary
    j $ra


print_binary:
    li $v0, 4
    la $a0, output_bin
    syscall

    move $s4, $s0

print_binrep:
    sub $s4, $s4, 4
    lw $t0, binary($s4)
    li $v0, 1
    move $a0, $t0
    syscall
    bne $s4, $zero, print_binrep
    j $ra

mod_mul:
    mul $t0, $a0, $a1
    div $t0, $a2
    mfhi $v0
    j $ra

mod_sqr:
    mul $t0, $a0, $a0
    div $t0, $a2
    mfhi $v0
    j $ra

mod_exp:
    blt $a1, $zero, print_ans

    move $a0, $s4
    move $a2, $s3
    jal mod_sqr

    move $s4, $v0
    lw $t0, binary($a1)
    addi $a1, $a1, -4
    beq $t0, $zero, mod_exp
    move $a0, $s4
    move $t1, $a1 #itr
    move $a1, $s1
    move $a2, $s3
    jal mod_mul

    move $s4, $v0
    move $a1, $t1
    j mod_exp

print_ans:
    li $v0, 4
    la $a0, output_msg
    syscall

    move $a0, $s4
    li $v0, 1
    syscall

    j exit
    
exception1:
    li $v0, 4
    la $a0, output_bin
    syscall
    li $v0, 1
    li $a0, 0
    syscall
    li $v0, 4
    la $a0, output_msg
    syscall
    li $v0, 1
    beq $s3, 1, exception2
    li $a0, 1
    syscall
    j exit
    
exception2:
    li $a0, 0
    syscall
    j exit
    
exit: 
    li $v0, 10
    syscall


.data
    input_base : .asciiz "Enter base(M) number: "
    input_exp : .asciiz "Enter exponent(d) number: "
    input_mod : .asciiz "Enter mod(N) number: "
    output_bin: .asciiz "\nBinary representation of exponent(d): "
    output_msg : .asciiz "\nResult [(M^d)%N]: "
    space : .asciiz " "
    binary: .word 32