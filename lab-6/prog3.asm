# Find if a given string is a palindrome or not.  
# Print the result to the user.

.data
    input_str: .asciiz "whatever"
    palindrome_msg: .asciiz "\nThe string is a palindrome.\n"
    not_palindrome_msg: .asciiz "\nThe string is not a palindrome.\n"

.text
main:
    la $t0, input_str           # base address of input_str in $t0
    li $s0, 0                   # counter i = 0

# length of input_str
length:
    add $t1, $t0, $s0           # addr of input_str[i]
    lb $t2, 0($t1)              # $t2 = input_str[i]
    beq $t2, $zero, chk_palin   # if input_str[i] = 0, go to check_palindrome loop
    addi $s0, $s0, 1            # increment counter
    j length

# check if input_str is a palindrome
chk_palin:
    li $t3, 1                   # flag for palindrome (1 = true)
    addi $s1, $s0, -1           # s1 = last index (length - 1)
    li $s2, 0                   # init starting index

compare_loop:
    bge $s2, $s1, print_result  # if indices meet or cross, string is a palindrome
    add $t4, $t0, $s2           # addr of input_str[s2]
    lb $t5, 0($t4)              # load character at input_str[s2]
    add $t6, $t0, $s1           # addr of input_str[s1]
    lb $t7, 0($t6)              # load character at input_str[s1]
    bne $t5, $t7, not_palin     # if chars don’t match, not a palindrome
    addi $s2, $s2, 1            # move forward from start
    addi $s1, $s1, -1           # move backward from end
    j compare_loop

not_palin:
    li $t3, 0                   # flag = 0 (false)

# print result based on palindrome check
print_result:
    li $v0, 4
    beq $t3, 1, palindrome      # if flag is 1, print palindrome message
    la $a0, not_palindrome_msg
    j end

palindrome:
    la $a0, palindrome_msg

end:
    syscall                     # print the result

    # exit
    li $v0, 10
    syscall