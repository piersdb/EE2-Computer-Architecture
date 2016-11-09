		ldr		r1,=-201
		
		;		r0 decimal input
		;		r1 signed input
		mov		r3,r1, lsr #31
		
		mov		r0,r1,lsl #31
		
		
		;mov		r2,r1,lsr #31
		adds		r1,r1,r1,lsl #2
		rrx		r1,r1
		
		
		eors		r3,r3,r1, lsr #31
		movne	r2,#1
		
		;cmp		r2,#1
		;subeq	r1,r1,#1
