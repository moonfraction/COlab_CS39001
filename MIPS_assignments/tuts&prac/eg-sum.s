.data                                                           #data segment
prompt1:                                                        #prompt user to enter the numbers
    .asciiz"Enter the first number\n"
prompt2:
    .asciiz"Enter the second number\n"
prompt3:
    .asciiz"Enter the third number\n"
output:                                                         #output message
    .asciiz"The sum of the largest two of the three numbers : "
newline:                                                        #newline
    .asciiz"\n"
.text                                                           #code starts here
    .globlmain
main:

    la      $a0,        prompt1                                 #printing the message for entering first number
    li      $v0,        4
    syscall 

    li      $v0,        5                                       #reading the first number and storing it in register $t0
    syscall 
    move    $t0,        $v0

    la      $a0,        prompt2                                 #printing the message for entering second number
    li      $v0,        4
    syscall 

    li      $v0,        5                                       #reading the second number and storing it in register $t1
    syscall 
    move    $t1,        $v0

    la      $a0,        prompt3                                 #printing the message for entering third number
    li      $v0,        4
    syscall 

    li      $v0,        5                                       #reading the third number and storing it in register $t2
    syscall 
    move    $t2,        $v0

    bgt     $t0,        $t1,        test_1_2                    #checking for the greater number between first and second number ($t0 and $t1 values)
    blt     $t0,        $t1,        test_0_2

test_1_2:                                                       #When the first number >second number ($t0 value already known to be one of the two greater values)
    bgt     $t1,        $t2,        sum01                       #Check for greater number between $t1 and $t2 values
    blt     $t1,        $t2,        sum02

test_0_2:                                                       #When the first number < second number ($t1 value already known to be one of the two greater values)
    bgt     $t0,        $t2,        sum01                       #Check for greater number between $t0 and $t2 values
    blt     $t0,        $t2,        sum12

sum01:                                                          #sum = $t0 + $t1
    add     $t3,        $t0,        $t1
    b       print_sum                                           #goto the branch print_sum to print the result

sum02:                                                          #sum = $t0 + $t2
    add     $t3,        $t0,        $t2
    b       print_sum                                           #goto the branch print_sum to print the result

sum12:                                                          #sum = $t1 + $t2
    add     $t3,        $t1,        $t2
    b       print_sum                                           #goto the branch print_sum to print the result

print_sum:
    la      $a0,        output                                  #printing the output message
    li      $v0,        4
    syscall 

    move    $a0,        $t3                                     #printing the sum of the two greater numbers among the three numbers
    li      $v0,        1
    syscall 

    la      $a0,        newline                                 #linefeed
    li      $v0,        4
    syscall 

    li      $v0,        10                                      #exit
    syscall 

