ldr r0, =FileName			;loading the file name
mov r1, #0					;0 for read mode
swi 0x66					;opening the file

ldr r0, =FileHandle			;load file handle
ldr r0, [r0]				;load address of file handle
ldr r1, =string_1			;load string_1
mov r2, #50					;move maximum length of string_1
swi 0x6a					;read string_1

ldr r0, =FileHandle			;load file handle
ldr r0, [r0]				;load address of file handle
ldr r1, =string_1			;load string_2
mov r2, #50					;move maximum length of string_2
swi 0x6a					;read string_2

mov r4, #0					;initialize length of string_1
mov r5, #0					;initialize length of string_2
ldr r0, =string_1			;load string_1
ldr r1, =string_2			;load string_2
Loop:		
	ldrb r2, [r0], #1		;load character by character into r2
	ldrb r3, [r1], #1		;load character by character into r3
	cmp r2,#0				;end of string_1
	addne r4,r4,#1			;increment length_1
	cmp r3,#0				;end of string_2
	addne r5,r5,#1			;increment length_2
	add r2,r2,r3			;add the contents of r2 and r3
	cmp r2, #0				;compare if r2 = r2 + r3 is end
	bne loop 				;loop

CompareLength:
	cmp r4,r5				;compare length of string_1 and string_2
	beq equal				;if equal goto equal
	bne notequal 			;if not equal goto notequal

notequal:
	ldr r0, =NotEqual		;load "different" in r0
	swi 0x02				;print contents of r0

equal:
	ldr r0,=string_1		;load the array_1	
	ldr r1,=string_2		;load the array_2
	loop:
		ldrb r2, [r0], #1	;load character by character into r2
		ldrb r3, [r1], #1	;load character by character into r3
		cmp r2, r3			;compare contents of r2 and r3
		bne notequal        ;goto notequal
		cmp r2, #0			;eof string_1 and string_2
		bne loop			;loop
	ldr r0, =Equal			;load "same" in r0
	swi 0x02				;print contents of r0

ldr r0, =FileHandle 		;load file handle
ldr r0, [r0] 				;load address of file handle
swi 0x68					;close the file

swi 0x11					;halt

string_2:		.skip 100
string_1:		.skip 100
FileHandle:		.word 0
FileName:		.asciz "test.txt"
Equal:			.asciz "same"
NotEqual:		.asciz "different"