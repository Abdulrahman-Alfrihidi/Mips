.data

enter: .asciiz "Enter your N: "
value: .asciiz "your value is: "
water: .asciiz "ML of water "
coffee: .asciiz "\ngms of coffee "
sugar: .asciiz "\ngms of sugar "




.text
main:
# Enter N
la $a0, enter
li $v0, 4
syscall


# read integer
li $v0, 5
syscall

# t0 contains the repeatition
move $t0, $v0

#counter
addi $t9, $zero, 1

loop1:

bgt $t9, $t0, exit

#let the user enter value
la $a0, value
li $v0, 4
syscall


# read the intger that represent the 3 values
li $v0, 5
syscall


# s0 contains the integer that represent the vendor machine
move $s0, $v0


jal vendor_machine

#Increament counter
addi $t9, $t9, 1

j loop1

exit:
li $v0, 10
syscall




vendor_machine:









#max number of 16 digits
lui $t1, 65535

#t2 has the upper (water)
and $t2, $t1, $s0
srl $t2, $t2, 16 #to move right 16 bits, because we took the higher 16 bits

la $a0, water
li $v0, 4
syscall

move $a0, $t2

#print the water value
li $v0, 1
syscall 



li $t5, 65535

#lower bound
and $t3, $t5, $s0


# last 8 bin lower bound
li $t4, 65280


and $t4, $t3, $t4

#move  8 bin to the right
srl $t4, $t4, 8





#print the coffee message
la $a0, coffee
li $v0, 4
syscall

#print the intger value
move $a0, $t4

li $v0,1
syscall



#lower 8 bits , max values
li $t6, 255


#real lower value
and $t4, $t6, $s0


# print the sugar message to user
la $a0, sugar
li $v0, 4
syscall

# to print the first 8 bits
move $a0, $t4

li $v0, 1
syscall



jr $ra


