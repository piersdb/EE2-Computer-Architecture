INWAVE	DCD		1,1,1,2,2,2,3,3, 3, 4,4, 4,5,5,5,6
OUTWAVE	FILL		14*4
		
		
		
		bl		WAVE
		End
		
		
		
		
		
WAVE
		stmed	SP!,{r0-r6}
		adr		r0,INWAVE
		adr		r1,OUTWAVE ; Just in case outwave doesnt follow inwave
		
		mov		r6,#0
LOOP
		ldmia	r0!, {r3-r5}
		sub		r0,r0,#8
		add		r2,r3,r4
		add		r2,r2,r5
		str		r2,[r1,r6,lsl #2]
		add		r6,r6,#1
		cmp		r6,#13
		ble		LOOP
		
		mov		pc,lr
