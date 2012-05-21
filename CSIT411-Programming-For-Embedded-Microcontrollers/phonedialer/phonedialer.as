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
# 4 "C:\projects\PIC\phonedialer\phonedialer.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "C:\projects\PIC\phonedialer\phonedialer.c"
	dw 0x3FFF & 0x3CFF & 0x3FDF & 0x3FEF & 0x3FFC & 0x3FF7 ;#
	FNCALL	_main,_dialNumber
	FNCALL	_dialNumber,_playTone
	FNCALL	_playTone,_pulse
	FNROOT	_main
	global	_PORTC
psect	text72,local,class=CODE,delta=2
global __ptext72
__ptext72:
_PORTC	set	7
	global	_RA2
_RA2	set	42
	global	_RC2
_RC2	set	58
	global	_RC4
_RC4	set	60
	global	_RC7
_RC7	set	63
	global	_OPTION
_OPTION	set	129
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_ANSEL
_ANSEL	set	286
	global	_ANSELH
_ANSELH	set	287
	file	"phonedialer.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

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
	global	?_playTone
?_playTone:	; 0 bytes @ 0x0
	global	??_playTone
??_playTone:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_dialNumber
?_dialNumber:	; 1 bytes @ 0x0
	ds	2
	global	playTone@i
playTone@i:	; 1 bytes @ 0x2
	ds	1
	global	playTone@tone
playTone@tone:	; 1 bytes @ 0x3
	ds	1
	global	??_dialNumber
??_dialNumber:	; 0 bytes @ 0x4
	ds	1
	global	dialNumber@state
dialNumber@state:	; 1 bytes @ 0x5
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	2
	global	main@i
main@i:	; 1 bytes @ 0x8
	ds	1
	global	main@state
main@state:	; 1 bytes @ 0x9
	ds	1
	global	main@debounce
main@debounce:	; 1 bytes @ 0xA
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      11
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_dialNumber
;;   _dialNumber->_playTone
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
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0     705
;;                                              6 COMMON     5     5      0
;;                         _dialNumber
;; ---------------------------------------------------------------------------------
;; (1) _dialNumber                                           2     2      0     675
;;                                              4 COMMON     2     2      0
;;                           _playTone
;; ---------------------------------------------------------------------------------
;; (2) _playTone                                             4     4      0     540
;;                                              0 COMMON     4     4      0
;;                              _pulse
;; ---------------------------------------------------------------------------------
;; (3) _pulse                                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _dialNumber
;;     _playTone
;;       _pulse
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      B       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      0       0       3        0.0%
;;BITBANK1            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;BANK2               50      0       0       7        0.0%
;;ABS                  0      0       0       8        0.0%
;;BITBANK0            50      0       0       9        0.0%
;;DATA                 0      0       0      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 78 in file "C:\projects\PIC\phonedialer\phonedialer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  debounce        1   10[COMMON] unsigned char 
;;  state           1    9[COMMON] unsigned char 
;;  i               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_dialNumber
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\projects\PIC\phonedialer\phonedialer.c"
	line	78
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	80
	
l2050:	
;phonedialer.c: 79: char i, state, debounce;
;phonedialer.c: 80: i = state = debounce = 0;
	movlw	(0)
	movwf	(main@debounce)
	movwf	(main@state)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@i)
	line	81
	
l2052:	
;phonedialer.c: 81: ANSEL = ANSELH = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(287)^0100h	;volatile
	clrf	(286)^0100h	;volatile
	line	82
	
l2054:	
;phonedialer.c: 82: TRISC = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	83
;phonedialer.c: 83: TRISA = 0b11111111;
	movlw	(0FFh)
	movwf	(133)^080h	;volatile
	line	84
	
l2056:	
;phonedialer.c: 84: OPTION = 0;
	clrf	(129)^080h	;volatile
	line	85
	
l2058:	
;phonedialer.c: 85: PORTC = 0b10000100;
	movlw	(084h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	86
	
l2060:	
;phonedialer.c: 86: _delay((unsigned long)((10)*(4000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_main+0)+0+1),f
	movlw	251
movwf	((??_main+0)+0),f
u2617:
	decfsz	((??_main+0)+0),f
	goto	u2617
	decfsz	((??_main+0)+0+1),f
	goto	u2617
	nop2
opt asmopt_on

	line	87
	
l2062:	
;phonedialer.c: 87: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	88
	
l2064:	
;phonedialer.c: 88: _delay((unsigned long)((10)*(4000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_main+0)+0+1),f
	movlw	251
movwf	((??_main+0)+0),f
u2627:
	decfsz	((??_main+0)+0),f
	goto	u2627
	decfsz	((??_main+0)+0+1),f
	goto	u2627
	nop2
opt asmopt_on

	goto	l2066
	line	90
;phonedialer.c: 90: while(1){
	
l752:	
	line	91
	
l2066:	
;phonedialer.c: 91: if(RA2 == 0 && debounce == 1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u2581
	goto	u2580
u2581:
	goto	l2074
u2580:
	
l2068:	
	movf	(main@debounce),w
	xorlw	01h
	skipz
	goto	u2591
	goto	u2590
u2591:
	goto	l2074
u2590:
	line	92
	
l2070:	
;phonedialer.c: 92: state = dialNumber(state);
	movf	(main@state),w
	fcall	_dialNumber
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@state)
	line	93
	
l2072:	
;phonedialer.c: 93: debounce = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@debounce)
	goto	l2074
	line	94
	
l753:	
	line	95
	
l2074:	
;phonedialer.c: 94: }
;phonedialer.c: 95: if(RA2 == 1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7
	goto	u2601
	goto	u2600
u2601:
	goto	l2066
u2600:
	line	96
	
l2076:	
;phonedialer.c: 96: debounce = 1;
	clrf	(main@debounce)
	bsf	status,0
	rlf	(main@debounce),f
	goto	l2066
	line	97
	
l754:	
	goto	l2066
	line	98
	
l755:	
	line	90
	goto	l2066
	
l756:	
	line	99
	
l757:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_dialNumber
psect	text73,local,class=CODE,delta=2
global __ptext73
__ptext73:

;; *************** function _dialNumber *****************
;; Defined at:
;;		line 50 in file "C:\projects\PIC\phonedialer\phonedialer.c"
;; Parameters:    Size  Location     Type
;;  state           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  state           1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_playTone
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text73
	file	"C:\projects\PIC\phonedialer\phonedialer.c"
	line	50
	global	__size_of_dialNumber
	__size_of_dialNumber	equ	__end_of_dialNumber-_dialNumber
	
_dialNumber:	
	opt	stack 5
; Regs used in _dialNumber: [wreg+status,2+status,0+pclath+cstack]
;dialNumber@state stored from wreg
	movwf	(dialNumber@state)
	line	51
	
l2012:	
;phonedialer.c: 51: if(state == 0){
	movf	(dialNumber@state),f
	skipz
	goto	u2501
	goto	u2500
u2501:
	goto	l2016
u2500:
	line	52
	
l2014:	
;phonedialer.c: 52: playTone(6);
	movlw	(06h)
	fcall	_playTone
	goto	l2016
	line	53
	
l741:	
	line	54
	
l2016:	
;phonedialer.c: 53: }
;phonedialer.c: 54: if(state == 1){
	movf	(dialNumber@state),w
	xorlw	01h
	skipz
	goto	u2511
	goto	u2510
u2511:
	goto	l2020
u2510:
	line	55
	
l2018:	
;phonedialer.c: 55: playTone(7);
	movlw	(07h)
	fcall	_playTone
	goto	l2020
	line	56
	
l742:	
	line	57
	
l2020:	
;phonedialer.c: 56: }
;phonedialer.c: 57: if(state == 2){
	movf	(dialNumber@state),w
	xorlw	02h
	skipz
	goto	u2521
	goto	u2520
u2521:
	goto	l2024
u2520:
	line	58
	
l2022:	
;phonedialer.c: 58: playTone(3);
	movlw	(03h)
	fcall	_playTone
	goto	l2024
	line	59
	
l743:	
	line	60
	
l2024:	
;phonedialer.c: 59: }
;phonedialer.c: 60: if(state == 3){
	movf	(dialNumber@state),w
	xorlw	03h
	skipz
	goto	u2531
	goto	u2530
u2531:
	goto	l2028
u2530:
	line	61
	
l2026:	
;phonedialer.c: 61: playTone(3);
	movlw	(03h)
	fcall	_playTone
	goto	l2028
	line	62
	
l744:	
	line	63
	
l2028:	
;phonedialer.c: 62: }
;phonedialer.c: 63: if(state == 4){
	movf	(dialNumber@state),w
	xorlw	04h
	skipz
	goto	u2541
	goto	u2540
u2541:
	goto	l2032
u2540:
	line	64
	
l2030:	
;phonedialer.c: 64: playTone(8);
	movlw	(08h)
	fcall	_playTone
	goto	l2032
	line	65
	
l745:	
	line	66
	
l2032:	
;phonedialer.c: 65: }
;phonedialer.c: 66: if(state == 5){
	movf	(dialNumber@state),w
	xorlw	05h
	skipz
	goto	u2551
	goto	u2550
u2551:
	goto	l2036
u2550:
	line	67
	
l2034:	
;phonedialer.c: 67: playTone(6);
	movlw	(06h)
	fcall	_playTone
	goto	l2036
	line	68
	
l746:	
	line	69
	
l2036:	
;phonedialer.c: 68: }
;phonedialer.c: 69: if(state == 6){
	movf	(dialNumber@state),w
	xorlw	06h
	skipz
	goto	u2561
	goto	u2560
u2561:
	goto	l2040
u2560:
	line	70
	
l2038:	
;phonedialer.c: 70: playTone(9);
	movlw	(09h)
	fcall	_playTone
	goto	l2040
	line	71
	
l747:	
	line	72
	
l2040:	
;phonedialer.c: 71: }
;phonedialer.c: 72: state++;
	movlw	(01h)
	movwf	(??_dialNumber+0)+0
	movf	(??_dialNumber+0)+0,w
	addwf	(dialNumber@state),f
	line	73
	
l2042:	
;phonedialer.c: 73: if(state > 6)
	movlw	(07h)
	subwf	(dialNumber@state),w
	skipc
	goto	u2571
	goto	u2570
u2571:
	goto	l2046
u2570:
	line	74
	
l2044:	
;phonedialer.c: 74: state = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(dialNumber@state)
	goto	l2046
	
l748:	
	line	75
	
l2046:	
;phonedialer.c: 75: return state;
	movf	(dialNumber@state),w
	goto	l749
	
l2048:	
	line	76
	
l749:	
	return
	opt stack 0
GLOBAL	__end_of_dialNumber
	__end_of_dialNumber:
;; =============== function _dialNumber ends ============

	signat	_dialNumber,4217
	global	_playTone
psect	text74,local,class=CODE,delta=2
global __ptext74
__ptext74:

;; *************** function _playTone *****************
;; Defined at:
;;		line 17 in file "C:\projects\PIC\phonedialer\phonedialer.c"
;; Parameters:    Size  Location     Type
;;  tone            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  tone            1    3[COMMON] unsigned char 
;;  i               1    2[COMMON] unsigned char 
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
;;      Locals:         2       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_pulse
;; This function is called by:
;;		_dialNumber
;; This function uses a non-reentrant model
;;
psect	text74
	file	"C:\projects\PIC\phonedialer\phonedialer.c"
	line	17
	global	__size_of_playTone
	__size_of_playTone	equ	__end_of_playTone-_playTone
	
_playTone:	
	opt	stack 5
; Regs used in _playTone: [wreg+status,2+status,0+pclath+cstack]
;playTone@tone stored from wreg
	line	19
	movwf	(playTone@tone)
	
l1914:	
;phonedialer.c: 18: char i;
;phonedialer.c: 19: if(tone == 1 || tone == 3 || tone == 5 || tone == 7 || tone == 9)
	movf	(playTone@tone),w
	xorlw	01h
	skipnz
	goto	u2141
	goto	u2140
u2141:
	goto	l716
u2140:
	
l1916:	
	movf	(playTone@tone),w
	xorlw	03h
	skipnz
	goto	u2151
	goto	u2150
u2151:
	goto	l716
u2150:
	
l1918:	
	movf	(playTone@tone),w
	xorlw	05h
	skipnz
	goto	u2161
	goto	u2160
u2161:
	goto	l716
u2160:
	
l1920:	
	movf	(playTone@tone),w
	xorlw	07h
	skipnz
	goto	u2171
	goto	u2170
u2171:
	goto	l716
u2170:
	
l1922:	
	movf	(playTone@tone),w
	xorlw	09h
	skipz
	goto	u2181
	goto	u2180
u2181:
	goto	l1924
u2180:
	
l716:	
	line	20
;phonedialer.c: 20: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	goto	l1924
	
l714:	
	line	21
	
l1924:	
;phonedialer.c: 21: if(tone == 0 || tone == 2 || tone == 4 || tone == 6 || tone == 8)
	movf	(playTone@tone),w
	skipz
	goto	u2190
	goto	l719
u2190:
	
l1926:	
	movf	(playTone@tone),w
	xorlw	02h
	skipnz
	goto	u2201
	goto	u2200
u2201:
	goto	l719
u2200:
	
l1928:	
	movf	(playTone@tone),w
	xorlw	04h
	skipnz
	goto	u2211
	goto	u2210
u2211:
	goto	l719
u2210:
	
l1930:	
	movf	(playTone@tone),w
	xorlw	06h
	skipnz
	goto	u2221
	goto	u2220
u2221:
	goto	l719
u2220:
	
l1932:	
	movf	(playTone@tone),w
	xorlw	08h
	skipz
	goto	u2231
	goto	u2230
u2231:
	goto	l1934
u2230:
	
l719:	
	line	22
;phonedialer.c: 22: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	goto	l1934
	
l717:	
	line	23
	
l1934:	
;phonedialer.c: 23: pulse();
	fcall	_pulse
	line	24
	
l1936:	
;phonedialer.c: 24: if(tone == 0 || tone == 2 || tone == 3 || tone == 6 || tone == 7)
	movf	(playTone@tone),w
	skipz
	goto	u2240
	goto	l722
u2240:
	
l1938:	
	movf	(playTone@tone),w
	xorlw	02h
	skipnz
	goto	u2251
	goto	u2250
u2251:
	goto	l722
u2250:
	
l1940:	
	movf	(playTone@tone),w
	xorlw	03h
	skipnz
	goto	u2261
	goto	u2260
u2261:
	goto	l722
u2260:
	
l1942:	
	movf	(playTone@tone),w
	xorlw	06h
	skipnz
	goto	u2271
	goto	u2270
u2271:
	goto	l722
u2270:
	
l1944:	
	movf	(playTone@tone),w
	xorlw	07h
	skipz
	goto	u2281
	goto	u2280
u2281:
	goto	l1946
u2280:
	
l722:	
	line	25
;phonedialer.c: 25: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	goto	l1946
	
l720:	
	line	26
	
l1946:	
;phonedialer.c: 26: if(tone == 1 || tone == 4 || tone == 5 || tone == 8 || tone == 9)
	movf	(playTone@tone),w
	xorlw	01h
	skipnz
	goto	u2291
	goto	u2290
u2291:
	goto	l725
u2290:
	
l1948:	
	movf	(playTone@tone),w
	xorlw	04h
	skipnz
	goto	u2301
	goto	u2300
u2301:
	goto	l725
u2300:
	
l1950:	
	movf	(playTone@tone),w
	xorlw	05h
	skipnz
	goto	u2311
	goto	u2310
u2311:
	goto	l725
u2310:
	
l1952:	
	movf	(playTone@tone),w
	xorlw	08h
	skipnz
	goto	u2321
	goto	u2320
u2321:
	goto	l725
u2320:
	
l1954:	
	movf	(playTone@tone),w
	xorlw	09h
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l1956
u2330:
	
l725:	
	line	27
;phonedialer.c: 27: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	goto	l1956
	
l723:	
	line	28
	
l1956:	
;phonedialer.c: 28: pulse();
	fcall	_pulse
	line	29
	
l1958:	
;phonedialer.c: 29: if(tone == 4 || tone == 5 || tone == 6 || tone == 7)
	movf	(playTone@tone),w
	xorlw	04h
	skipnz
	goto	u2341
	goto	u2340
u2341:
	goto	l728
u2340:
	
l1960:	
	movf	(playTone@tone),w
	xorlw	05h
	skipnz
	goto	u2351
	goto	u2350
u2351:
	goto	l728
u2350:
	
l1962:	
	movf	(playTone@tone),w
	xorlw	06h
	skipnz
	goto	u2361
	goto	u2360
u2361:
	goto	l728
u2360:
	
l1964:	
	movf	(playTone@tone),w
	xorlw	07h
	skipz
	goto	u2371
	goto	u2370
u2371:
	goto	l1966
u2370:
	
l728:	
	line	30
;phonedialer.c: 30: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	goto	l1966
	
l726:	
	line	31
	
l1966:	
;phonedialer.c: 31: if(tone == 0 || tone == 1 || tone == 2 || tone == 3 || tone == 8 || tone == 9)
	movf	(playTone@tone),w
	skipz
	goto	u2380
	goto	l731
u2380:
	
l1968:	
	movf	(playTone@tone),w
	xorlw	01h
	skipnz
	goto	u2391
	goto	u2390
u2391:
	goto	l731
u2390:
	
l1970:	
	movf	(playTone@tone),w
	xorlw	02h
	skipnz
	goto	u2401
	goto	u2400
u2401:
	goto	l731
u2400:
	
l1972:	
	movf	(playTone@tone),w
	xorlw	03h
	skipnz
	goto	u2411
	goto	u2410
u2411:
	goto	l731
u2410:
	
l1974:	
	movf	(playTone@tone),w
	xorlw	08h
	skipnz
	goto	u2421
	goto	u2420
u2421:
	goto	l731
u2420:
	
l1976:	
	movf	(playTone@tone),w
	xorlw	09h
	skipz
	goto	u2431
	goto	u2430
u2431:
	goto	l1978
u2430:
	
l731:	
	line	32
;phonedialer.c: 32: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	goto	l1978
	
l729:	
	line	33
	
l1978:	
;phonedialer.c: 33: pulse();
	fcall	_pulse
	line	34
	
l1980:	
;phonedialer.c: 34: if(tone == 8 || tone == 9 || tone == 0)
	movf	(playTone@tone),w
	xorlw	08h
	skipnz
	goto	u2441
	goto	u2440
u2441:
	goto	l734
u2440:
	
l1982:	
	movf	(playTone@tone),w
	xorlw	09h
	skipnz
	goto	u2451
	goto	u2450
u2451:
	goto	l734
u2450:
	
l1984:	
	movf	(playTone@tone),f
	skipz
	goto	u2461
	goto	u2460
u2461:
	goto	l1986
u2460:
	
l734:	
	line	35
;phonedialer.c: 35: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	goto	l1986
	
l732:	
	line	36
	
l1986:	
;phonedialer.c: 36: if(tone < 8)
	movlw	(08h)
	subwf	(playTone@tone),w
	skipnc
	goto	u2471
	goto	u2470
u2471:
	goto	l1990
u2470:
	line	37
	
l1988:	
;phonedialer.c: 37: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	goto	l1990
	
l735:	
	line	38
	
l1990:	
;phonedialer.c: 38: pulse();
	fcall	_pulse
	line	39
	
l1992:	
;phonedialer.c: 39: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	40
;phonedialer.c: 40: pulse();
	fcall	_pulse
	line	42
	
l1994:	
;phonedialer.c: 42: _delay((unsigned long)((195)*(4000000/4000.0)));
	opt asmopt_off
movlw	254
movwf	((??_playTone+0)+0+1),f
	movlw	61
movwf	((??_playTone+0)+0),f
u2637:
	decfsz	((??_playTone+0)+0),f
	goto	u2637
	decfsz	((??_playTone+0)+0+1),f
	goto	u2637
	nop2
opt asmopt_on

	line	43
	
l1996:	
;phonedialer.c: 43: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	44
	
l1998:	
;phonedialer.c: 44: for (i = 0; i < 5; i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(playTone@i)
	
l2000:	
	movlw	(05h)
	subwf	(playTone@i),w
	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l2004
u2480:
	goto	l2010
	
l2002:	
	goto	l2010
	line	45
	
l736:	
	
l2004:	
;phonedialer.c: 45: pulse();
	fcall	_pulse
	line	44
	
l2006:	
	movlw	(01h)
	movwf	(??_playTone+0)+0
	movf	(??_playTone+0)+0,w
	addwf	(playTone@i),f
	
l2008:	
	movlw	(05h)
	subwf	(playTone@i),w
	skipc
	goto	u2491
	goto	u2490
u2491:
	goto	l2004
u2490:
	goto	l2010
	
l737:	
	line	46
	
l2010:	
;phonedialer.c: 46: _delay((unsigned long)((195)*(4000000/4000.0)));
	opt asmopt_off
movlw	254
movwf	((??_playTone+0)+0+1),f
	movlw	61
movwf	((??_playTone+0)+0),f
u2647:
	decfsz	((??_playTone+0)+0),f
	goto	u2647
	decfsz	((??_playTone+0)+0+1),f
	goto	u2647
	nop2
opt asmopt_on

	line	48
	
l738:	
	return
	opt stack 0
GLOBAL	__end_of_playTone
	__end_of_playTone:
;; =============== function _playTone ends ============

	signat	_playTone,4216
	global	_pulse
psect	text75,local,class=CODE,delta=2
global __ptext75
__ptext75:

;; *************** function _pulse *****************
;; Defined at:
;;		line 10 in file "C:\projects\PIC\phonedialer\phonedialer.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_playTone
;; This function uses a non-reentrant model
;;
psect	text75
	file	"C:\projects\PIC\phonedialer\phonedialer.c"
	line	10
	global	__size_of_pulse
	__size_of_pulse	equ	__end_of_pulse-_pulse
	
_pulse:	
	opt	stack 5
; Regs used in _pulse: []
	line	11
	
l1912:	
;phonedialer.c: 11: RC7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(63/8),(63)&7
	line	12
;phonedialer.c: 12: _delay((unsigned long)((5)*(4000000/4000000.0)));
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	clrwdt
	opt asmopt_on

	line	13
;phonedialer.c: 13: RC7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	line	14
;phonedialer.c: 14: _delay((unsigned long)((5)*(4000000/4000000.0)));
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	clrwdt
	opt asmopt_on

	line	15
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_pulse
	__end_of_pulse:
;; =============== function _pulse ends ============

	signat	_pulse,88
psect	text76,local,class=CODE,delta=2
global __ptext76
__ptext76:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
