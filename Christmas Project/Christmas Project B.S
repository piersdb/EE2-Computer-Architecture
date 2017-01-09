				;ldr		r0,=0x3f000000
				;ldr		r1,=0x1
				
				;LDR		r1,=0x25796a49
				;LDR		r0,=0x14406108
				;ldr		r0,=0x505f0e ; Input A
				;ldr		r1,=0xbe8d61d4 ; Input B
				
				bl		IEEE754MULT
				end
				
IEEE754MULT		
				stmed R13!,{r3-r12}
				mov r2,#0
				mov r3,#0
				mov r4,#0
				mov r5,#0
				mov r6,#0
				mov r7,#0
				mov r8,#0
				mov r9,#0
				mov r10,#0
				mov r11,#0
				mov r12,#0
				
				;		r3 is sign bit
				and		r3,r0,#0x80000000
				and		r4,r1,#0x80000000
				eor		r3,r3,r4
				;		r4 is r0 exponent
				mov		r4,r0 ;
				BIC		r4,r4,#0x80000000
				lsr		r4,r4,#23
				
				;		r5 is r1 exponent
				mov		r5,r1 ;
				BIC		r5,r5,#0x80000000
				lsr		r5,r5,#23
				
				
				
				;r6		is matissa of r0
				lsl		r6,r0,#9
				lsr		r6,r6,#9
				
				;		r0 normalised check
				cmp		r4,#0
				orrne	r6,r6,#0x00800000
				moveq	r4,#2
				moveq	r12,#1
				;lsleq	r6,r6,#1
				
				;r7		is matissa of r1
				lsl		r7,r1,#9
				lsr		r7,r7,#9
				
				;r7		normalised check
				cmp		r5,#0
				orrne	r7,r7,#0x00800000
				moveq	r5,#2
				moveq	r12,#1
				;lsleq	r7,r7,#1
				
				;Ontained	all components of each number------------------------------------------------------------
				
				;nan		checks
				mov		r9,r0,lsl #1
				cmp		r9,#0xFF000000
				movhi	r2,r0
				orrhi	r2,r2,#0x00400000
				bhi		EndRoutine
				
				mov		r9,r1,lsl #1
				cmp		r9,#0xFF000000
				movhi	r2,r1
				orrhi	r2,r2,#0x00400000
				Bhi		EndRoutine
				;		end nan checks
				
				
				;		infinity * zero checks
				cmp		r4,#255
				bne		EndInfinityA
				
				;		zero check
				mov		r9,r1, lsl #1
				cmp		r9,#0
				ldreq	r2,=0xFFC00000
				moveq	pc,lr
				
EndInfinityA		cmp		r5,#255
				bne		EndInfinityB
				mov		r9,r0, lsl #1
				cmp		r9,#0
				ldreq	r2,=0xFFC00000
				moveq	pc,lr
				
EndInfinityB ; end infinty * zero checks
				
				
				;		zero checks and infinty checks
				mov		r9,r0, lsl #1
				cmp		r9,#0
				moveq	r2,r3
				moveq	pc,lr
				cmp		r9,#0xff000000
				beq		ReturnInfinity
				
				
				
				mov		r9,r1, lsl #1
				cmp		r9,#0
				moveq	r2,r3
				moveq	pc,lr
				cmp		r9,#0xff000000
				beq		ReturnInfinity
				
				;		end zero checks
				
				
				;add		exponents and remove 127. r4 is the exponent of result
				sub		r4,r4,#127
				add		r4,r4,r5
				
				;		check if number is over infinity
				cmp		r4,#255
				beq		ReturnInfinity
				
				;		check if the number is less than the minimum
				cmp		r4,#-24
				movle	r2,r3
				movle	pc,lr
				
				
				stmed	SP!,{r0,r1,r2,r3,LR}
				;		move registers into r0 and r1 to prepare for MUL24X24
				mov		r0,r6
				mov		r1,r7
				bl		MUL24X24
				
				;r8		Setup looping
				mov		r9,#0
				mov		r10,r3
				mov		r11,r2
				
				
				
				
				
LOOPCounterA		lsl		r10,r10,#1
				lsls		r11,r11,#1
				addcs	r10,r10,#1
				
				tst		r10,#0x80000000
				add		r9,r9,#1
				beq		LOOPCounterA
				
				
				
				
				
				
				
				
				;shift	exponent correction
				sub		r9,r9,#16
				cmp		r9,r4
				addeq	r4,r4,#1
				
				sub		r4,r4,r9
				beq		EndDenormalised
				
				
				
				;		denormalised handling
				cmp		r4,#0
				addgt	r4,r4,#1
				subgt	r4,r4,r12
				bgt		EndDenormalised
				
				tst		r3,#0x00008000
				subne	r4,r4,#1
				
				rsb		r3,r4,#0
				sub		r3,r3,#1
				lsr		r10,r10,r3
				lsr		r10,r10,r9
				mov		r4,#0
				b		EndDenormalised
				;lsreq	r10,r10,#1
				
				
				;For		debugging
				mov		r12,r4
				
				
				mov		r4,#0
				beq		EndDenormalised
				sub		r3,r3,r9
				;add		r3,r3,#1
				lsr		r10,r10,r3
				;sub		r9,r9,r3
				
				
				;For		debugging
				
				mov		r5, r3
				
				
EndDenormalised
				
				
				;reset	the carry flag
				mov		r1,#5
				mov		r0,#6
				cmp		r1,r0
				
				
				;		rounding correction
				tst		r10,#0x80
				addsne	r10,r10,#0x100
				addcs	r4,r4,#1
				
				lsl		r10,r10,#1
				lsr		r10,r10,#9
				
				
				
				
				
EndLoop
				ldmed	SP!,{r0,r1,r2,r3,LR}
				
				;sub		r4,r4,r9
				;		putting float number together
				mov		r2,r3
				orr		r2,r2,r4,lsl #23
				orr		r2,r2,r10
				
				;		check if number is over infinity
				cmp		r4,#255
				bge		ReturnInfinity
				
				
				
EndRoutine		
				ldmed R13!,{r3-r12}
				mov		pc,LR
				
				
ReturnInfinity
				
				ldr		r2,=0x7f800000
				eor		r2,r2,r3
				ldmed R13!,{r3-r12}
				mov		pc,lr
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				;--------------------------------------------------------------------------------------------------------
				
MUL24X24
				stmed	SP!,{r7-r12}
				mov		r7,#0 ; Counter
				mov		r12,#1 ; bitmask
				mov		r3,#0 ; output Top
				mov		r2,#0 ; output bottom
				
				mov		r8,#0 ; tempory Big
				mov		r9,#0 ; bitmask big
				mov		r10,#0 ;temp Medium
				mov		r11,#0 ; bitmask Big
LOOP
				;Medium
				lsl		r11,r12,#8
				TST		r11,r1
				addne	r10,r10,r0,lsl r7
				;Big
				lsl		r9,r12,#16
				TST		r9,r1
				addne	r8,r8,r0,lsl r7
				;Small
				TST		r12,r1
				addne	r2,r2,r0,lsl r7
				
				
				add		r7,r7,#1
				lsl		r12,r12,#1
				
				;Medium
				lsl		r11,r12,#8
				TST		r11,r1
				addne	r10,r10,r0,lsl r7
				;Big
				lsl		r9,r12,#16
				TST		r9,r1
				addne	r8,r8,r0,lsl r7
				;Small
				TST		r12,r1
				addne	r2,r2,r0,lsl r7
				
				
				add		r7,r7,#1
				lsl		r12,r12,#1
				
				
				cmp		r7,#7
				ble		LOOP
				
				
				;Medium
				
				
				adds		r2,r2,r10, lsl #8 ; bottom 24 bits
				adc		r3,r3,r10,lsr #24 ; Top 8 bits
				
				
				adds		r2,r2,r8, lsl #16
				adc		r3,r3,r8,lsr #16
				
				
				
				
				
				
				LDmed	SP!,{r7-r12}
				
				
				mov		PC,LR
