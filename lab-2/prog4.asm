# Write a MIPS program to take the value of N
# from the user, find the sum of first N natural 
# numbers and print the output

# int i, sum = 0
# for (i=1;i<=N;i++)
#   sum = sum + i

.data
input: .asciiz "Enter the value of N: "
result: .asciiz "\nThe sum of the first N natural numbers is: "
sum: .word 0 

.text
main
li $v0, 4
la $a0, input
syscall

li $v0, 5
syscall
move $t2, $v0

li $t0, 0  # sum = 0
li $t1, 1  # i = 1

next: 
bgt $t1, $t2, over
add $t0, $t0, $t1  # sum = sum + 1
addi $t1, $t1, 1   # i = i + 1
j next

over: sw $t0, sum

li $v0, 4
la $a0, result
syscall

li $v0, 1
lw $a0, sum
syscall

li $v0, 10
syscall