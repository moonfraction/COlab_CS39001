.data   
str:        .space  100
input_msg:  .asciiz "Enter a string: "
output_msg: .asciiz "The reverse string is: "

.text   

main:       
    li      $v0,        4
    la      $a0,        input_msg
    syscall 

    li      $v0,        8
    la      $a0,        str
    li      $a1,        100
    syscall 

    li      $t0,        0
    li      $t1,        0
    li      $t2,        0

loop:       
    lb      $t1,        str($t0)
    beqz    $t1,        pop_stack
    addi    $sp,        $sp,        -1
    sb      $t1,        0($sp)
    addi    $t0,        $t0,        1
    j       loop

pop_stack:  
    lb      $t1,        0($sp)
    sb      $t1,        str($t2)
    beq     $t0,        $zero,      print
    addi    $sp,        $sp,        1
    addi    $t2,        $t2,        1
    addi    $t0,        $t0,        -1
    j       pop_stack

print:      
    li      $v0,        4
    la      $a0,        output_msg
    syscall 

    sb      $zero,      str($t2)
    li      $v0,        4
    la      $a0,        str
    syscall 


exit:       
    li      $v0,        10
    syscall 