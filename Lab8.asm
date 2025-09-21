.data

msg1: .asciiz "Please enter number of elements: "
msg2: .asciiz "Enter the numbers: "
msg3: .asciiz "The average of the numbers is "
msg4: .asciiz "\nYou have entered very large number"
msg5: .asciiz "\nsmall numbers entered"
float_zero: .float 0.0
float_thousand: .float 1000.00


.text
main:

la $a0, msg1
li $v0, 4
syscall



li $v0, 5
syscall

#store in t0 the integer (size of the array)
move $t0, $v0

# t1 is a counter here
addi $t1, $zero, 1

#to count total


l.s $f3, float_zero



#tell user to enter numbers:
la $a0, msg2
li $v0, 4
syscall


loop:

bgt $t1, $t0, exit

                 
# read float numbers
li $v0, 6
syscall


#sum the total
add.s $f3, $f3, $f0

# increament the counter
addi $t1, $t1, 1



j loop 

exit:
mtc1 $t0, $f4

cvt.s.w $f4, $f4
#avg of float numbers
div.s $f1, $f3,$f4

la $a0, msg3
li $v0, 4
syscall

mov.s $f12, $f1
li $v0, 2
syscall 

l.s $f2, float_thousand


c.le.s $f1, $f2 
bc1f larger
b
la $a0, msg5
li $v0, 4
syscall


li $v0, 10
syscall

larger:
la $a0, msg4
li $v0, 4
syscall


li $v0, 10
syscall














