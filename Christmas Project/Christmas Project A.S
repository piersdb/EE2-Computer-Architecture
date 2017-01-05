MUL24X24
		stmed	SP!,{r7-r12}
		mov		r7,#0 ; Counter
		mov		r12,#1 ; bitmask
		mov		r3,#0 ; output Top
		mov		r2,#0 ; output bottom
		
		mov		r8,#0 ; tempory Big
		mov		r9,#0 ; bitmask big
		mov		r10,#0 ;temp Medium
		mov		r11,#0 ; bitmask Big
LOOP
		;Medium
		lsl		r11,r12,#8
		TST		r11,r1
		addne	r10,r10,r0,lsl r7
		;Big
		lsl		r9,r12,#16
		TST		r9,r1
		addne	r8,r8,r0,lsl r7
		;Small
		TST		r12,r1
		addne	r2,r2,r0,lsl r7
		
		
		add		r7,r7,#1
		lsl		r12,r12,#1
		
		;Medium
		lsl		r11,r12,#8
		TST		r11,r1
		addne	r10,r10,r0,lsl r7
		;Big
		lsl		r9,r12,#16
		TST		r9,r1
		addne	r8,r8,r0,lsl r7
		;Small
		TST		r12,r1
		addne	r2,r2,r0,lsl r7
		
		
		add		r7,r7,#1
		lsl		r12,r12,#1
		
		
		cmp		r7,#7
		ble		LOOP
		
		
		;Medium
		
		
		adds		r2,r2,r10, lsl #8 ; bottom 24 bits
		adc		r3,r3,r10,lsr #24 ; Top 8 bits
		
		
		adds		r2,r2,r8, lsl #16
		adc		r3,r3,r8,lsr #16
		
		
		
		
		
		
		LDmed	SP!,{r7-r12}
		
		
		mov		PC,LR
