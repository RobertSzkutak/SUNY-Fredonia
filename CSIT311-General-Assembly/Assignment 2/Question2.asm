; Written by Robert Szkutak

; Store the sum of an array in eax

INCLUDE Irvine32.inc

.data
array DWORD 10h,20h,30h,40h,11h,12h,16h,14h,18h,22h,96h,44h,89h
      DWORD 17h,94h,27h,16h,82h,33h,15h,21h,77h,73h,02h,12h,09h
arrayLen  = ($ - array) /4 ; Length of the array

.code
main PROC
	mov eax, 0 ; Holds the sum of the array
	mov esi, 0 ; Holds the array
	mov ecx, arrayLen ; Set our counter to the size of the array
	mov esi, OFFSET array

l1:
	add eax, [esi]
	add esi, 4

	dec ecx ; Decrememnt counter

	loop l1

	call DumpRegs ; Display register contents

exit
main ENDP
END main