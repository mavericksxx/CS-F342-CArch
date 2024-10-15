# question here

.data
arrA: .word 1,2,3,4,5
arrB: .word 1,2,3,4,5
len: .word 5
arrC: .word 0,0,0,0,0
symbol: .asciiz " , "
symbol1: .asciiz "\nsum is : "
msga: .asciiz "sum of adding 2 arrays into array is C is :"


.text
main: 	la $a0,arrA # address of A     
	la $a1,arrB # address of B     
	la $a2,arrC # address of C     
	lw $t0,len

up:	beq $t0,$zero,sum

	lw $t1,0($a0)
	lw $t2,0($a1)
	add $t3,$t1,$t2
	sw $t3,0($a2)
	addi $a0,$a0,4
	addi $a1,$a1,4
	addi $a2,$a2,4
	addi $t0,$t0,-1
	j up	

sum:	la $a2,arrC
	lw $t1,len
	add $t4,$t4,$zero # T4 IS SUM

	li $v0,4
	la $a0, msga
	syscall 

up1:	lw $t0,0($a2) 

	beq $t1,$zero,exit
	addi $t1,$t1,-1

	li $v0,1
	move $a0,$t0
	syscall

	li $v0,4
	la $a0,symbol
	syscall

	add $t4,$t4,$t0
	addi $a2,$a2,4


down:	j up1
exit:	li $v0,4
	la $a0,symbol1
	syscall	

	li $v0,1
	move $a0,$t4
	syscall

	li $v0,10
	syscall
