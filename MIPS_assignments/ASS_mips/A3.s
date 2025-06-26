.text   

main:       
    li      $v0,            4
    la      $a0,            input_msg
    syscall 
    li      $s0,            16
    j       fun

fun:        
    beq     $t0,            40,         make_heap
    li      $v0,            5
    syscall 
    sw      $v0,            array($t0)
    addi    $t0,            $t0,        4
    j       fun

make_heap:  
    bge     $s0,            0,          heapify
    j       print_outmsg

heapify:    
    sub     $sp,            $sp,        8
    sw      $s0,            0($sp)
    sw      $ra,            4($sp)
    move    $s2,            $s0                         #largest
    li      $s3,            2
    mul     $s3,            $s3,        $s0
    addi    $s3,            $s3,        4               #left
    li      $s4,            2
    mul     $s4,            $s4,        $s0
    addi    $s4,            $s4,        8               #right
    li      $s5,            40
    blt     $s3,            40,         compare1
    j       jump_r

compare1:   
    lw      $t1,            array($s3)
    lw      $t2,            array($s2)
    bgt     $t1,            $t2,        update1
    j       compare2

update1:    
    move    $s2,            $s3
    j       compare2

compare2:   
    bgt     $s4,            36,         jump_r
    lw      $t1,            array($s4)
    lw      $t2,            array($s2)
    bgt     $t1,            $t2,        update2
    j       jump_r

update2:    
    move    $s2,            $s4
    j       jump_r

jump_r:     
    lw      $s0,            0($sp)
    lw      $ra,            4($sp)
    beq     $s2,            $s0,        exit_heapify
    #swap
    lw      $t1,            array($s0)
    lw      $t2,            array($s2)
    sw      $t1,            array($s2)
    sw      $t2,            array($s0)
    move    $s0,            $s2
    jal     heapify

    #erase stack and return to main iterative callee
exit_heapify:
    lw      $s0,            0($sp)
    lw      $ra,            4($sp)
    addi    $sp,            $sp,        8
    addi    $s0,            $s0,        -4
    j       make_heap

print_outmsg:
    li      $v0,            4
    la      $a0,            output_msg
    syscall 
    #set print iterator to 0
    li      $s6,            0
    j       print_heap
print_heap: 
    beq     $s6,            40,         exit
    li      $v0,            1
    lw      $a0,            array($s6)
    syscall 
    li      $v0,            4
    la      $a0,            space
    syscall 
    addi    $s6,            $s6,        4
    j       print_heap
exit:       
    li      $v0,            10
    syscall 

.data   
array:      .space  40
input_msg:  .asciiz "Enter 10 numbers:\n"
output_msg: .asciiz "The max-heap is:  "
space:      .asciiz " "