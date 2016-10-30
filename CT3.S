			
			;ldr		r1,=5
			
			
			
			mov		r4,r1
			cmp		r1,#1
			beq		OneCase
			;		r1 is input
			;r0		is output
			mov		r2,r1
			sub		r2,r2,#2
DecendLoop	mov		r3,r2
			mov		r0,#0
MulLoop		CMP		r3,#1
			Blt		loopend
			sub		r3,r3,#1
			add		r0,r0,r1
			b		MulLoop
loopend		mov		r1,r0
			sub		r2,r2,#2
			cmp		r2,#1
			Bgt		DecendLoop
			b		Check
			
OneCase		mvn		r0,#0
			b		endd
			
			
			
			
Check		and		r4,r4,#2
			cmp		r4,#2
			beq		endd
			rsb		r0,r0,#0
endd			end
