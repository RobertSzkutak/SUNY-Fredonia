	radix hex
	include "P16F690.INC"
	__config _CP_OFF & _WDT_OFF & _BOR_ON & _PWRTE_ON & _INTOSCIO & _MCLRE_OFF
	errorlevel -302
	org 0

count   equ  20
count2  equ  21

	call INITIAL

MAIN
    bsf PORTC, 5
    bcf PORTC, 4
    call DELAY
    bsf PORTC, 4
    bcf PORTC, 3
    call DELAY
    bsf PORTC, 3
	bcf PORTC, 2
	call DELAY
	bsf PORTC, 2
	bcf TRISC, 1
	call DELAY
	bsf PORTC, 1
	bcf PORTC, 0
	call DELAY
	bsf PORTC, 0
	bcf PORTC, 1
	call DELAY
	bsf PORTC, 1
	bcf PORTC, 2
	call DELAY
	bsf PORTC, 2
	bcf PORTC, 3
	call DELAY
	bsf PORTC, 3
	bcf PORTC, 4
	call DELAY
	bsf PORTC, 4
	bcf PORTC, 5
	call DELAY
    goto MAIN

INITIAL
	bcf STATUS,RP0 
	bcf STATUS,RP1 
	clrf TRISC 
	bsf STATUS,RP1 
	clrf ANSEL 
    clrf ANSELH
	bsf STATUS,RP0 
	bcf STATUS,RP1 
	movlw b'00000000'
	movwf TRISC 
	bcf STATUS,RP0
	return

DELAY
    movlw  0xFF
    movwf  count
    movwf  count2
DELAYLOOP
    decfsz count, f
    goto   DELAYLOOP
    decfsz count2, f
    goto   DELAYLOOP
	return

	end