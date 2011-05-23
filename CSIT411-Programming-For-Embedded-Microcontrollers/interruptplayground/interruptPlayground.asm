	radix hex
	include "P16F690.INC"
	__config _CP_OFF & _WDT_OFF & _BOR_ON & _PWRTE_ON & _INTOSCIO & _MCLRE_OFF
	errorlevel -302
	org 0
	GOTO MAIN

    org 4                  ;interrupt code must be at program memory location 4
    GOTO ISR

count equ 20
count2 equ 21
count3 equ 22
count4 equ 23
count5 equ 24
count6 equ 25

MAIN
	CALL INITIAL

LOOP     
	GOTO LOOP       ;note: main program loop is empty!

ISR
	btfsc INTCON,T0IF
    GOTO TIMER
    btfsc INTCON,INTF
    GOTO BUTTON
    retfie

TIMER
	bcf INTCON,T0IF 
	decfsz count,f
	retfie 
	movlw 1
	movwf count
	call GREEN1OFF
	call YELLOW1ON
	decfsz count2, f
	retfie
	movlw 1
	movwf count2
	call YELLOW1OFF
	call RED1ON
	decfsz count3, f
	retfie
	movlw 1
	movwf count3
	call GREEN2ON
	call RED2OFF
	decfsz count4, f
	retfie
	movlw 1
	movwf count4
	call GREEN2OFF
	call YELLOW2ON
	decfsz count5, f
	retfie
	movlw 1
	movwf count5
	call YELLOW2OFF
	call RED2ON
	decfsz count6
	retfie
	movlw 1
	movwf count6
	call RED1OFF
	call GREEN1ON
	call RESETCOUNT
    retfie

BUTTON
	bcf INTCON, INTF
	movlw 40
	movwf count3
	movlw 40
	movwf count6
	retfie

RESETCOUNT
	movlw 24
	movwf count
	movlw 16
	movwf count2
	movlw 8 
	movwf count3
	movlw 24
	movwf count4
	movlw 16
	movwf count5
	movlw 8
	movwf count6
	return

INITIAL
	bsf STATUS, RP1
    clrf ANSEL
    clrf ANSELH
    bcf STATUS, RP1
    bsf STATUS, RP0
    movlw B'00000000'
    movwf TRISC
    movlw B'00000111'    ;prescaler set to 256 to 1
    movwf OPTION_REG
    bcf STATUS, RP0
    bsf INTCON, T0IE    ;set timer0 interrupt on
	bsf INTCON, INTE   ;set external interrupt on
    bsf INTCON, GIE    ; turn global interrupts on
	call RESETCOUNT
	call GREEN1ON
	call RED2ON
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