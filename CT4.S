		;ldr		r1,=0x80000000
		
		
		
		;		This Works
		mov		r0,r1,lsl #31
		
		mov		r3,r1,lsl #1
		
		asr		r1,r1, #1
		
		adds		r1,r1,r3
		
		movmi	r2,#1
		eorcs	r2,r2,#1
