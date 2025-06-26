########################
# Roll No.: 22CS30017
# Grp No.: 01
# Name: Chandransh Singh
########################

.text

main:
	la $a0, input_a
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $s0, $v0 #a

	la $a0, input_b
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $s1, $v0 #b

	# extra condition check for positive numbers input only
	bltz $s0, invalid_input
	bltz $s1, invalid_input
	beqz $s0, invalid_input
	beqz $s1, invalid_input

# Algorithm:
# for positive int inputs a and b
	# if(a<b) swap(a, b)
	# call gcd(a, b)
	
	# int gcd(int a, int b){
	#	return (b==0?a:gcd(b, a%b));
	# }


	sub $t1, $s0, $s1
	bltzal $t1, swap

	move $a0, $s0 #a
	move $a1, $s1 #b
	jal compute_GCD
	move $s2, $v0 #GCD

	# outputting the result in proper formatted fashion
	la $a0, output_gcd
	li $v0, 4
	syscall
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, output_and
	li $v0, 4
	syscall
	move $a0, $s1
	li $v0, 1
	syscall
	la $a0, output_is
	li $v0, 4
	syscall
	move $a0, $s2
	li $v0, 1
	syscall
	
	# check for prime
	move $a0, $s2
	jal test_for_prime
	move $s3, $v0
	
	beqz $s3, print_not_prime
	
	la $a0, output_prime
	li $v0, 4
	syscall
		
	j exit

swap:
	move $t2, $s0
	move $s0, $s1
	move $s1, $t2
	jr $ra
	

compute_GCD:
	beqz $a1, gcd_found
	div $a0, $a1
	mfhi $t0 # a%b
	move $a0, $a1
	move $a1, $t0
	j compute_GCD

gcd_found:
	move $v0, $a0
	jr $ra


test_for_prime:
	#return 1 for prime, else 0
	li $t1, 1
	beq $a0, $t1, found_not_prime # since 1 is neither prime nor composite
	li $t0 , 2 #iterator
	move $t1, $a0 

loop:
	beq $t0, $t1, found_prime
	div $t1, $t0
	mfhi $t2 # n%i
	beqz $t2, found_not_prime
	addi $t0, $t0, 1
	j loop

found_prime:
	li $v0, 1
	jr $ra

found_not_prime:
	li $v0, 0
	jr $ra

print_not_prime:
	la $a0, output_not_prime
	li $v0, 4
	syscall
	j exit


invalid_input:
	la $a0, output_invalid
	li $v0, 4
	syscall

exit:
	li $v0, 10
	syscall


.data
input_a: .asciiz "Enter first number(a): "
input_b: .asciiz "Enter second number(b): "
output_gcd: .asciiz "\nThe GCD of "
output_and: .asciiz " and "
output_is: .asciiz " is "
output_prime: .asciiz "\nThe GCD value is a prime"
output_not_prime: .asciiz "\nThe GCD value is not a prime"
output_invalid: .asciiz "\nEnter positive number(s) only"