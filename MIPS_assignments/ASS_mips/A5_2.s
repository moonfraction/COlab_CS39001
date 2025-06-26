.text

main:

    li      $v0,            4
    la      $a0,            input_n
    syscall

    # Read n
    li      $v0,            5
    syscall
    move    $t0,            $v0

    li      $v0,            4
    la      $a0,            input_m
    syscall

    # Read m
    li      $v0,            5
    syscall
    move    $t1,            $v0

    li      $v0,            4
    la      $a0,            input_a
    syscall

    # Read a
    li      $v0,            5
    syscall
    move    $t2,            $v0

    li      $v0,            4
    la      $a0,            input_b
    syscall

    # Read b
    li      $v0,            5
    syscall
    move    $t3,            $v0

    li      $s0,            0                                                   #row_itr
    li      $s1,            -1                                                  #col_itr

    move    $s3,            $sp                                                 #store stack pointer
    addi    $s3,            $s3,                        -4


update_col:
    addi    $s1,            $s1,                        1
    bge     $s1,            $t1,                        update_row
    j       compute_value

update_row:
    addi    $s0,            $s0,                        1
    li      $s1,            0
    bge     $s0,            $t0,                        print_matrix

compute_value:
    li      $a1,            0
    li      $v0,            1
    jal     expo1
    move    $t4,            $v0
    div     $t4,            $t2
    mflo    $t4

    li      $a1,            0
    li      $v0,            1
    jal     expo2
    move    $t5,            $v0
    div     $t5,            $t3
    mflo    $t5

    mul     $t4,            $t4,                        $t5

    add     $t5,            $s0,                        $s1
    andi    $t5,            $t5,                        1
    bne     $t5,            0,                          odd
    addi    $sp,            $sp,                        -4
    sw      $t4,            0($sp)
    j       update_col

odd:
    mul     $t4,            $t4,                        -1
    addi    $sp,            $sp,                        -4
    sw      $t4,            0($sp)
    j       update_col

expo1:
    mul     $v0,            $v0,                        $t2
    addi    $a1,            $a1,                        1
    ble     $a1,            $s0,                        expo1
    jr      $ra

expo2:
    mul     $v0,            $v0,                        $t3
    addi    $a1,            $a1,                        1
    ble     $a1,            $s1,                        expo2
    jr      $ra

print_matrix:
    li      $s0,            0
    li      $s1,            0
    li      $v0,            4
    la      $a0,            output_matrix
    syscall
    move    $sp,            $s3

print_row:
    bge     $s0,            $t0,                        print_transpose

print_col:
    bge     $s1,            $t1,                        next_row
    lw      $a0,            0($sp)
    addi    $sp,            $sp,                        -4
    li      $v0,            1
    syscall
    la      $a0,            space
    li      $v0,            4
    syscall
    addi    $s1,            $s1,                        1
    j       print_col

next_row:
    li      $v0,            4
    la      $a0,            nl
    syscall
    addi    $s0,            $s0,                        1
    li      $s1,            0
    j       print_row

print_transpose:
    li      $v0,            4
    la      $a0,            output_matrix_transpose
    syscall
    li      $s0,            0
    li      $s1,            0
    move    $sp,            $s3

    j       print_row2

print_row2:
    bge     $s0,            $t1,                        exit

print_col2:
    bge     $s1,            $t0,                        next_row2
    lw      $a0,            0($sp)
    li      $t6,            -4
    mul     $t6,            $t6,                        $t1
    add     $sp,            $sp,                        $t6
    li      $v0,            1
    syscall
    la      $a0,            space
    li      $v0,            4
    syscall
    addi    $s1,            $s1,                        1
    j       print_col2

next_row2:
    li      $v0,            4
    la      $a0,            nl
    syscall
    addi    $s3,            $s3,                        -4
    move    $sp,            $s3
    addi    $s0,            $s0,                        1
    li      $s1,            0
    j       print_row2


exit:
    li      $v0,            10
    syscall

.data
input_n:                    .asciiz "Enter n (no. of rows): "
input_m:                    .asciiz "Enter m (no. of columns): "
input_a:                    .asciiz "Enter a: "
input_b:                    .asciiz "Enter b: "
output_matrix:              .asciiz "\nThe matrix is:\n"
output_matrix_transpose:    .asciiz "\nThe transpose of the matrix is:\n"
nl      :                  .asciiz"\n"
space   :                  .asciiz " "