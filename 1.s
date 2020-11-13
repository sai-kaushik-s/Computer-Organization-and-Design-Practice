ldr r0,=FileName
mov r1,#0
swi 0x66
ldr r1,=FileHandle
str r0,[r1]

ldr r0,=FileHandle
ldr r0,[r0]
ldr r1,=string_1
mov r2,#50
swi 0x6a

ldr r0,=FileHandle
ldr r0,[r0]
ldr r1,=string_2
mov r2,#50
swi 0x6a

mov r4,#0			; r4 ... length of string 1
mov r5,#0			; r5 ... length of string 2
ldr r0,=string_1		; r0 ... address of string 1
ldr r1,=string_2		; r1 ... address of string 2

Count_Loop:		
	ldrb r2,[r0],#1
	ldrb r3,[r1],#1
	
	cmp r2,#0			; string 1 eof ?
	addne r4,r4,#1			; length(string1) = length(string1) + 1
	
	cmp r3,#0			; string 2 eof ?
	addne r5,r5,#1			; length(string2) = length(string2) + 1
	
	add r2,r2,r3			
	cmp r2, #0
	bne Count_Loop

CompareLength:
	cmp r4,r5
	beq equalTo			
	bne notEqual

equalTo:					
	
	ldr r0,=string_1		;r0 ... address of string 1		
	ldr r1,=string_2		;r1 ... address of string 2

equalTo_Loop:
	
	ldrb r2,[r0],#1			;r2 = ++[r0]
	ldrb r3,[r1],#1			;r3 = ++[r1]
	
	cmp r2,r3			
	bne  notEqual
	
	cmp r2,#0			;eof string_1 and string_2
	bne equalTo_Loop		;if eof not reached

	ldr r0,=equal			;print " = "

notEqual:
	ldr r0,=strNotEqual		;print " != "
	swi 0x02

	ldr r0, =FileHandle 		;get address of file handle
	ldr r0, [r0] 			;get value at address of file handle
	swi 0x68			;close (the file handle address in r0)

	swi 0x11 			;EXIT

	string_2: .skip 100
	string_1: .skip 100
	FileHandle: .skip 4
	FileName: .asciz "test.txt"
	equal: .asciz " = "
	strNotEqual: .asciz " != "