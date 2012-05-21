; Written by Robert Szkutak

; Print the first 8 numbers of fibonacci sequence

INCLUDE Irvine32.inc

.code
main PROC

	mov ebp, 0
	mov edx, 1

	mov ebx, edx
	mov ecx, 8 ; Counter used to make sure we only go 8 times

L1:
	mov eax, edx
	mov ebp, eax
	mov edx, ebx
	add ebx, ebp
      
	call DumpRegs ; Display register contents
        
        dec ecx ; Decrement counter

	loop L1
	exit
main ENDP
END main