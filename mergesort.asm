@.mergesort:
		@ ADD YOUR CODE HERE
@		cmp r8, r6 @last and first
@		bgt .mergecont
@		ret 


.mergesort:
		cmp r6, r8
		beq .return
		bgt .return
		add r7, r6, r8
		div r7, r7, 2 @setting mid
		sub sp, sp, 16
		st r6, [sp]
		st r7, 4[sp]
		st r8, 8[sp]
		st ra, 12[sp]
		mov r8, r7
		call .mergesort
		ld r6, [sp]
		ld r7, 4[sp]
		ld r8, 8[sp]
		ld ra, 12[sp]
		st r6, [sp]
		st r7, 4[sp]
		st r8, 8[sp]
		st ra, 12[sp]
		add r6, r7, 1
		call .mergesort
		ld r6, [sp]
		ld r7, 4[sp]
		ld r8, 8[sp]
		ld ra, 12[sp]
		st r6, [sp]
		st r7, 4[sp]
		st r8, 8[sp]
		st ra, 12[sp]
		call .merge
		ld r6, [sp]
		ld r7, 4[sp]
		ld r8, 8[sp]
		ld ra, 12[sp]
		add sp, sp, 16
		ret

.merge: 
	@ ADD YOUR CODE 
	mov r13, r7
	sub r1, r8, r6 
	.loop:
		.print r7
		.print r8
		cmp r6, r7
		bgt .secarr2
		cmp r13, r8
		bgt .firstarr2
		beq .firstarr2
		mul r9, r7, 4
		add r9, r9, r0
		ld r11, [r9]
		mul r10, r8, 4
		add r10, r10, r0
		ld r12, [r10]
		cmp r11, r12
		bgt .firstarr
		cmp r12, r11
		bgt .secarr



.firstarr:
		sub sp, sp, 4
		st r11, 0[sp]
		.print r11
		sub r7, r7, 1
		b .loop

.secarr:
		sub sp, sp, 4
		st r12, 0[sp]
		.print r12
		sub r8, r8, 1
		b .loop

.firstarr2:
		cmp r6, r7
		bgt .aftermerge
		mul r9, r7, 4
		add r9, r9, r0
		ld r11, [r9]
		sub sp, sp, 4
		st r11, 0[sp]
		.print r11
		sub r7, r7, 1
		b .firstarr2
		


.secarr2:
		cmp r13, r8
		beq .aftermerge
		mul r10, r8, 4
		add r10, r10, r0
		ld r12, [r10]
		sub sp, sp, 4
		st r12, 0[sp]
		.print r12
		sub r8, r8, 1
		b .secarr2
		
.aftermerge:
		cmp r1, 0
		bgt .aft1
		beq .aft1
		ret


.aft1:
		mul r7, r6, 4
		add r7, r7, r0
		ld r8, [sp]
		.print r6
		.print r7
		.print r8
		add sp, sp, 4
		st r8, [r7]
		sub r1, r1, 1
		add r6, r6, 1
		b .aftermerge


.return:
	ret



.main:

	@ Loading the values as an array into the registers
	mov r0, 0    
	mov r1, 12	@ replace 12 with the number to be sorted
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
	div r5, r3, 4
	mov r6, r0
	mov r8, r5
	mov r1, 1
	div r1, r1, 2
	.print r1
	call .mergesort

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
