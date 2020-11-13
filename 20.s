ldr r0, =FileName
mov r1, #1
swi 0X66
ldr r1, =FileName
swi 0x69
swi 0x68
swi 0x11
FileName:	.asciz "test.txt"