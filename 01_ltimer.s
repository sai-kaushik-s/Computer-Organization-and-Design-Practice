ltimer:
	mov r1, #y;
	loop1:
		mov r2, pc;
		b stimer;
		adds r1, r1, #1;
		bmi loop1;
swi 0x11;

stimer:
	mov r0, #x;
	loop:
		adds r0, r0, #1;
		bmi loop;
	mov pc, r2;

.equ x, -250;
.equ y, -10;