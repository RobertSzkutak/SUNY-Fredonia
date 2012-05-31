; Written By Robert Szkutak

; This program reverses a DWORD integer array

INCLUDE Irvine32.inc

.data
anArray DWORD 10h,20h,30h,40h

.code
main PROC

; Push the array onto the stack.

	mov	ecx, LENGTHOF anArray
	mov	esi,0

L1:	mov eax,anArray[esi]	; get integer
	push	eax				; push on stack
	call DumpRegs ; Used for debugging eax
	add esi, LENGTHOF anArray
	loop L1

; Pop the array from the stack, in reverse

	mov	ecx, LENGTHOF anArray
	mov	esi,0

L2:	pop eax				; get integer
	mov	anArray[esi],eax		; store in array
	add esi, LENGTHOF anArray
	loop L2

; Display the array element by element
    mov esi, 0
    mov ecx, LENGTHOF anArray
L3:
	mov  eax, anArray[esi]
	call Writeint
	add esi, LENGTHOF anArray
	loop L3

	exit
main ENDP
END main