mov r0, #x;
loop:
	adds r0, r0, #1;
	bmi loop;
	swi 0x11;

.equ x, -250