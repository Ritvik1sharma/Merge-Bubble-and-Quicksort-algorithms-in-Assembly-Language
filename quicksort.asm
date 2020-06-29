.quicksort:
		@ ADD YOUR CODE HERE
		cmp r1, r3
		beq .return
		bgt .return
		mov r5, r1     @pivot
		mov r6, r1     @i
		mov r7, r3     @j
		mul r8, r5, 4 
		add r8, r0, r8
		ld r8, [r8]   @pivot value
		@.print r8
		b .loop
		.loop:
			cmp r7, r6
			bgt .firstnum

				.firstnum:
					mul r9, r6, 4
					add r9, r0, r9
					ld r10, [r9] @numi
@					.print r6
@					.print r10
					cmp r10, r8
					bgt .secnum 
					cmp r6, r3
					bgt .secnum
					beq .secnum
					add r6, r6, 1
					b .firstnum
				
				.secnum:

					mul r11, r7, 4
					add r11, r0, r11
					ld r12, [r11] @numj
@					.print r7
@					.print r12
					cmp r12, r8
					bgt .subj
					b .afterloop

				.subj:
					sub r7, r7, 1
					b .secnum

				.afterloop:
					@.print r10
					@.print r12
					cmp r7, r6
					bgt .replace
					b .buf1
					
.buf1:
	cmp r7, r6
	bgt .firstnum
	b .lswitch



.replace:
	st r10 , [r11]
	st r12, [r9]
	@.print r10
	@.print r12
	b .buf1

.lswitch:
		mul r5, r5, 4
		add r5, r5, r0
		st r12, [r5]
		st r8, [r11]
		sub sp, sp, 8
		st ra, [sp]
		st r3, 4[sp]
		sub r3, r7, 1
		call .quicksort
		ld r3, 4[sp]
		st r1, 4[sp]
		add r1, r7, 1
		call .quicksort		
		ld r1, 4[sp]
		ld ra, [sp]
		add sp, sp, 8
		ret

.return:
	ret

 .main:

	@ Loading the values as an array into the registers
	mov r0, 0    
	mov r1, 12 @ replace 12 with the number to be sorted
	st r1, 0[r0]
	mov r1, 7	@ replace 7 with the number to be sorted
	st r1, 4[r0]
	mov r1, 11  @ replace 11 with the number to be sorted
	st r1, 8[r0]
	mov r1, 9   @ replace 9 with the number to be sorted
	st r1, 12[r0]
	mov r1, 3   @ replace 3 with the number to be sorted
	st r1, 16[r0]
	mov r1, 15  @ replace 15 with the number to be sorted
	st r1, 20[r0]
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0          @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 5	@ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
	mul r3, r3, 4		
	add r4, r2, r3
	
	
 	@ ADD YOUR CODE HERE 
 	mov r1, 0
 	mov r2, 0
 	div r3, r3, 4 
	call .quicksort

 	@ ADD YOUR CODE HERE

	@ Print statements for the result
	ld r1, 0[r0]
	.print r1
	ld r1, 4[r0]
	.print r1
	ld r1, 8[r0]
	.print r1
	ld r1, 12[r0]
	.print r1
	ld r1, 16[r0]
	.print r1
	ld r1, 20[r0]
	.print r1
	
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

