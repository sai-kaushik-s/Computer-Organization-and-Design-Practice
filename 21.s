ldr r0, =FileName
mov r1, #0
swi 0X66		 
ldr r1, =FileHandle   
str r0, [r1]
ldr r1, =CharArray
mov r2, #80
swi 0x6a
swi 0x68
ldr R0, =CharArray
swi 0x02
swi 0x11

FileHandle: .word 0
FileName:	.asciz "test.txt"
CharArray:	.skip 80