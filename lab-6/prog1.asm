# Find the length of a string stored in memory.
# code snippet:
#    li $v0, 8
#    syscall
#    la $a0, string1   // user input stored in string1


.data
    string1: .asciiz "hello"
    string2: .asciiz "the length of the string is: "

.text
main:
    la $t0, string1
    li $s0, 0                    # counter

loop: 
    add $t1, $t0, $s0            # adding t0 (base address of current char.) and s0 (counter) and storing in t1
    lb $t2, 0($t0)               # read chars.   
    beq $t2, $zero, exit         # once we reach the end of string (=0), exit out 
    addi $s0, $s0, 1             # increment counter
    j loop  

exit: 
    li      $v0, 4           
    la      $a0, string2         
    syscall                  

    li      $v0, 1           
    move    $a0, $t1         
    syscall                  

    li      $v0, 10          
    syscall