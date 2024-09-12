# Write a MIPS program to compute the factorial
# of a whole number N, where assume N > 0

# factorial=1;
#   for(i=1; i<=N; i++)
#   {
#       factorial *= i;
#   }

.data
input: .asciiz "Enter the value of N: "
result: .asciiz "\nThe factorial of N is: "
factorial: .word 0 

.text

main:
li $v0, 4
la $a0, input
syscall

li $v0, 5
syscall
move $t2, $v0

li $t0, 1
li $t1, 1

loop: 
bgt $t1, $t2, outer
mul $t0, $t0, $t1
addi $t1, $t1, 1
j loop

outer:
sw $t0, factorial

li $v0, 4
la $a0, result
syscall

li $v0, 1
lw $a0, factorial
syscall

li $v0, 10
syscall