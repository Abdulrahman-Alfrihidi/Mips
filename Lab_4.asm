.data

value: .asciiz "Enter a number: "
output: .asciiz "The numbers are: "

space: .asciiz " "

numbers: .asciiz "\nEnter eight values: "

number: .asciiz "\nEnter number: "

average: .asciiz "The average is "


first_num: .asciiz "\nEnter the first number: "
second_num: .asciiz "Enter the second number: "



.text
main:


la $a0, value
li $v0, 4
syscall


li $v0, 5
syscall

# t0 has the value 
move $t0, $v0


# register contains 1, for comparison purpose.
addi $t1, $zero, 1


loop:

blt $t0, $t1, exit1

move $a0, $t0
li $v0, 1
syscall

#space
la $a0, space
li $v0, 4
syscall

addi $t0, $t0, -1

j loop



exit1:


# tell the user to prompt 8 nums
la $a0, numbers 
li $v0, 4
syscall



#counter
addi $t0, $zero, 1

#sum
addi $t2, $zero, 0

# register contains 8 for comparison
addi $t1, $zero, 8


loop2:

bgt $t0, $t1, exit2


#tell the user to enter a number:
la $a0, number
li $v0, 4
syscall 

li $v0, 5
syscall

add $t2, $t2, $v0

addi $t0, $t0, 1


j loop2



exit2:



#print average
la $a0, average 
li $v0, 4
syscall 

#divide by 8, (2^3)
srl $a0, $t2, 3 

li $v0, 1
syscall



#Next program
la $a0, first_num
li $v0, 4
syscall



li $v0, 5
syscall

# t0 contains first num
move $t0, $v0


la $a0, second_num
li $v0, 4
syscall

li $v0, 5
syscall
# t1 contains second num
move $t1, $v0



#counter for loop
addi $t2, $zero, 1

loop3:

bgt $t2, $t1, exit_program

move $a0, $t0
li $v0, 1
syscall
sll $t0, $t0, 1

addi $t2, $t2, 1

#print a space between numbers
la $a0, space
li $v0, 4
syscall 
j loop3



exit_program:

#finish program
li $v0, 10
syscall














