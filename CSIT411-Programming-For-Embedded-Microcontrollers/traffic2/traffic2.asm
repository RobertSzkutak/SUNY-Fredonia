	radix hex
	include "P16F690.INC"
	__config _CP_OFF & _WDT_OFF & _BOR_ON & _PWRTE_ON & _INTOSCIO & _MCLRE_OFF
	errorlevel -302
	org 0
	goto INITIAL
	org 4
	goto ISR
count   equ  20
count2  equ  21
count3  equ  22
count4  equ  23
count5  equ  24
count6  equ  25

MAIN
	goto MAIN

ISR
	btfsc INTCON,T0IF
	goto TIMER
	btfsc INTCON,INTF
	goto BUTTON
	retfie

TIMER
	bcf INTCON, T0IF
	btfsc count, 0
	call CHANGE1
	call GREEN1OFF
	call YELLOW1ON
	btfsc count2, 0
	call CHANGE2
	call YELLOW1OFF
	call RED1ON
	btfsc count3, 0
	call CHANGE3
	call CROSSOFF
	call RED2OFF
	call GREEN2ON
	call CROSS1RESET
	btfsc count4, 0
	call CHANGE4
	call GREEN2OFF
	call YELLOW2ON
	btfsc count5, 0
	call CHANGE5
	call YELLOW2OFF
	call RED2ON
	btfsc count6,0
	call CHANGE6
	call CROSSOFF
	call RED1OFF
	call GREEN1ON
	call CROSS2RESET
	retfie

CHANGE1
	decfsz count,f
	retfie
	return

CHANGE2
	decfsz count2,f
	retfie
	return

CHANGE3
	decfsz count3,f
	retfie
	return

CHANGE4
	decfsz count4,f
	retfie
	return

CHANGE5
	decfsz count5,f
	retfie
	return

CHANGE6
	decfsz count6,f
	retfie
	return

BUTTON
	bcf INTCON, INTF
	call CROSSON
	movlw h'FFFF'
	movwf count3
	movlw 5
	movwf count6
	retfie

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
    movlw b'10000111';Interrupt stuff
    movwf OPTION_REG;Interrupt stuff
	BCF STATUS,RP0 ;Bank 0
	bsf INTCON, T0IE
	bsf INTCON, INTE      ;turn on external interrupt
    bsf INTCON, GIE
	call RED1OFF
	call RED2ON
	call GREEN1ON
	call GREEN2OFF
	call YELLOW1OFF
	call YELLOW2OFF
	call CROSSOFF
	call CROSS1RESET
	call CROSS2RESET
	goto MAIN

CROSS1RESET
	movlw 3
	movwf count
	movlw 2
	movwf count2
	movlw 1
	movwf count3
	return

CROSS2RESET
	movlw 3
	movwf count4
	movlw 2
	movwf count5
	movlw 1
	movwf count6
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

	end