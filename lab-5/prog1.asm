.data                           # Data segment
A:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  # Array A with 10 elements
target:  .word 5                         # The target value to find
found_msg:  .asciiz "Target found at index: "
not_found_msg:  .asciiz "Target not found.\n"
    
    .text                           
    
main:
    li $t0, 0                       # Initialize index i = 0
    li $t1, 10                      # Load length = 10 into $t1
    la $t2, A                       # Load base address of A into $t2
    lw $t3, target                  # Load the target value into $t3

find_loop:
    beq $t0, $t1, not_found         # If i == length, target not found, go to not_found

    lw $t4, 0($t2)                  # Load A[i] into $t4
    beq $t4, $t3, found             # If A[i] == target, go to found

    addi $t0, $t0, 1                # Increment i
    addi $t2, $t2, 4                # Move to the next element in A (increment by word size)
    j find_loop                     # Repeat the loop

found:
    li $v0, 4                       # System call code for printing string
    la $a0, found_msg               # Load the "Target found" message
    syscall

    move $a0, $t0                   # Move the index where target is found into $a0
    li $v0, 1                       # System call code for printing integer
    syscall

    j exit                          # Exit the program

not_found:
    li $v0, 4                       # System call code for printing string
    la $a0, not_found_msg           # Load the "Target not found" message
    syscall

exit:
    li $v0, 10                      # System call code for exit
    syscall
