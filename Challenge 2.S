		;LDR		r1, =0b10010100110
		LDR		R2, =0b1001
		ldr		r1,=0b0110
		
		
		
		mov		r10,#0xAA
		add		r10,r10,#0xAA00
		add		r10,r10,#0xAA0000
		add		r10,r10,#0xAA000000
		
		
		and		r3,r1,r10
		and		r4,r2,r10
		lsr		r3,r3,#1
		lsr		r4,r4,#1
		orr		r1,r1,r3
		orr		r2,r2,r4
		
		add		r5,r1,r2
		
		and		r0,r5,r10
		eor		r5,r5,r0
		orr		r0,r5,r0,lsr #1
