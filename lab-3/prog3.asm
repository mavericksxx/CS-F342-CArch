# Write the MIPS ALP for the high level code.
# Observe Precedence and Associativity rules.
# a = a * b / c % d + e;

.data
msg1: .asciiz "Enter the value of a: "
msg2: .asciiz "Enter the value of b: "
msg3: .asciiz "Enter the value of c: "
msg4: .asciiz "Enter the value of d: "
msg5: .asciiz "Enter the value of e: "

.text
main:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0

li $v0, 4
la $a0, msg3
syscall

li $v0, 5
syscall
move $t2, $v0

li $v0, 4
la $a0, msg4
syscall

li $v0, 5
syscall
move $t3, $v0

li $v0, 4
la $a0, msg5
syscall

li $v0, 5
syscall
move $t4, $v0

mul $t1, $t0, $t1
div $t1, $t2
mflo $t2
div $t2, $t3
mfhi $t3
add $t4, $t4, $t3

li $v0, 1
move $a0, $t4
syscall

li $v0, 10
syscall
