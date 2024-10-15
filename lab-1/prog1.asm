.data
msg: .asciiz "Hello"

.text

main:
li $v0, 4     #syscall 4 (print_string)
la $a0, msg   # argument: string
syscall       # print the string

li $v0, 10
syscall
