		LDR		r1,=0x800000
		LDR		r0,=9
		
		bl		MUL24X24
		end
		
		
		
MUL24X24
		mov		r3,#1
		mov		r2,#0
		mov		r4,#0
		mov		r5,#0
		mov		r6,#0
		mov		r7,#8
LOOP
		TST		r3,r1
		addne	r6,r6,r0,lsl r2
		add		r2,r2,#1
		lsl		r3,r3,#1
		cmp		r2,r7
		ble		LOOP
		addcs	r4,r4,#1
		CMP		r7,#8
		moveq	r5,r6
		moveq	r6,#0
		movne	r4,r6
		mov		r7,#16
		beq		LOOP
		
		
		
		
		
		
		
		
		
		
		mov		PC,LR
