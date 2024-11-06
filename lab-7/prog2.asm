    .data
array:      .word 5, 10, 15, 20, 25       # Array to search in
num_elements: .word 5                     # Number of elements in the array
search_element: .word 15                  # Element to search for
found_msg:  .asciiz "Element found at index: "
not_found_msg: .asciiz "Element not found\n"

    .text

main:
    # Load input arguments for the linear search
    la $a0, array              # Load base address of the array into $a0
    lw $a1, num_elements       # Load the total number of elements into $a1
    lw $a2, search_element     # Load the search element into $a2

    # Call the linear search procedure
    jal linear_search

    # Check the return value
    bnez $v0, element_found    # If $v0 is not zero, element is found
    # If not found, display not found message
    li $v0, 4
    la $a0, not_found_msg
    syscall
    j end_program              # Jump to end of program

element_found:
    # Display found message
    li $v0, 4
    la $a0, found_msg
    syscall

    # Display the index of the element (stored in $v1)
    move $a0, $v1              # Move index to $a0 for printing
    li $v0, 1                  # Set syscall for integer output
    syscall

end_program:
    li $v0, 10                 # Exit program
    syscall

# Procedure: linear_search
# Arguments:
#   $a0 = base address of array
#   $a1 = total number of elements
#   $a2 = element to search for
# Return:
#   $v0 = 1 if element is found, 0 if not found
#   $v1 = index of the element if found, undefined if not found

linear_search:
    li $v0, 0                  # Initialize return value to 0 (not found)
    li $t0, 0                  # Initialize index to 0

search_loop:
    beq $t0, $a1, end_search   # If index == total elements, end search
    lw $t1, 0($a0)             # Load array element at current index
    beq $t1, $a2, found        # If array element == search element, found

    addi $t0, $t0, 1           # Increment index
    addi $a0, $a0, 4           # Move to next element in array
    j search_loop              # Repeat search loop

found:
    li $v0, 1                  # Set return value to 1 (found)
    move $v1, $t0              # Store index in $v1 for returning
    jr $ra                     # Return to caller

end_search:
    jr $ra                     # Return to caller (not found)