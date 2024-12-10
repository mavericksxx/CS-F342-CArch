# Convert from fahrenheit to celcius (C = ((5.0/9.0)*(F-32.0)))

    .data
fahrenheit:    .float 98.6              # Input temperature in Fahrenheit
five:          .float 5.0               # Constant 5.0
nine:          .float 9.0               # Constant 9.0
thirty_two:    .float 32.0              # Constant 32.0
result_msg:    .asciiz "Temperature in Celsius: "
newline:       .asciiz "\n"

    .text

main:
    # Load the Fahrenheit value
    l.s $f0, fahrenheit          # $f0 = Fahrenheit

    # Subtract 32.0 (F - 32.0)
    l.s $f1, thirty_two          # $f1 = 32.0
    sub.s $f2, $f0, $f1          # $f2 = F - 32.0

    # Load 5.0 and 9.0
    l.s $f3, five                # $f3 = 5.0
    l.s $f4, nine                # $f4 = 9.0

    # Calculate 5.0 / 9.0
    div.s $f5, $f3, $f4          # $f5 = 5.0 / 9.0

    # Multiply (5.0 / 9.0) * (F - 32.0)
    mul.s $f6, $f5, $f2          # $f6 = (5.0 / 9.0) * (F - 32.0)

    # Print the result message
    li $v0, 4
    la $a0, result_msg
    syscall

    # Print the Celsius temperature
    mov.s $f12, $f6              # Move result to $f12 for printing
    li $v0, 2                    # Syscall for floating-point number print
    syscall

    # Print a newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit the program
    li $v0, 10
    syscall