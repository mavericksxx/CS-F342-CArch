.data 
array: .word 1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554  # Declare an array of integers
length: .word 10  # Length of the array

.text
main:
    la $s0, array     # Load base address of the array into $s0
    li $t0, 0         # Initialize loop index i = 0
    lw $t1, length    # Load the length of the array into $t1

loop: 
    bge $t0, $t1, exit  # If i >= length, exit loop
    lw $t2, 0($s0)      # Load array[i] into $t2
    addi $s0, $s0, 4    # Increment the base address by 4 bytes
    addi $t0, $t0, 1    # Increment loop index i++

    # Print integer in $t2
    li $v0, 1           # Load syscall code for print integer
    move $a0, $t2       # Move the value to be printed into $a0
    syscall              # Call the syscall to print the integer
    
    j loop              # Jump back to the start of the loop

exit: 
    li $v0, 10          # Load syscall code for program exit
    syscall              # Exit the program