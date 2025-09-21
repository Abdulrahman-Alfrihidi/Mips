.data 
value: .asciiz "Enter an integer number: "
even: .asciiz "This number is even"
odd: .asciiz "This number is odd"

.text
main:


la $a0, value
li $v0, 4
syscall 

li $v0, 5
syscall
move $t1, $v0

addi $t0, $zero, 2

#try with remu
rem $t1, $t1, $t0

beq $t1, $zero, evenBro

la $a0, odd
li $v0, 4
syscall

li $v0, 10
syscall


evenBro:
la $a0, even
li $v0, 4
syscall

li $v0, 10
syscall




