# Find the area of a circle (pi = 3.1415926535897924)

    .data
pi:     .float 3.1415926535897924    # Value of pi
radius: .float 5.0                   # Radius of the circle
area_msg: .asciiz "Area of the circle: "
newline: .asciiz "\n"

    .text

main:
    # Load radius and pi into floating-point registers
    l.s $f0, radius              # $f0 = radius
    l.s $f1, pi                  # $f1 = pi

    # Calculate radius^2
    mul.s $f2, $f0, $f0          # $f2 = radius * radius

    # Calculate area = pi * radius^2
    mul.s $f3, $f1, $f2          # $f3 = pi * radius^2

    # Print the message
    li $v0, 4
    la $a0, area_msg
    syscall

    # Print the area
    mov.s $f12, $f3              # Move the result to $f12 for printing
    li $v0, 2                    # Syscall for printing floating-point numbers
    syscall

    # Print a newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit the program
    li $v0, 10
    syscall