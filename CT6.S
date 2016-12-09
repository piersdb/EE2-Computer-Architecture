INWAVE	DCD		0x7FFFFFFF,3,-5,5,0x7FFFFFFF,-5,-5,3, 3, 4,4, 4,5,5,5,6
OUTWAVE	FILL		14*4
		
		mov		r4,#12
		mov		r7,#15
		
		bl		WAVE
		End
		
		
		
		
		
WAVE
		stmed	SP!,{r4-r7}
		adr		r7,INWAVE
		adr		r1,OUTWAVE ; Just in case outwave doesnt follow inwave
		mov		r0,#0
		mov		r6,#0
LOOP
		ldmia	r7!, {r3-r5}
		sub		r7,r7,#8
		adds		r2,r3,r4
		addvs	r0,r0,#1
		adds		r2,r2,r5
		eorvs	r0,r0,#1
		str		r2,[r1,r6,lsl #2]
		add		r6,r6,#1
		cmp		r6,#13
		lsl		r0,r0,#1
		ble		LOOP
		ldmed	SP!,{r4-r7}
		cmp		r0,#0
		moveq	r0,#0
		movne	r0,#1
		
		
		mov		pc,lr
