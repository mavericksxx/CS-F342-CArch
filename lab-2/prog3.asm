# int x=5, y=10, z
# z=x*y
# a=x/y, b=x%y

.data
num1: .word 5
num2: .word 10
num3: .word 0
num4: .word 0
num5: .word 0

msg1: .asciiz "The result of multiplication is: "
msg2: .asciiz "\nThe quotient is: "
msg3: .asciiz "\nThe remainder is: "

.text
main:
lw $t0, num1
lw $t1, num2
multu $t0, $t1
mflo $t2
sw $t2, num3

li $v0, 4
la $a0, msg1
syscall

li $v0, 1
move $a0, $t2
syscall

lw $t0, num1
lw $t1, num2
divu $t0, $t1

mflo $t2
sw $t2, num4

li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t2
syscall

mfhi $t3
sw $t3, num5

li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 10
syscall