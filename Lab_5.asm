# WELCOME to LAB 5 !!!!!!!

# Data declaration
.data

rep: .asciiz "Enter number of times to repeat: "
message: .asciiz "\nMIPS is fun (even if I don't like it)"

number: .asciiz "\nEnter a number: "
result: .asciiz "Factorial of your number is "




#start of the program
.text
main:


#print the rep message
la $a0, rep
li $v0, 4
syscall 


# read the rep number, and save it in a0
li $v0, 5
syscall

move $a0, $v0

jal repeat


################################################

la $a0, number
li $v0, 4
syscall 

li $v0, 5
syscall

move $a0, $v0

jal factorial

move $t0, $v0


# print facto
move $a0, $v0

li $v0, 1
syscall


################################################
la $a0, number
li $v0, 4
syscall 

li $v0, 5
syscall

move $a0, $v0
move $a1, $v0

jal recursion_factorial

move $t0, $v0


# print facto
move $a0, $v0

li $v0, 1
syscall

li $v0, 10
syscall
################################################

repeat:
#counter
addi $t0, $zero, 1


#move to t1 the value that was the input
move $t1, $a0
loop:

bgt $t0, $t1, exit1

# To print the repeating message
la $a0, message
li $v0, 4
syscall



addi $t0, $t0, 1


j loop


exit1:
jr $ra 




factorial:

# t0 contains number. 
move $t0, $a0
addi $t1, $zero, 1
beq $t0, $zero, zero_or_one
beq $t0, $t1, zero_or_one

#for the comparison
addi $t9, $zero, 1

# t2 has the value to be factorialed
move $t2, $t0

loop2:

beq $t0, $t9, exit2

#second multiplied num
addi $t5, $t0, -1

mul $t2, $t2, $t5

addi $t0, $t0, -1

j loop2


zero_or_one:
#move the value 1 to the return register
move $v0, $t1
jr $ra


exit2:
move $v0, $t2
jr $ra




recursion_factorial:
bne $a1,$a0, facto
move $t6, $ra

facto:
addi $t9, $zero, 1
beq $a0, $t9, exit3
addi $t0, $a0, -1
mul $a1, $a1, $t0
addi $a0, $a0, -1

jal recursion_factorial

exit3:
move $v0, $a1
jr $t6