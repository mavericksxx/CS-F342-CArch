# Find the length of a string stored in memory.
# code snippet:
#    li $v0, 8
#    syscall
#    la $a0, string1   // user input stored in string1

.data                   
prompt: .asciiz "Enter a string: "               
msg:    .asciiz "\nThe length of the string is: "

.text                   
main:
    li      $v0, 4           
    la      $a0, prompt      
    syscall                  

    # read user input string
    li      $v0, 8   
    syscall        
    la      $a0, str                                 

    # calculate the length of the string
    la      $t0, str         
    li      $t1, 0           

count:
    lb      $t2, 0($t0)      
    beq     $t2, 0, end
    addi    $t1, $t1, 1      
    addi    $t0, $t0, 1      
    j       count       

end:
    li      $v0, 4           
    la      $a0, msg         
    syscall                  

    li      $v0, 1           
    move    $a0, $t1         
    syscall                  

    li      $v0, 10          
    syscall