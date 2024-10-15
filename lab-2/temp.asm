sum of digits of number
eg N = 345

if N == 0 then exit out of the loop

loop:
    beq N, 0, exit_loop
    divu N, N, 10
    mfhi $t1
    add sum, sum, $t1
    mflo N 
    j loop