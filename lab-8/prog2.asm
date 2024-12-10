# Recursive binary search 
# int bin_search(int A[], int data, int lo, int hi) 
# { 
#   int mid; 
#     if (lo > hi) 
#       return -1 
#     mid = (lo + hi)/2; 
#     if (data == A[mid]) 
#       return mid 
#     if (data < A[mid]) 
#       return bin_search(A, data, lo, mid-1) 
#   return bin_search(A, data, mid, high+1) 
# }

    .data
array:      .word 1, 3, 5, 7, 9, 11, 13, 15     # Sorted array
n:          .word 8                             # Number of elements in the array
data:       .word 7                             # Element to search for
result_msg: .asciiz "Element found at index: "
not_found_msg: .asciiz "Element not found\n"
result:     .word -1                            # Stores the result

    .text

main:
    # Load arguments for binary search
    la $a0, array              # Base address of array
    lw $a1, data               # Element to search for
    li $a2, 0                  # Lower index (lo = 0)
    lw $t0, n                  # Load number of elements
    subi $a3, $t0, 1           # Higher index (hi = n-1)

    # Call binary search
    jal bin_search

    # Store the result
    sw $v0, result

    # Check result and display appropriate message
    bgez $v0, found            # If $v0 >= 0, element found
    # Element not found
    li $v0, 4
    la $a0, not_found_msg
    syscall
    j end_program

found:
    # Display found message
    li $v0, 4
    la $a0, result_msg
    syscall

    # Display the index
    move $a0, $v0              # Move result (index) to $a0
    li $v0, 1                  # Print integer syscall
    syscall

end_program:
    li $v0, 10                 # Exit
    syscall

# Procedure: bin_search
# Arguments:
#   $a0 = base address of array
#   $a1 = data to search for
#   $a2 = lower index (lo)
#   $a3 = higher index (hi)
# Return:
#   $v0 = index of the element if found, -1 if not found

bin_search:
    # Base case: if lo > hi, return -1
    bgt $a2, $a3, not_found

    # Calculate mid = (lo + hi) / 2
    add $t0, $a2, $a3          # t0 = lo + hi
    sra $t1, $t0, 1            # t1 = (lo + hi) / 2 (mid index)

    # Load A[mid]
    sll $t2, $t1, 2            # t2 = mid * 4 (word size)
    add $t2, $a0, $t2          # t2 = base address + (mid * 4)
    lw $t3, 0($t2)             # t3 = A[mid]

    # Check if data == A[mid]
    beq $a1, $t3, found_mid

    # Check if data < A[mid], recurse with hi = mid - 1
    blt $a1, $t3, search_left

    # Else, recurse with lo = mid + 1
    addi $a2, $t1, 1           # lo = mid + 1
    jal bin_search
    jr $ra                     # Return

search_left:
    subi $a3, $t1, 1           # hi = mid - 1
    jal bin_search
    jr $ra                     # Return

found_mid:
    move $v0, $t1              # Return mid index
    jr $ra                     # Return

not_found:
    li $v0, -1                 # Return -1
    jr $ra                     # Return
