.text

main:
    li $v0, 4
    la $a0, input_msg
    syscall
    li $s0, 0

ip:
    beq $s0, 40, sort_array
    li $v0, 5
    syscall
    sw $v0, array($s0)
    addi $s0, $s0, 4
    j ip


sort_array:
    li $s1, -4

outer_loop:
    addi $s1, $s1, 4
    beq $s1, 40, print_array
    li $s2, 0

inner_loop:
    beq $s1, $s2, outer_loop
    lw $t1, array($s2)
    lw $t2, array($s1)
    ble $t1, $t2, next
    sw $t1, array($s1)
    sw $t2, array($s2)

next:
    addi $s2, $s2, 4
    j inner_loop

print_array:
    li $s0, 0
    la $a0, output_msg
    li $v0, 4
    syscall

print:
    beq $s0, 40, exit
    lw $a0, array($s0)
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, spc
    syscall
    addi $s0, $s0, 4
    j print


exit:
    li $v0, 10
    syscall


.data
    input_msg: .asciiz "Enter 10 distinct numbers:\n"
    array: .space 40
    input_array: .asciiz "input array:"
    output_msg: .asciiz "Sorted array: "
    spc: .asciiz " "