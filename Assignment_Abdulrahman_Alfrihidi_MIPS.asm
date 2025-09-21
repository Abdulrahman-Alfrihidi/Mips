######
#######
#note: After I finished the code, I passed it to gpt and told it to arrange it (thats why it look like this), it was unreadable. 
#######
#######


.data
N:      .asciiz "My dear, how many elements do you want in your array? "
values: .asciiz "\nEnter the array values: "
msg1:   .asciiz "\nYour array is "
msg2:   .asciiz "\nYour sorted array using bubble sort is "
msg3:   .asciiz "\nSum = "
msg4:   .asciiz "\nAverage = "
space:  .asciiz " "
arr:    .space 400
zero:   .float 0.0 #will be used in caculating the sum of the array 

.text
main:
    # ask the user to enter the size of the array
    la   $a0, N
    li   $v0, 4
    syscall
    
    # read the size of the array
    li   $v0, 5
    syscall
    move $t0, $v0           # t0 register have the size of the array
    
    # tell the user to enter the array values
    la   $a0, values
    li   $v0, 4
    syscall 

arrayValues:
    # load the array address
    la   $s0, arr
    # initialize a counter for the loop
    li   $s1, 0

loop:
    beq  $s1, $t0, displayArray
    # read a signle precision number
    li   $v0, 6
    syscall
    # store the entered number in memory
    swc1 $f0, 0($s0)
    # +4 because each word consist of 4 bytes
    addi $s0, $s0, 4
    # counter
    addi $s1, $s1, 1
    j    loop

displayArray:
    # print the array message
    la   $a0, msg1
    li   $v0, 4
    syscall
    # counter
    li   $s1, 0
    # load array
    la   $s0, arr

loop2:
    beq  $s1, $t0, finished
    # load element to f12 to print it
    lwc1 $f12, 0($s0) 
    # print a single precisoin number
    li   $v0, 2
    syscall
    # print a space
    la   $a0, space
    li   $v0, 4
    syscall
    # memory
    addi $s0, $s0, 4
    # counter
    addi $s1, $s1, 1
    j    loop2

finished:
    # s0 has the array
    la   $s0, arr
    # s1 have the length
    move $s1, $t0
    jal  bubbleSort
    
    move $a0, $t0
    jal  SumAverage
    # finally 
    li   $v0, 10
    syscall

bubbleSort:
    move $t0, $s1       # Save original size in $t0
    move $t3, $s1       # $t3 = outer loop counter

outerLoop:
    beq  $t3, $zero, displaySorted
    la   $s0, arr       # Reset to start of array
    li   $t1, 1         # Inner loop counter
    addi $t2, $t3, -1   # Inner loop limit (outer counter - 1)

innerLoop:
    bgt  $t1, $t2, endInner
    lwc1 $f1, 0($s0)
    lwc1 $f2, 4($s0)
    c.lt.s $f1, $f2
    bc1t swap
    j    skipSwap

swap:
    swc1 $f2, 0($s0)
    swc1 $f1, 4($s0)

skipSwap:
    addi $s0, $s0, 4
    addi $t1, $t1, 1
    j    innerLoop

endInner:
    addi $t3, $t3, -1   # Decrement outer loop counter
    j    outerLoop

displaySorted:
    # print sorted message
    la   $a0, msg2
    li   $v0, 4
    syscall
    li   $s1, 0 
    la   $s0, arr

loop3:
    beq  $s1, $t0, exit
    # load element to f12 to print it
    lwc1 $f12, 0($s0) 
    # print a single precisoin number
    li   $v0, 2
    syscall
    # print a space
    la   $a0, space
    li   $v0, 4
    syscall
    # memory
    addi $s0, $s0, 4
    # counter
    addi $s1, $s1, 1
    j    loop3

exit:
    jr   $ra

SumAverage:
    la   $s0, arr
   
    #counter
    li   $t1, 0
    
    #array size
    move $t2, $a0
    
    #total
    l.s  $f0, zero

loop4:
    beq  $t2, $t1, average
    lwc1 $f1, 0($s0)
    add.s $f0, $f0, $f1
    #memory
    addi $s0, $s0, 4
    #counter
    addi $t1, $t1, 1
    j    loop4

average:
    #sum message and printing
    la   $a0, msg3
    li   $v0, 4
    syscall
    mov.s $f12, $f0 
    li   $v0, 2
    syscall
    
    #average message and printing
    la   $a0, msg4
    li   $v0, 4
    syscall
    mtc1 $t2, $f4 #convert integer to float
    cvt.s.w $f4, $f4
    div.s $f12, $f0, $f4 #divide the sum over the N
    #print float
    li   $v0, 2
    syscall

bye:
    jr   $ra
