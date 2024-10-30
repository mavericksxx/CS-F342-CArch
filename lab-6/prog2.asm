# Reverse a string stored in memory. 
# Store the reversed string in memory. 
# Also display the reversed string to the user.

    .data
string1: .asciiz "whatever"
reversed_string: .space 100
msg: .asciiz "The reversed string is: "

    .text

main:
    la      $t0, string1
    li      $s0, 0

# length of string1
length:
    lb      $t1, 0($t0)
    beq     $t1, $zero, reverse
    addi    $s0, $s0, 1
    addi    $t0, $t0, 1
    j       length

# reversing string
reverse:
    la      $t0, string1
    add     $t2, $t0, $s0
    subi    $t2, $t2, 1
    la      $t3, reversed_string

reverse_loop:
    lb      $t1, 0($t2)
    sb      $t1, 0($t3)
    subi    $t2, $t2, 1
    addi    $t3, $t3, 1
    addi    $s0, $s0, -1
    bgtz    $s0, reverse_loop

    sb      $zero, 0($t3)

# display reversed string
    li      $v0, 4
    la      $a0, msg
    syscall

    li      $v0, 4
    la      $a0, reversed_string
    syscall

    li      $v0, 10
    syscall