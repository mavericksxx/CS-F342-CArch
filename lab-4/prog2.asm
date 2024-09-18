# Linear search
# length = 10
# array[10] = {1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554};
# x = 5;
# for (i = 0; i < length; i++) 
#     if (array[i] == x) 
#     {
#   	printf("Element found at position %d", i);
#	  return;
#     }
# printf("Element not found");

.data
array: .word 1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74544
length: .word 10
data .word 10

msg1: .asciiz "Element found"
msg2: .asciiz "Element not found"

.text
main: 
la $s0, array        # base address
li $t0, 0            # loop variable
lw $t1, length       # no. of elements
lw $t3, data         # element to be searched
                     # change this line in case of user input

loop: 
bge $t0, $t1, exit
lw $t2, 0($s0)       # fetch element
beq $t2, $t3, found
addi $s0, $s0, 4     # move by 4 locations
addi $t0, $t0, 1     # increment loop by 1
j loop

found: 
li $v0, 4
la $a0, msg1
syscall
j loop1

exit: 
li $v0, 4
la $a0, msg2
syscall

loop1: 
li $v0, 10
syscall