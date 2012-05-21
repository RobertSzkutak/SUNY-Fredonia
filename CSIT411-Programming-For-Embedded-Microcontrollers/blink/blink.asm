	radix hex
	include "P16F690.INC"
	__config _CP_OFF & _WDT_OFF & _BOR_ON & _PWRTE_ON & _INTOSCIO & _MCLRE_OFF
	errorlevel -302
	org 0

count   equ  20
count2  equ  21

	call INITIAL

MAIN
	call BLINK
    call DELAY
    goto MAIN

INITIAL
	bsf     STATUS, RP1
    clrf    ANSEL
    clrf    ANSELH
    bcf     STATUS, RP1;We're in bank 1 now
    bsf     STATUS, RP0;Move back into bank 0 from bank 1
    movlw   b'01111111'
    movwf   TRISB
    bcf     STATUS, RP0
	return

BLINK
	movlw b'10000000'
	xorwf PORTB, f
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