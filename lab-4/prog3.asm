# Assume you have two word arrays A and B that have 5 elements each. 
# Assume the elements of the arrays are stored in memory. 
# Sum the corresponding elements of the two arrays A and B and store the result in word array C kept in memory. 
# Display the elements of array c to user.

# length = 5
# A[5] = {1, 2, 3, 4, 5};
# B[5] = {1, 2, 3, 4, 5};

# 	for (i = 0 ; i< 5; i++)
#		C[i] = A[i] + B[i]
#
# 	printf("The sum is")
# 	for (i = 0 ; i< 5; i++)
# 		printf("%d\n", C[i]);

.data
arrA: .word 1, 2, 3, 4, 5                     # Array A
arrB: .word 1, 2, 3, 4, 5                     # Array B
len: .word 5                                   # Length of the arrays
arrC: .word 0, 0, 0, 0, 0                     # Array C to store results
symbol: .asciiz " , "                          # Separator for output
symbol1: .asciiz "\nsum is : "                 # Message before sum
msga: .asciiz "sum of adding 2 arrays into array C is : "  # Message header

.text
main: 
    la $a0, arrA          # Load address of array A into $a0     
    la $a1, arrB          # Load address of array B into $a1     
    la $a2, arrC          # Load address of array C into $a2     
    lw $t0, len           # Load length of the arrays into $t0

up: 
    beq $t0, $zero, sum   # If $t0 (length) is 0, go to sum

    lw $t1, 0($a0)        # Load A[i] into $t1
    lw $t2, 0($a1)        # Load B[i] into $t2
    add $t3, $t1, $t2     # C[i] = A[i] + B[i]
    sw $t3, 0($a2)        # Store result in C[i]

    addi $a0, $a0, 4      # Move to the next element in A
    addi $a1, $a1, 4      # Move to the next element in B
    addi $a2, $a2, 4      # Move to the next element in C
    addi $t0, $t0, -1     # Decrease length
    j up                   # Repeat loop

sum: 
    la $a2, arrC          # Load address of C to print results
    lw $t1, len           # Load length of the arrays into $t1
    add $t4, $zero, $zero  # Initialize total sum in $t4

    li $v0, 4             # Prepare to print message
    la $a0, msga          # Load message header
    syscall                # Print message

up1: 
    lw $t0, 0($a2)        # Load C[i] into $t0 

    beq $t1, $zero, exit  # If $t1 (length) is 0, go to exit
    addi $t1, $t1, -1     # Decrease length

    li $v0, 1             # Prepare to print integer
    move $a0, $t0         # Move current element to $a0
    syscall                # Print current element

    li $v0, 4             # Prepare to print separator
    la $a0, symbol        # Load separator symbol
    syscall                # Print separator

    add $t4, $t4, $t0     # Add current element to total sum
    addi $a2, $a2, 4      # Move to the next element in C

down: 
    j up1                  # Jump to the next element

exit: 
    li $v0, 4             # Prepare to print total sum message
    la $a0, symbol1       # Load total sum message
    syscall                # Print total sum message

    li $v0, 1             # Prepare to print total sum
    move $a0, $t4         # Move total sum to $a0
    syscall                # Print total sum

    li $v0, 10            # Prepare to exit
    syscall                # Exit program