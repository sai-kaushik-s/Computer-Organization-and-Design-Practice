led:
	mov r0, #right;
	swi 0x201;
	mov r3, pc;
	b ltimer;
	mov r0, #left;
	swi 0x201;
	mov r3, pc;
	b ltimer;
	b led;
	swi 0x11;

stimer:
	mov r0, #x;
	loop:
		adds r0, r0, #1;
		bmi loop;
	mov pc, r2;

ltimer:
	mov r1, #y;
	loop1:
		mov r2, pc;
		b stimer;
		adds r1, r1, #1;
		bmi loop1;
	mov pc, r3;

.equ x, -250;
.equ y, -256;
.equ left, 2;
.equ right, 1;