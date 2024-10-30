# Find if a given string is a palindrome or not.  
# Print the result to the user.

.data
    input_str: .asciiz "hannah"
    backwards: .asciiz "The reversed string is: \n"
    rev_str: .space 50
    palindrome_msg: .asciiz "\nThe string is a palindrome.\n"
    not_palindrome_msg: .asciiz "\nThe string is not a palindrome.\n"

.text
main:
    la $t0, input_str              # base address of input string
    la $a1, rev_str                # base address of reversed string
    li $s0, 0                      # counter i = 0

#length of input_str
loop1: 
    add $t1, $s0, $t0              # address of input_str[i]
    lb $t2, 0($t1)                 # $t2 = input_str[i]
    beq $t2, $zero, out            # if input_str[i] = 0, go to out
    addi $s0, $s0, 1               # i = i + 1
    j loop1 

out: 
    # print reversed string msg
    li $v0, 4                   
    la $a0, backwards           
    syscall

# reverse the string and store in rev_str
loop2:
    addi $s0, $s0, -1              # i = i - 1
    add $t1, $s0, $t0              # address of input_str[i]
    lb $a0, 0($t1)                 # $a0 = input_str[i]
    sb $a0, 0($a1)                 # store in rev_str
    addi $a1, $a1, 1

    # print reversed char.
    li $v0, 11                  
    syscall

    bgtz $s0, loop2                # if i > 0, repeat loop
    sb $zero, 0($a1)               # add null terminator to rev_str

# check if input_str is a palindrome
    la $t0, input_str              # reset $t0 to start of input_str
    la $a1, rev_str                # reset $a1 to start of rev_str
    li $t3, 1                      # $t3 is flag for palindrome (1 = true, 0 = false)

palindrome_check:
    lb $t4, 0($t0)                 # load character from input_str
    lb $t5, 0($a1)                 # load character from rev_str
    beq $t4, $zero, print_result   # if end of string, go to result
    bne $t4, $t5, not_palindrome   # if characters don’t match, not a palindrome
    addi $t0, $t0, 1               # move to next character in input_str
    addi $a1, $a1, 1               # move to next character in rev_str