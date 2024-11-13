# Write MALP using procedures:
# Power of a given number using recursion
#    int power (int a, int n)
#     {
#        if (n==1)
#            return a;
#        return a * power(n-1)
#    }
#    main()
#    {
#        pow = power(a, n);
#    }

.data
a:         .word 2                     # Base value (a)
n:         .word 3                     # Exponent (n)
result_msg: .asciiz "Result: "
result:    .word 0                     # Stores the result of a^n

.text

# Main procedure
main:
    # Load a and n for the power calculation
    lw $a0, a                   # Load base value a into $a0
    lw $a1, n                   # Load exponent n into $a1

    # Call the power procedure
    jal power                   # Compute a^n and store the result in $v0

    # Store the result in memory for display
    sw $v0, result

    # Display result message
    li $v0, 4
    la $a0, result_msg
    syscall

    # Display the result
    lw $a0, result              # Load result into $a0 for printing
    li $v0, 1
    syscall

    # Exit program
    li $v0, 10
    syscall

# Procedure: power
# Arguments:
#   $a0 = base value a
#   $a1 = exponent n
# Return:
#   $v0 = a^n

power:
    # Base case: if n == 1, return a
    li $t0, 1                   # Load 1 into $t0
    beq $a1, $t0, base_case     # If n == 1, jump to base case

    # Recursive case: a * power(a, n-1)
    addi $sp, $sp, -4           # Make space on the stack
    sw $ra, 0($sp)              # Save return address on the stack
    addi $a1, $a1, -1           # n = n - 1

    # Recursive call to power(a, n-1)
    jal power                   # Call power(a, n-1)

    # After return, multiply $v0 (result) by a
    lw $ra, 0($sp)              # Restore return address
    addi $sp, $sp, 4            # Free stack space
    mul $v0, $v0, $a0           # Multiply result by base a
    jr $ra                      # Return to caller

base_case:
    move $v0, $a0               # Set return value to base a
    jr $ra                      # Return to caller