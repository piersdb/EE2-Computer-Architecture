		LDR		r1, =0b10010100110
		LDR		R2, =0b10
		
		
		
		mov		R4,#0
		mov		R5,#3
		
		
MainLoop	and		R6,R5,R1,lsr r4
		and		r7,R5,R2,lsr r4
		
		add		r8,r6,r7
		add		r8,r8,r10
		cmp		r8,#2
		addgt	r8,r8,#1
		lsr		r10,r8,#2
		subgt	r8,r8,#4
		
		add		r0,r0,r8, lsl R4
		
		add		r4,r4,#2
		cmp		r4,#15
		ble		MainLoop
