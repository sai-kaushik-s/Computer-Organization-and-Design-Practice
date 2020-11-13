segment:
	mov r0, #zero;
	swi 0x200;
	mov r3, pc;
	b ltimer;
	mov r0, #one;
	swi 0x200;
	mov r3, pc;
	b ltimer;
	mov r0, #two;
	swi 0x200;
	mov r3, pc;
	b ltimer;
	mov r0, #three;
	swi 0x200;
	mov r3, pc;
	b ltimer;
	mov r0, #four;
	swi 0x200;
	mov r3, pc;
	b ltimer;
	mov r0, #five;
	swi 0x200;
	mov r3, pc;
	b ltimer;
	mov r0, #six;
	swi 0x200;
	mov r3, pc;
	b ltimer;
	mov r0, #seven;
	swi 0x200;
	mov r3, pc;
	b ltimer;
	mov r0, #eight;
	swi 0x200;
	mov r3, pc;
	b ltimer;
	mov r0, #nine;
	swi 0x200;
	mov r3, pc;
	b ltimer;

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
.equ zero, 237;
.equ one, 96;
.equ two, 206;
.equ three, 234;
.equ four, 99;
.equ five, 171;
.equ six, 175;
.equ seven, 224;
.equ eight, 239;
.equ nine, 235;
