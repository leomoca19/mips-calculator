.data
greeting: .asciiz "Hi User, Welcome to my calculator!\n"
goodbye: .asciiz "Goodbye!\n"
exit_msg: asciiz "Press enter to exit<Enter>"

.text
main:
    li $v0, 4 # load print string
    la $a0, greeting # load the address of the greeting
    syscall

    la $a0, goodbye
    syscall

    # Exit the program
    li $v0, 10
    syscall