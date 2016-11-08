		ldr		r1,=3
		
		;		r0 decimal input
		;		r1 signed input
		tst		r1,#1
		addne	r0,r0,#0x80000000
		
		
		mov		r2,r1,lsr #31
		adds		r1,r1,r1,lsl #2
		rrx		r1,r1
		cmp		r2,#1
		subeq	r1,r1,#1
