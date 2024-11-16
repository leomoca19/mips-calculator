# data segment
.data
.align 0
str:
   .asciiz "Eden Burton's answer is = "

.text
.align 2
.globl main
.ent main

main:
   li  $v0, 4
   la  $a0, str
   syscall

   li	$v0, 1
   li	$a0, 6
   syscall

   li $v0, 10
   syscall 

.end main
