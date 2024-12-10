# Find the output of polynomial for user input value of x: ax^2 + bx + c

    .data
a:          .float 2.0              # Coefficient of x^2
b:          .float 3.0              # Coefficient of x
c:          .float 5.0              # Constant term
prompt:     .asciiz "Enter the value of x: "
result_msg: .asciiz "The polynomial result is: "
newline:    .asciiz "\n"

    .text

main:
    # Prompt user for input
    li $v0, 4
    la $a0, prompt
    syscall

    # Read user input (x)
    li $v0, 6                    # Floating-point input syscall
    syscall
    mov.s $f0, $f0               # Store input x in $f0

    # Load coefficients into floating-point registers
    l.s $f1, a                   # $f1 = a
    l.s $f2, b                   # $f2 = b
    l.s $f3, c                   # $f3 = c

    # Calculate ax^2
    mul.s $f4, $f0, $f0          # $f4 = x^2
    mul.s $f5, $f1, $f4          # $f5 = a * x^2

    # Calculate bx
    mul.s $f6, $f2, $f0          # $f6 = b * x

    # Add ax^2 + bx + c
    add.s $f7, $f5, $f6          # $f7 = ax^2 + bx
    add.s $f8, $f7, $f3          # $f8 = ax^2 + bx + c

    # Print result message
    li $v0, 4
    la $a0, result_msg
    syscall

    # Print the result
    mov.s $f12, $f8              # Move result to $f12 for printing
    li $v0, 2                    # Floating-point print syscall
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall

    