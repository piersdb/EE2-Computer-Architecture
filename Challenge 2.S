		LDR		r1, =0b0010
		LDR		R2, =0b0010
		
		
		
		
		ADD		R3,R2,R1
		
		MOV		R5,#1
		MOV		R6,#2
		Mov		R4,#0
		
MainLoop	AND		R7,R3,R5,LSL R4
		AND		R8,R3,R6,LSL R4
		AND		R9,R7,R8,lSR #1
		CMP		R9,#0
		BEQ		SkipAdd
		
		ADD		R3,R3,R5,LSL R4
		
SkipAdd	Add		R4,R4,#2
		CMPHI	R3,R5,LSL R4
		BLT		Endd
		CMP		R4,#32
		Ble		MainLoop
Endd		End
