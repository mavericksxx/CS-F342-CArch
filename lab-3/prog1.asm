# To read a number N from input and find if the number
# is odd or even. Display the result to the user>

.data
input: .asciiz "Enter the value of N: "
result_even: .asciiz "\nThe number is even"
result_odd: .asciiz "\nThe number is odd"
num1: .word 0 

.text
main:
li $v0, 4
la $a0, input 
syscall

li $v0, 5
syscall
move $t0, $v0

li $t1, 2
li $t3, 0

rem $t2, $t0, $t1
beq $t2, $t3, even
j odd

even: 
li $v0, 4
la $a0, result_even
syscall 
j exit

odd:
li $v0, 4
la $a0, result_odd
syscall

exit:
li $v0, 10
syscall