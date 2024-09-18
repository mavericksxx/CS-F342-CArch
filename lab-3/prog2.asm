#To find the sum of the digits of a number N. Display the result to the user.

.data
msg: .asciiz "Enter a number: "  # Message to prompt user for input
sum: .word 0                    # Variable to store the sum of the digits

.text
.main

main:
    # Prompt user for input
    li $v0, 4                   # Load the print string syscall code
    la $a0, msg                 # Load address of the prompt message
    syscall                     # Print the prompt message

    # Read integer input from the user
    li $v0, 5                   # Load the read integer syscall code
    syscall                     # Read integer input into $v0
    move $t0, $v0               # Move the input value (N) into register $t0
    li $t1, 0                   # Initialize sum to 0 in register $t1

loop:
    beq $t0, $zero, end_loop    # If N == 0, exit the loop
    div $t0, $t0, 10            # Divide N by 10 (result in $LO register)
    mfhi $t2                    # Get remainder (N % 10) in $t2
    add $t1, $t1, $t2           # Add remainder to sum
    mflo $t0                    # Get quotient (N / 10) in $t0
    j loop                      # Repeat the loop

end_loop:
    # Print the result
    li $v0, 1                   # Load the print integer syscall code
    move $a0, $t1               # Move the result to $a0
    syscall                     # Print the sum

    li $v0, 10                  # Exit program
    syscall
