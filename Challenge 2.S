		
		;LDR		R2, =0b1001
		;ldr		r1,=0b0110
		
		
		
		;Load	Mask
		mov		r10,#0xAA
		add		r10,r10,#0xAA00
		add		r10,r10,r10,lsl #16
		
		
		;01+01	->01+10
		
		
		
		
		
		
		;		R8 = a and b
		and		r8,r1,r2
		
		;SpecialA	Case 10 +10 -> 10 + 11 Part 2 Lower
		and		r11,r8,r10
		
		
		;SpecialB	01+01 ->11
		and		r7, r8,r10,lsr #1
		
		
		
		
		
		;		10 -> 11
		and		r3,r1,r10
		and		r4,r2,r10
		
		orr		r1,r1,r3,lsr #1
		orr		r2,r2,r4,lsr #1
		
		;SpecialB	Part 2
		add		r1,r1,r7
		
		
		;01+01	->01+10
		;bic		r6,r1,r1,lsr #1
		;bic		r7,r2,r2,lsr #1
		;and		r6,r6,r7
		;and		r6,r6,r10, lsr #1
		;add		r1,r1,r6
		
		
		add		r0,r1,r2
		
		
		;SpecialA	Part 2
		sub		r0,r0,r11, lsr #1
		
		;		11->10
		and		r9,r0,r10
		bic		r0,r0,r9,lsr #1
		
		
