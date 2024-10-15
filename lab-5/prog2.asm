# Find the sum of the elements of a word array A having 5 elements
# and display the result to the user.

.data
    array: .word 0:5     # Allocate space for 5 words, initialized to 0
    prompt: .asciiz "Enter 5 integers:\n"
    result: .asciiz "The sum of the elements is: "

.text

main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Initialize variables
    la $t0, array    # Load array address
    li $t1, 5        # Counter for loop
    li $t2, 0        # Sum of elements

input_loop:
    # Read integer
    li $v0, 5
    syscall
    sw $v0, ($t0)    # Store in array

    # Add to sum
    add $t2, $t2, $v0

    addi $t0, $t0, 4  # Move to next array element
    addi $t1, $t1, -1 # Decrement counter
    bnez $t1, input_loop

    # Print result
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Exit program
    li $v0, 10
    syscall