# 3 inputs from user
# start, step, stop
# keep decrementing step from start until it reaches stop

.data
    prompt_start: .asciiz "Enter the start value: "
    prompt_step:  .asciiz "Enter the step value: "
    prompt_stop:  .asciiz "Enter the stop value: "

.text

main:
    # Prompt for start value
    li $v0, 4                  # Syscall for printing a string
    la $a0, prompt_start        # Load prompt for start value
    syscall                     # Print prompt

    li $v0, 5                  # Syscall for reading an integer
    syscall                     # Get the user input
    move $t0, $v0               # Move start value into $t0

    # Prompt for step value
    li $v0, 4                  # Syscall for printing a string
    la $a0, prompt_step         # Load prompt for step value
    syscall                     # Print prompt

    li $v0, 5                  # Syscall for reading an integer
    syscall                     # Get the user input
    move $t1, $v0               # Move step value into $t1

    # Prompt for stop value
    li $v0, 4                  # Syscall for printing a string
    la $a0, prompt_stop         # Load prompt for stop value
    syscall                     # Print prompt

    li $v0, 5                  # Syscall for reading an integer
    syscall                     # Get the user input
    move $t2, $v0               # Move stop value into $t2

decrement_loop:
    blt $t0, $t2, end_loop      # If start < stop, exit the loop

    # Print current value (start)
    li $v0, 1                  # Syscall for printing integer
    move $a0, $t0              # Move current start value into $a0
    syscall                     # Print start value

    # Decrement start by step
    sub $t0, $t0, $t1           # t0 = t0 - t1 (decrement start by step)
    
    j decrement_loop            # Repeat the loop

end_loop:
    # Exit the program
    li $v0, 10                 # Syscall for program exit
    syscall
