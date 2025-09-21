#.data

#x: .asciiz "Enter value of x: "
#z: .asciiz "\nEnter value of z: "

#y: .asciiz "\ny is "



#.text
#main:

#la $a0, x
#li $v0, 4
#syscall


## Read an integer (x)
# li $v0, 5
# syscall 
 
 
 # t0 contains the x value
# move $t0, $v0 
 
 
 
 
 
#la $a0, z
#li $v0, 4
#syscall 


#Read integer (y)
#li, $v0, 5
#syscall 


#move integer value to t1 (y)
#move $t1, $v0



#multiply x by 2
#sll $t0, $t0, 1


#multiply y by 2
#sll $t1, $t1, 2



#load the value of 5 to add it with the rest of the equation 
#li $t2,5

# 2x+4y+5
#add $t2, $t2, $t1
#add $t2, $t2, $t0

#print the y string
#la $a0, y
#li $v0, 4
#syscall 


#to print an integer
#move $a0, $t2


#to print the y integer
#li $v0, 1
#syscall 


#######################
#      COOKED  1      #
#######################




 #.data
 
#value: .asciiz "Enter an integer number: "

#result: .asciiz "The number is "

#pos: .asciiz "this number is positive"
#neg: .asciiz "this number is negative"





#.text
#main:

#la $a0, value
#li $v0, 4
#syscall



#li $v0,5
#syscall

# t0 = value entered by user
#move $t0, $v0


#slt $t1, $t0, $zero

#beq $t1, $zero, positive

#la $a0, neg
#li $v0, 4
#syscall
#j exit


#positive:
#la $a0, pos
#li $v0, 4
#syscall 


#exit:
#li $v0, 10
#syscall
 
 
 
##########################
#        COOKED          #
##########################
 
 
 
#.data

#value: .asciiz "Enter an integer: "
#even: .asciiz "This value is even"
#odd: .asciiz "This value is odd"


#.text
#main:


#la $a0, value
#li $v0, 4
#syscall


#to read an integer
#li $v0, 5
#syscall
 
 
#t0 = the value we want to make our operation on. 
#move $t0, $v0
 
 
#rem $t1, $t0, 2

#beq $t1, $zero, ev

#la $a0, odd
#li $v0, 4
#syscall
#j exit 
  
 
     
#ev: 
#la $a0, even
#li $v0, 4
#syscall 
 

  
#exit:
#li $v0, 10
#syscall 
 
 
 
############################# 
#           COOKED          #
############################# 
 
.data

value: .asciiz "Enter two integer values: "

output: .asciiz " is the larger number"







.text
main:


la $a0, value
li $v0, 4
syscall


#Read first integer
li $v0, 5
syscall

#t0 has first integer value
move $t0, $v0


li $v0, 5
syscall

#t1 has second value
move $t1, $v0


#do the comparison
slt $t2, $t1, $t0



#if not zero, it's one, so it meets the condition. and the first is larger
bne $t2, $zero, first

move $a0, $t1
li $v0, 1
syscall
j exit


first:
move $a0, $t0
li $v0, 1
syscall


exit:
#print the output text
la $a0, output 
li $v0, 4
syscall 


li $v0, 10
syscall











