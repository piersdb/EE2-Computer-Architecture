		ldr		r1,=0x7FFDDFFF
		
		;		r0 decimal input
		;		r1 signed input
		
		mov		r0,r1,lsl #31
		
		
		add		r1,r1,r1,lsl #2
		asrs		r1,r1,#1
		
		movmi	r2,#1
		eorcs	r2,r2,#1
		
		;cmp		r2,#1
		;subeq	r1,r1,#1
