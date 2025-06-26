.text 


main:
    li $v0, 4
    la $a0, input_msg
    syscall
    j fun
    li $s4, 10
    li $s5, 1
    li $s6, 0

fun: 
    beq $t0, 40, input_k
    li $v0, 5
    syscall
    sw $v0, array($t0)
    addi $t0, $t0, 4
    j fun

input_k:
    li $v0, 4
    la $a0, input_msg2
    syscall
    li $v0, 5
    syscall
    move $s0, $v0

find_k_min:
    beq $s1, $s0, printo
    li $s2, 1000000
    li $t2, 0
    j find_min

find_min:
    bgt $t2, 39, found_min
    lw $t1, array($t2)
    blt $t1, $s2, update_min
    addi $t2, $t2, 4
    j find_min

found_min:
    addi $s1, $s1, 1
    move $s3, $s2
    addi $s3, $s3, 1
    j find_k_min
update_min:
    addi $t2, $t2, 4
    blt $t1, $s3, find_min
    move $s2, $t1
    j find_min

printo:
    beqz $s6, print_min
    j print_max
 
print_min:
    li $v0, 4
    la $a0, output_msg
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    li $s4, 11
    sub $s0, $s4, $s0
    li $s1, 0
    li $s6, 1
    li $t2, 0
    li $s2, 1000000
    li $s3, 0
    j find_k_min

    
print_max:
    li $v0, 4
    la $a0, output_msg2
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    
exit:
    li $v0, 10
    syscall
.data
    array: .space 40
    input_msg: .asciiz "Enter 10 distinct numbers:\n"
    input_msg2: .asciiz "Enter k: "
    output_msg: .asciiz "\nThe kth smallest number is: "
    output_msg2: .asciiz "\nThe kth largest number is: "
