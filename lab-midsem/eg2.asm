# Hard coded arrays (2) 
# Multiply elements at the same index and add all the products

.data
    A:      .word 1, 2, 3, 4, 5    # Array A with 5 elements
    B:      .word 6, 7, 8, 9, 10   # Array B with 5 elements
    len:    .word 5                # Length of the arrays
    msg:    .asciiz "The sum of the products of corresponding elements is: "

.text
main:
    # Load the base addresses of arrays A and B
    la $t0, A                 # Load base address of array A into $t0
    la $t1, B                 # Load base address of array B into $t1
    lw $t2, len               # Load the length of the arrays into $t2 (number of elements)
    
    # Initialize sum to 0
    li $t3, 0                 # $t3 will hold the sum of products
    li $t4, 0                 # $t4 will be used as the loop index

loop:
    bge $t4, $t2, end_loop    # If index >= length, exit the loop

    lw $t5, 0($t0)            # Load A[i] into $t5
    lw $t6, 0($t1)            # Load B[i] into $t6

    mul $t7, $t5, $t6         # Multiply A[i] * B[i] and store result in $t7
    add $t3, $t3, $t7         # Add the product to the sum ($t3 = $t3 + $t7)

    # Move to the next elements in the arrays
    addi $t0, $t0, 4          # Move to the next element in array A
    addi $t1, $t1, 4          # Move to the next element in array B
    addi $t4, $t4, 1          # Increment index
    j loop                    # Repeat the loop

end_loop:
    # Print the result
    li $v0, 4                 # Syscall for printing a string
    la $a0, msg               # Load the message to be printed
    syscall                   # Print the message

    li $v0, 1                 # Syscall for printing an integer
    move $a0, $t3             # Move the sum into $a0
    syscall                   # Print the sum

    # Exit the program
    li $v0, 10                # Syscall for program exit
    syscall