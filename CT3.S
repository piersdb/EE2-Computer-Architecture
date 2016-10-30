		
		
		
		
		mov		r0,r1
		mov		r2,r1
MainLoop	sub		r2,r2,#2
		cmp		r2,#1
		ble		Check
		mov		r3,r2
		mov		r4,r0
InnerLoop	add		r0,r0,r4
		sub		r3,r3,#1
		cmp		r3,#1
		bgt		InnerLoop
		b		MainLoop
		
		
Check	and		r1,r1,#2
		cmp		r1,#2
		beq		endd
		rsb		r0,r0,#0
endd		end
