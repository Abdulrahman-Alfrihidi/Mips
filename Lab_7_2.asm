.data

str: .asciiz "Please enter a string: "
result: .asciiz "The length of the string is: "
buffer: .space 100

.text
main:


la $a0, str
li $v0, 4
syscall


# buffer
la $a0, buffer

#max length
li $a1, 100
syscall

# Read a string
li $v0, 8
syscall


jal string_length



jal reverse_function 


li $v0, 10
syscall

string_length:

move $t5, $a0

#counter
addi $t9, $zero, 0

loop:

#counter for address


lb $t1, 0($t5)
beq $zero, $t1, end
addi $t5, $t5, 1
addi $t9, $t9, 1


j loop

end:



#due to the new line in buffer, -1
addi $t9, $t9, -1

#so we don't lose a0 value
move $t6, $a0

move $a0, $t9

#to use it in the reverse function
move $s0, $a0
#print int
li $v0, 1
syscall

move $a0, $t6

jr $ra





reverse_function:

# so that we go at the last of the string
add $t7, $a0, $s0
addi $s0, $s0, 1

loop2:
beq $s0, $zero, end2

lb $t4, 0($t7)


move $a0, $t4
li $v0, 11 #for character printing
syscall

#for comparison, if reached 0 then we are out of length
addi $s0, $s0, -1

#  t7 hold the current address
addi $t7, $t7, -1

j loop2


end2:

jr $ra
