# Write a MIPS program to take two integer values from the user,
# add these values and print the output

.data
msg1: .asciiz "Enter the first integer: "
msg2: .asciiz "\nEnter the second integer: "
result: .asciiz "\nThe sum of the integers is: "

.text
main:
#printing msg1
li $v0, 4
la $a0, msg1
syscall

#reading first input
li $v0, 5
syscall
move $t0, $v0

#printing msg2
li $v0, 4
la $a0, msg2
syscall

#reading second input
li $v0, 5
syscall
move $t1, $v0

#adding the integers
add $t1, $t0, $t1

#printing the result msg
li $v0, 4
la $a0, result
syscall

#printing the result
li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall