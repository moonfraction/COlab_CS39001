.text

main:
    li $v0, 4
    la $a0, input_msg
    syscall
    j fun
    li $s2, 0
    li $s5, 0
    li $s0, 0

fun: 
    beq $t0, 40, get_dp
    li $v0, 5
    syscall
    sw $v0, array($t0)
    addi $t0, $t0, 4
    j fun

get_dp:
    beq $s0, 40, find_maxLIS
    li $s1, 0
    addi $s0, $s0, 4
    j calc_dp

calc_dp:
    beq $s1, $s0, get_dp
    lw $t1, array($s0)
    lw $t2, array($s1)
    bgt $t1, $t2, update_dp
    addi $s1, $s1, 4
    j calc_dp


update_dp:
    lw $t1, dp($s1)
    addi $t1, $t1, 1
    addi $s1, $s1, 4
    lw $t3, dp($s0)
    blt $t1, $t3, calc_dp
    sw $t1, dp($s0)
    subu $s1, $s1, 4
    sw $s1, parent($s0)
    addi $s1,$s1,4
    j calc_dp


find_maxLIS:
    li $s1, 0

iterator:
    beq $s1, 40, store_maxLIS
    lw $t1, dp($s1)
    
    lw $t2, dp($s5)
    bgt $t1, $t2, update_max
    addi $s1, $s1, 4
    j iterator

update_max:
    move $s5, $s1
    addi $s1, $s1, 4
    j iterator

store_maxLIS:
    lw $t4, array($s5)
    sw $t4, lis($s2)
    addi $s2, $s2, 4
    lw $t1, dp($s5)
    beqz $t1, print_ans
    lw $t0, parent($s5)
    move $s5, $t0
    j store_maxLIS


print_ans:
    li $v0, 4
    la $a0, ans
    syscall

print_LIS:
    subu $s2, $s2, 4
    lw $t1, lis($s2)
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, spc
    syscall

    beqz $s2, exit
    j print_LIS

exit:
    li $v0, 10
    syscall


.data
    array: .space 40
    dp : .space 40
    parent: .space 40
    lis: .space 40
    spc : .asciiz " "
    ans: .asciiz "\nLongest Increasing Subsequence: "
    input_msg: .asciiz "Enter 10 numbers:\n"