.data
number: .asciiz "Please enter number of elements: "
elements: .asciiz "Please enter your required numbers: "
msg1: .asciiz "Your entered numbers are: "
msg2: .asciiz "\nReverse order of your elements are: "
msg3: .asciiz "\nSum is "
arr: .word 4

space: .asciiz " "







.text
main:
# tell the user to enter a number (size)
la $a0, number
li $v0, 4
syscall 


# Read an integer
li $v0, 5
syscall


# t0 contains the size
move $t0, $v0


#load the array address
la $s0, arr

#counter
li $t1, 1
loop1:

bgt $t1, $t0, exit1

#print a message to let the user enter a number
la $a0, elements
li $v0, 4
syscall


# read integer
li $v0, 5
syscall

# store in the array
sw $v0, 0($s0)


# add with the byte base
addi $s0, $s0, 4

#counter add
addi $t1, $t1, 1
j loop1




exit1:



#print the array
la $a0, msg1
li $v0, 4
syscall



la $s0, arr

#counter
li $t1, 1
loop2:

bgt $t1, $t0, exit2

lw $a0, 0($s0)

# print integer
li $v0, 1
syscall


# print space
la $a0, space
li $v0, 4
syscall


addi $s0, $s0, 4
addi $t1, $t1, 1

j loop2

exit2:


#counter
li $t1, 1
addi $s0, $s0, -4


#print 2nd message
la $a0, msg2
li $v0, 4
syscall

#for the sum
addi $t4, $zero, 0

loop3:

bgt $t1, $t0, exit3

lw $a0, 0($s0)

# add the sum into t4 register
add $t4, $t4, $a0

#print integer
li $v0, 1
syscall

#print a space
la $a0, space
li $v0, 4
syscall


addi $s0, $s0, -4

addi $t1, $t1, 1

j loop3



exit3:

#print message and sum, then exit
la $a0, msg3
li $v0, 4
syscall

move $a0, $t4

li $v0, 1
syscall


li $v0, 10
syscall





    
 
            
                       
                                  
                                                        