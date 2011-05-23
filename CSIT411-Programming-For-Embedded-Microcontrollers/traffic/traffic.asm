	radix hex
	include "P16F690.INC"
	__config _CP_OFF & _WDT_OFF & _BOR_ON & _PWRTE_ON & _INTOSCIO & _MCLRE_OFF
	errorlevel -302
	org 0

count   equ  20
count2  equ  22
cross   equ  24

	call INITIAL
	call RED1OFF
	call RED2ON
	call GREEN1OFF
	call GREEN2OFF
	call YELLOW1OFF
	call YELLOW2OFF

MAIN
	call CROSSUNSET

	call RED1OFF
	call GREEN1ON
	call THREEDELAY

	call GREEN1OFF
    call YELLOW1ON
	call TWODELAY

	call YELLOW1OFF
	call RED1ON
    decfsz cross, f
	call FIVEDELAY
	call DELAY

	call CROSSUNSET

	call RED2OFF
    call GREEN2ON
	call THREEDELAY

	call GREEN2OFF
	call YELLOW2ON
	call TWODELAY

	call YELLOW2OFF
	call RED2ON
	decfsz cross, f
	call FIVEDELAY
	call DELAY

    goto MAIN

INITIAL
	bsf STATUS, RP0
	bsf TRISA, 2;Set pin two on port A as an input pin
	bcf TRISA, 5;Set pin 5 on port A to be an output pin
    bcf OPTION_REG, 7;Enable the option to use resistors
    bsf WPUA, 2;Turn on the resistor in pin 2
	BCF STATUS,RP0 ;Bank 0
	BCF STATUS,RP1 ;
	CLRF PORTC ;Init PORTC
	BSF STATUS,RP1 ;Bank 2
	CLRF ANSEL ;digital I/O
    clrf ANSELH
	BSF STATUS,RP0 ;Bank 1
	BCF STATUS,RP1 ;
	MOVLW B'00000000' ;Set all as outputs
	MOVWF TRISC 
	BCF STATUS,RP0 ;Bank 0
	return

CROSSSET
	movlw 2
	movwf cross
	call CROSSON
	return

CROSSUNSET
	movlw 1
	movwf cross
	call CROSSOFF
	return

CROSS
	call RED1ON
	call RED2ON
	call FIVEDELAY
	return

CROSSON
	bcf PORTA, 5
	return

CROSSOFF
	bsf PORTA, 5
	return

GREEN1ON
	bcf PORTC, 5;Turn on light 0
	return

GREEN1OFF
	bsf PORTC, 5;Turn off light 0
	return

YELLOW1ON
	bcf PORTC, 4;Turn on light 1
	return

YELLOW1OFF
	bsf PORTC, 4;Turn off light 1
	return

RED1ON
	bcf PORTC, 3;Turn on light 2
	return

RED1OFF
	bsf PORTC, 3;Turn off light 2
	return

GREEN2ON
	bcf PORTC, 2;Turn on light 3
	return

GREEN2OFF
	bsf PORTC, 2;Turn off light 3
	return

YELLOW2ON
	bcf PORTC, 1;Turn on light 4
	return

YELLOW2OFF
	bsf PORTC, 1;Turn off light 4
	return

RED2ON
	bcf PORTC, 0;Turn on light 5
	return

RED2OFF
	bsf PORTC, 0;Turn off light 5
	return

;Three DELAY calls is one second

ONEDELAY
	call DELAY
	btfss PORTA, 2
	call CROSSSET
	call DELAY
	btfss PORTA, 2
	call CROSSSET
	call DELAY
	btfss PORTA, 2
	call CROSSSET

	return

TWODELAY
	call ONEDELAY
	call ONEDELAY
	return

THREEDELAY
	call TWODELAY
	call ONEDELAY
	return

FIVEDELAY
	call THREEDELAY
	call TWODELAY
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