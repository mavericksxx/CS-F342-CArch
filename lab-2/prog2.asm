# x = (a - b) + (c - 5)

.data
n1: .word 0
n2: .word 0
n3: .word 0 
n4: .word 0 

msg: .asciiz "The result of the operation is: "

.ext
main:
lw $t0, n1
lw $t1, n2
sub $t2, $t0, $t1

lw $t3, n3
li $t4, 5
sub $t4, $0, $t4
add $t5, $t3, $t4

add $t6, $t2, $t5
sw $t6, n4

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t6
syscall

li $v0, 10
syscall