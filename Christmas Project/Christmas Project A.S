		LDR		r0,=0xFFFFFF
		LDR		r1,=0xFF
		
		bl		MUL24X24
		end
		
		
		
MUL24X24
		mov		r2,#0
		mov		r3,#1
		mov		r4,#0
		mov		r5,#0
		mov		r6,#0
		mov		r7,#7
		mov		r8,#0
		mov		r9,#0
		mov		r10,#0
		mov		r11,#0
LOOP
		;Medium
		lsl		r11,r3,#8
		TST		r11,r1
		addne	r10,r10,r0,lsl r2
		;Big
		lsl		r9,r3,#16
		TST		r9,r1
		addne	r8,r8,r0,lsl r2
		;Small
		TST		r3,r1
		addne	r6,r6,r0,lsl r2
		
		
		add		r2,r2,#1
		lsl		r3,r3,#1
		
		cmp		r2,r7
		ble		LOOP
		
		; SMALL
		mov r5,r6

		;Medium
		

		adds r5,r5,r10, lsl #8 ; bottom 24 bits
		addcs r4,r4,r10,lsr #24 ; Top 8 bits
		
		
		adds r5,r5,r8, lsl #16
		adc r4,r4,r8,lsr #16
		
		
		
		
		
		
		
		
		
		
		mov		PC,LR
