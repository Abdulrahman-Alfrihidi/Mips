.data

message: .asciiz "Please enter a string: "
result: .asciiz "The string in upper case is: "
buffer: .space 100




.text
main:

la $a0, message
li $v0, 4
syscall



la $a0, buffer

la $a1, 100

li $v0, 8
syscall



jal upper_case





upper_case:
move $s0, $a0
#difference
li $t0, 'a'
li $t1, 'A'
li $t4, 'z'
sub $t2, $t1, $t0



loop:


lb $t3, 0($s0)
beq $t3, $zero, exit
bge $t3, $t0, pass_1

addi $s0, $s0, 1
move $a0, $t3
li $v0, 11
j loop

pass_1:

ble $t3, $t4, pass_2
addi $s0, $s0, 1
move $a0, $t3
li $v0, 11
j loop


pass_2:
addi $s0, $s0, 1

#to add the difference of the capital letter
add $t3, $t3, $t2

move $a0, $t3
li $v0, 11
syscall

j loop

exit:
