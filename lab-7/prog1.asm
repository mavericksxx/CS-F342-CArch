    .data
x: .word 10                     # First number
y: .word 5                      # Second number
sum_msg: .asciiz "Sum: "
diff_msg: .asciiz "Difference: "
prod_msg: .asciiz "Product: "
quot_msg: .asciiz "Quotient: "

    .text

# Main procedure
main:
    # Load values of x and y
    lw $a0, x                   # Load x into $a0
    lw $a1, y                   # Load y into $a1

    # Call sum procedure
    jal sum
    # Display sum result
    li $v0, 4
    la $a0, sum_msg
    syscall
    move $a0, $v0               # Move result to $a0 for printing
    li $v0, 1
    syscall

    # Call difference procedure
    lw $a0, x                   # Reload x into $a0
    lw $a1, y                   # Reload y into $a1
    jal difference
    # Display difference result
    li $v0, 4
    la $a0, diff_msg
    syscall
    move $a0, $v0
    li $v0, 1
    syscall

    # Call product procedure
    lw $a0, x                   # Reload x into $a0
    lw $a1, y                   # Reload y into $a1
    jal product
    # Display product result
    li $v0, 4
    la $a0, prod_msg
    syscall
    move $a0, $v0
    li $v0, 1
    syscall

    # Call quotient procedure
    lw $a0, x                   # Reload x into $a0
    lw $a1, y                   # Reload y into $a1
    jal quotient
    # Display quotient result
    li $v0, 4
    la $a0, quot_msg
    syscall
    move $a0, $v0
    li $v0, 1
    syscall

    # Exit program
    li $v0, 10
    syscall

# Sum procedure: returns x + y
sum:
    add $v0, $a0, $a1           # $v0 = x + y
    jr $ra                      # Return to caller

# Difference procedure: returns x - y
difference:
    sub $v0, $a0, $a1           # $v0 = x - y
    jr $ra                      # Return to caller

# Product procedure: returns x * y
product:
    mul $v0, $a0, $a1           # $v0 = x * y
    jr $ra                      # Return to caller

# Quotient procedure: returns x / y
quotient:
    div $a0, $a1                # Divide x by y
    mflo $v0                    # Move quotient to $v0
    jr $ra                      # Return to caller