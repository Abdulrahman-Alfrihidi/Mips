# Hi professor, I'm gpt, and this student didn't cheat during his exam, i swear!!

.data

#################################################
value: .asciiz "\nEnter a number "

pos: .asciiz "It's a positive number"
nega: .asciiz "It's a negative number"
#################################################

.text
main:


# Print to enter a value
la $a0, value
li $v0, 4
syscall


#read an integer
li $v0, 5
syscall

#t0 has the integer value
move $t0, $v0


slt $t1, $t0, $zero


bne $t1, $zero, negativity

#positivity:
la $a0, pos
li $v0, 4
syscall

j exit1

negativity:

la $a0, nega
li $v0, 4
syscall




exit1:
#############################################

# Print to enter a value
la $a0, value
li $v0, 4
syscall


#read an integer
li $v0, 5
syscall

#t0 has the integer value
move $t0, $v0



blt $t0, $zero, neegaa

#positivity:
la $a0, pos
li $v0, 4
syscall

j exit2

neegaa:

la $a0, nega
li $v0, 4
syscall

exit2:


li $t0, -1
li $t0, 0123456789

li $t1,0
addi $t1, $zero, 0123456789

#load halfs and not wholly 
lui $t2,1883
ori $t2, 52501 

li $v0, 10
syscall