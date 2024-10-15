# Hard coded array (1)
# User inputs a number
# Calculate A[0]*x³ + A[1]*x² + A[2]*x¹ + A[3]

.data
A:      .word 1, 2, 3, 4  # Array of 4 elements
n:      .word 4           # Number of elements in the array
msg1:   .asciiz "Enter the value of x: "
msg2:   .asciiz "The sum of elements multiplied by powers of x is: "

.text
main:
    # Input x
    li $v0, 4              
    la $a0, msg1           
    syscall

    li $v0, 5              
    syscall
    move $t0, $v0          # store input in $t0

    # initialize registers
    la $t1, A              # Load base address of the array 
    lw $t2, n              # Load the size of the array
    li $t3, 0              # Index register for looping 
    li $t5, 0              # Initialize sum register

    li $t7, 3             	# power

loop:
    bge $t3, $t2, end_loop # If index >= n, exit the loop

    # Load current array element
    lw $t6, 0($t1)         

    li $t8, 1              # Initialize result for x^power 
power_loop:
    # Compute x^power
    beqz $t7, skip_power   # If power is 0, skip power calculation
    mul $t8, $t8, $t0      # t8 = t8 * x (x^power)
    addi $t7, $t7, -1      # Decrease power by 1
    j power_loop           

skip_power:
    # A[i] * x^power
    mul $t9, $t6, $t8      

    # Add result to sum
    add $t5, $t5, $t9     

    # Move to the next array element
    addi $t1, $t1, 4     
    addi $t3, $t3, 1       

    li $t7, 3              
    sub $t7, $t7, $t3     

    j loop             

end_loop:
    # Print result
    li $v0, 4           
    la $a0, msg2           
    syscall

    move $a0, $t5        
    li $v0, 1             
    syscall

    # Exit program
    li $v0, 10          
    syscall