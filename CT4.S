		;ldr		r1,=0x7FFFFFFF
		
		mov		R2,#0
		
		;		This Works
		mov		r0,r1,lsl #31
		
		
		
		lslS		r3,r1,#1
		
		
		
		adds		r1,r3,R1,asr #1
		
		movmi	r2,#1
		eorcs	r2,r2,#1
