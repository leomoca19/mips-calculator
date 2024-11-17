.text
main:
	jal greet
	jal main_loop

main_loop:
	jal menu
	
	li $t1, 0
	beq $t0, $t1, exit
	li $t1, 1
	beq $t0, $t1, ADD
	li $t1, 2
	beq $t0, $t1, SUB
	li $t1, 3
	beq $t0, $t1, MUL
	#li $t1, 4
	#beq $t0, $t1, DIV
	jr $ra
		
greet:
    	# print greeting
	li $v0, 4 
	la $a0, greeting 
	syscall
	jr $ra

say_bye:
	# print goodbye
	li $v0, 4
	la $a0, goodbye
	syscall
	jr $ra
		
exit:
	jal say_bye
	li $v0, 10 # load exit instruction
	syscall
	
menu:
	# print menu and options
	li $v0, 4
	la $a0, options
	syscall
	la $a0, select
	syscall
	
	# read a number from user
	li $v0, 5
	syscall
	
	# store answer
	move $t0, $v0
	jr $ra

listen: 
	# get first number
	li $v0, 4
	la $a0, listen1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	# get second number
	li $v0, 4
	la $a0, listen2
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	jr $ra
	
ADD:
	# print operation message
	li $v0, 4
	la $a0, addition
	syscall
	
	jal listen
	
	# print result
	add $t2, $t0, $t1
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, nwln
	syscall	
	j main_loop	

SUB:
	# print operation message
	li $v0, 4
	la $a0, subtract
	syscall
	
	jal listen
	
	# print result
	sub $t2, $t0, $t1
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, nwln
	syscall	
	j main_loop	
	
MUL:
	# print operation message
	li $v0, 4
	la $a0, multiply
	syscall
	
	jal listen
	
	# print result
	mul $t2, $t0, $t1
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, nwln
	syscall	
	j main_loop	
	
.data
greeting: .asciiz "Hi User, Welcome to my calculator!\n\n"

options: .asciiz 
"0 - Exit\n1 - Add\n2 - Subtract\n3 - Multiply\n4 - Divide\n"
select: .asciiz "Select an option: "
result: .asciiz "The result is "

addition: .asciiz "(Adding)"
subtract: .asciiz "(Subtracting)"
multiply: .asciiz "(Multiplying)"
divide: .asciiz "(Dividing)"
two_numbers: .asciiz " two numbers\n"

listen1: .asciiz " Enter the first number: "
listen2: .asciiz "Enter the second number: "

nwln: .asciiz "\n"

goodbye: .asciiz "Goodbye!\n"
exit_msg: .asciiz "Press enter to exit<Enter>"

debug1: .asciiz "I should be printed\n"
debug2: .asciiz "I should not be printed\n"
