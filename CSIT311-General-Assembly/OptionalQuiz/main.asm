;Written by Robert Szkutak

;Gets input and then calculates (A)(X^2) + (B)(X) + (C) 
;Result stored in EAX
;Result displayed with DumpRegs

INCLUDE Irvine32.inc
.data
geta BYTE "Please enter a value for a",0
getb BYTE "Please enter a value for b",0
getc BYTE "Please enter a value for c",0
getx BYTE "Please enter a value for x",0

aval DWORD ?
bval DWORD ?
cval DWORD ?
xval DWORD ?

.code
main PROC
	call Clrscr  

	;Get a
	mov	 edx,offset geta
	call WriteString
	call ReadInt
	mov aval, eax

	;Get b
	mov	 edx,offset getb
	call WriteString
	call ReadInt
	mov bval, eax

	;Get c
	mov	 edx,offset getc
	call WriteString
	call ReadInt
	mov cval, eax

	;Get x
	mov	 edx,offset getx
	call WriteString
	call ReadInt
	mov xval, eax

	mov eax, 0
	mov ecx, xval
L1:
    add eax, xval
	dec ecx
	loop L1

    ;EAX NOW HOLDS X^2

	mov ecx, eax
L2:
    add eax, aval
	dec ecx
	loop L2

	;EAX NOW HOLDS (A)(X^2)

	mov ebx, 0
	mov ecx, xval
L3:
    add ebx, bval
	dec ecx
	loop L3

	;EBX NOW HOLDS (B)(X)

	add eax, ebx

	;EAX NOW HOLDS (A)(X^2) + (B)(X)

	add eax, cval

	;EAX NOW HOLDS (A)(X^2) + (B)(X) + (C)

	call DumpRegs
	exit
main ENDP

END main