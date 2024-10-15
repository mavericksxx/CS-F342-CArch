.data
array: .word 1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554  
length: .word 10                                               # Number of elements
x: .word 5                                                     # Element to be searched
msg_found: .asciiz "Element found at position: "               # Message for found element
msg_not_found: .asciiz "Element not found"                     # Message for not found element

.text
main: 
    la $s0, array        # Load base address of the array into $s0
    li $t0, 0            # Initialize loop variable i = 0
    lw $t1, length       # Load the length of the array into $t1
    lw $t3, x            # Load the element to be searched into $t3

loop: 
    bge $t0, $t1, not_found  # If i >= length, go to not_found
    lw $t2, 0($s0)           # Load array[i] into $t2
    beq $t2, $t3, found      # If array[i] == x, go to found
    addi $s0, $s0, 4         # Move to the next element (4 bytes)
    addi $t0, $t0, 1         # Increment i
    j loop                   # Repeat the loop

found: 
    li $v0, 4                # Prepare to print message
    la $a0, msg_found        # Load the "Element found" message
    syscall                  # Print message

    move $a0, $t0            # Move index i into $a0
    li $v0, 1                # Load print integer syscall code
    syscall                  # Print the index position

    li $v0, 10               # Load syscall for exit
    syscall                  # Exit the program

not_found: 
    li $v0, 4                # Prepare to print message
    la $a0, msg_not_found    # Load the "Element not found" message
    syscall                  # Print message

    li $v0, 10               # Load syscall for exit
    syscall                  # Exit the program