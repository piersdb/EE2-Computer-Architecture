		
		add		R10,R4,#1 ;R10 := -(R4+1)
		mvn		R10,R10
		add		R10,R10,#1
		
		
		add		R1,R1,#1 ;R1:= -(R1+1)
		mvn		R1,R1
		add		R1,R1,#1
		
		
		mov		R2,#0 ;R2 := 0
		mov		R3,#0x3A ;R3 := hexadecimal 3A
		
		
		mov		R0,R1 ;Par		{ R0 := R1 ; R1 := R2 ; R2 := R0 ; R11 := R11 }
		mov		R1,R2
		mov		R2,R0