.bubblesort:
		@ ADD YOUR CODE HERE
		@.print r3
		mov r9, 0
		sub r3, r3, 1
		.loop:
			@.print r3
	  		cmp r3, r9
	  		add r4, r3, 1
			mov r5, r3
	   		beq .return
	   		bgt .continue
	   	
	   	.buffer:
	   		add r9, r9, 1
		   	b .loop

.continue:
	sub r5, r5, 1
	sub r4, r4, 1
	sub sp, sp, 4
	st ra, [sp]
	call .bubble
	ld ra, [sp]
	add sp, sp, 4
	cmp r5, r9
	bgt .continue
	b .buffer


	
.bubble:
	mul r5, r5, 4
	mul r4, r4, 4
	add r8, r0, r4
	add r7, r0, r5 
	ld r1, [r8]
	ld r6, [r7]
	div r4, r4, 4
	div r5, r5, 4
	cmp r6, r1
	bgt .replace
	ret

.replace:
	st r6, [r8]
	st r1, [r7]
	ret

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

	mov r2, 0       @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 6	@ REPLACE 6 WITH N, where, N is the number of numbers being sorted
	
	@ ADD YOUR CODE HERE

	call .bubblesort
	
	@ ADD YOUR CODE HERE

	@ Print statements
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

