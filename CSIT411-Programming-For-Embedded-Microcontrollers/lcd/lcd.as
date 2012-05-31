opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

opt pagewidth 120

	opt lm

	processor	16F690
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 7 "C:\projects\PIC\lcd\lcd.c"
	psect config,class=CONFIG,delta=2 ;#
# 7 "C:\projects\PIC\lcd\lcd.c"
	dw 0x3FFF & 0x3CFF & 0x3FDF & 0x3FEF & 0x3FFC & 0x3FF7 ;#
	FNCALL	_main,_initLCD
	FNCALL	_main,_pulse
	FNCALL	_initLCD,_pulse
	FNROOT	_main
	global	main@F657
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\projects\PIC\lcd\lcd.c"
	line	51

;initializer for main@F657
	retlw	048h
	retlw	065h
	retlw	06Ch
	retlw	06Ch
	retlw	06Fh
	retlw	020h
	retlw	057h
	retlw	06Fh
	retlw	072h
	retlw	06Ch
	retlw	064h
	retlw	021h
	global	_PORTC
_PORTC	set	7
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_ANSEL
_ANSEL	set	286
	global	_ANSELH
_ANSELH	set	287
	file	"lcd.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\projects\PIC\lcd\lcd.c"
main@F657:
       ds      12

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+12)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_pulse
?_pulse:	; 0 bytes @ 0x0
	global	??_pulse
??_pulse:	; 0 bytes @ 0x0
	global	?_initLCD
?_initLCD:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	2
	global	??_initLCD
??_initLCD:	; 0 bytes @ 0x2
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@text
main@text:	; 12 bytes @ 0x0
	ds	12
	global	main@i
main@i:	; 1 bytes @ 0xC
	ds	1
;;Data sizes: Strings 0, constant 0, data 12, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           80     13      25
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_initLCD
;;   _initLCD->_pulse
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                17    17      0      92
;;                                              4 COMMON     4     4      0
;;                                              0 BANK0     13    13      0
;;                            _initLCD
;;                              _pulse
;; ---------------------------------------------------------------------------------
;; (1) _initLCD                                              2     2      0       0
;;                                              2 COMMON     2     2      0
;;                              _pulse
;; ---------------------------------------------------------------------------------
;; (1) _pulse                                                2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _initLCD
;;     _pulse
;;   _pulse
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               50      0       0       7        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITBANK1            50      0       0       4        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      23      10        0.0%
;;ABS                  0      0      21       8        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               50      D      19       3       31.3%
;;BITBANK0            50      0       0       9        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 47 in file "C:\projects\PIC\lcd\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  text           12    0[BANK0 ] unsigned char [12]
;;  i               1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0      13       0       0
;;      Temps:          4       0       0       0
;;      Totals:         4      13       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_initLCD
;;		_pulse
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\projects\PIC\lcd\lcd.c"
	line	47
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	51
	
l1943:	
;lcd.c: 49: char i;
;lcd.c: 51: char text[] = {'H','e','l','l','o',' ','W','o','r','l','d','!'};
	movlw	(main@text)&0ffh
	movwf	fsr0
	movlw	low(main@F657)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	12
	movwf	((??_main+0)+0+2)
u2170:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2170
	line	53
	
l1945:	
;lcd.c: 53: TRISC = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	55
	
l1947:	
;lcd.c: 55: TRISB = 0;
	clrf	(134)^080h	;volatile
	line	57
	
l1949:	
;lcd.c: 57: ANSEL = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(286)^0100h	;volatile
	line	59
	
l1951:	
;lcd.c: 59: ANSELH = 0;
	clrf	(287)^0100h	;volatile
	line	61
	
l1953:	
;lcd.c: 61: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2207:
	decfsz	((??_main+0)+0),f
	goto	u2207
	decfsz	((??_main+0)+0+1),f
	goto	u2207
opt asmopt_on

	line	63
	
l1955:	
;lcd.c: 63: initLCD();
	fcall	_initLCD
	line	65
	
l1957:	
;lcd.c: 65: for (i=0; i<12; i++){
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i)
	
l1959:	
	movlw	(0Ch)
	subwf	(main@i),w
	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l1963
u2180:
	goto	l722
	
l1961:	
	goto	l722
	
l719:	
	line	67
	
l1963:	
;lcd.c: 67: PORTC = text[i];
	movf	(main@i),w
	addlw	main@text&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(7)	;volatile
	line	69
	
l1965:	
;lcd.c: 69: pulse();
	fcall	_pulse
	line	65
	
l1967:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	
l1969:	
	movlw	(0Ch)
	subwf	(main@i),w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l1963
u2190:
	goto	l722
	
l720:	
	goto	l722
	line	73
;lcd.c: 71: }
;lcd.c: 73: while (1);
	
l721:	
	
l722:	
	goto	l722
	
l723:	
	line	75
	
l724:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_initLCD
psect	text109,local,class=CODE,delta=2
global __ptext109
__ptext109:

;; *************** function _initLCD *****************
;; Defined at:
;;		line 23 in file "C:\projects\PIC\lcd\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_pulse
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text109
	file	"C:\projects\PIC\lcd\lcd.c"
	line	23
	global	__size_of_initLCD
	__size_of_initLCD	equ	__end_of_initLCD-_initLCD
	
_initLCD:	
	opt	stack 6
; Regs used in _initLCD: [wreg+status,2+status,0+pclath+cstack]
	line	25
	
l1929:	
;lcd.c: 25: RB6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(54/8),(54)&7
	line	27
;lcd.c: 27: RB7 = 0;
	bcf	(55/8),(55)&7
	line	29
	
l1931:	
;lcd.c: 29: _delay((unsigned long)((125)*(4000000/4000.0)));
	opt asmopt_off
movlw	163
movwf	((??_initLCD+0)+0+1),f
	movlw	85
movwf	((??_initLCD+0)+0),f
u2217:
	decfsz	((??_initLCD+0)+0),f
	goto	u2217
	decfsz	((??_initLCD+0)+0+1),f
	goto	u2217
opt asmopt_on

	line	31
;lcd.c: 31: PORTC = 0x38;
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	33
	
l1933:	
;lcd.c: 33: pulse();
	fcall	_pulse
	line	35
	
l1935:	
;lcd.c: 35: PORTC = 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	37
;lcd.c: 37: pulse();
	fcall	_pulse
	line	39
	
l1937:	
;lcd.c: 39: PORTC = 1;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	41
	
l1939:	
;lcd.c: 41: pulse();
	fcall	_pulse
	line	43
	
l1941:	
;lcd.c: 43: RB7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(55/8),(55)&7
	line	45
	
l714:	
	return
	opt stack 0
GLOBAL	__end_of_initLCD
	__end_of_initLCD:
;; =============== function _initLCD ends ============

	signat	_initLCD,88
	global	_pulse
psect	text110,local,class=CODE,delta=2
global __ptext110
__ptext110:

;; *************** function _pulse *****************
;; Defined at:
;;		line 11 in file "C:\projects\PIC\lcd\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initLCD
;;		_main
;; This function uses a non-reentrant model
;;
psect	text110
	file	"C:\projects\PIC\lcd\lcd.c"
	line	11
	global	__size_of_pulse
	__size_of_pulse	equ	__end_of_pulse-_pulse
	
_pulse:	
	opt	stack 7
; Regs used in _pulse: [wreg]
	line	13
	
l1925:	
;lcd.c: 13: RB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	15
;lcd.c: 15: RB6 = 0;
	bcf	(54/8),(54)&7
	line	17
	
l1927:	
;lcd.c: 17: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_pulse+0)+0+1),f
	movlw	151
movwf	((??_pulse+0)+0),f
u2227:
	decfsz	((??_pulse+0)+0),f
	goto	u2227
	decfsz	((??_pulse+0)+0+1),f
	goto	u2227
	nop2
opt asmopt_on

	line	19
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_pulse
	__end_of_pulse:
;; =============== function _pulse ends ============

	signat	_pulse,88
psect	text111,local,class=CODE,delta=2
global __ptext111
__ptext111:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
