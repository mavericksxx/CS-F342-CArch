.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "Your entered number is: "
a: .word 0

.text
main:

#printing string msg1
li $v0, 4
la $a0, msg1
syscall

# reading the input
li $v0, 5
syscallmove $t0, $v0

#printing string msg2
li $v0, 4
la $a0, msg2
syscall

#printing the input string
li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall