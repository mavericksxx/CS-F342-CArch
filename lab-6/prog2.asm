# Reverse a string stored in memory. 
# Store the reversed string in memory. 
# Also display the reversed string to the user.

.data
    input_str: .asciiz "whatever"
    backwards: .asciiz "The reversed string is: \n"
    rev_str: .space 50

.text
main:
    la $t0, input_str           # base address of input string in $t0
    la $a1, rev_str             # base address of reversed string in $a1
    li $s0, 0                   # counter i = 0

loop1: 
    add $t1, $s0, $t0           # address of input_str[i] in $t1
    lb $t2, 0($t1)              # $t2 = input_str[i]
    beq $t2, $zero, out         # if input_str[i] = 0, go to out
    addi $s0, $s0, 1            # i = i + 1 (increment counter)
    j loop1 

out: 
    li $v0, 4                   # print string
    la $a0, backwards           
    syscall

loop2:
    addi $s0, $s0, -1           # i = i - 1 (points to the last char.)
    add $t1, $s0, $t0           # address of input_str[i] in $t1
    lb $a0, 0($t1)              # $a0 = input_str[i]
    sb $a0, 0($a1)              # store in rev_str[i]
    addi $a1, $a1, 1

    li $v0, 11                  # print char.
    syscall

    beq $s0, $zero, exit        # if i = 0 then exit
    j loop2

exit:
    li $v0, 10
    syscall
