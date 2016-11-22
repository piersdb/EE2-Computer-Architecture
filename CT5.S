		;		r0 is input
		;		r1 is output no registers changed
		
		;ldr		r0,=0xFFFF67F6
		
		ADR		r1,JumpTable
		cmp		r0, #15
		
		ldr		r1,[r1,r0,lsl #2]
		movgt	r1,#0
		
		
		
JumpTable	DCD		85,86,89,90,101,102,105,106,149,150,153,154,165,166,169,170
