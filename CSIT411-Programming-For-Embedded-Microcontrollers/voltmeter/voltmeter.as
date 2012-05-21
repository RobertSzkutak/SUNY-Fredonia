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
# 6 "C:\projects\PIC\voltmeter\voltmeter.c"
	psect config,class=CONFIG,delta=2 ;#
# 6 "C:\projects\PIC\voltmeter\voltmeter.c"
	dw 0x3FFF & 0x3CFF & 0x3FDF & 0x3FEF & 0x3FFC & 0x3FF7 ;#
	FNCALL	_main,_initLCD
	FNCALL	_initLCD,_pulse
	FNROOT	_main
	FNCALL	_isr,_compare
	FNCALL	_isr,_printvoltage
	FNCALL	_printvoltage,_clearLCD
	FNCALL	_printvoltage,i1_pulse
	FNCALL	_compare,_sprintf
	FNCALL	_clearLCD,i1_pulse
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_storage
	global	_volts
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	9

;initializer for _storage
	retlw	078h
	retlw	02Eh
	retlw	078h
	retlw	056h
	line	8

;initializer for _volts
	retlw	078h
	retlw	02Eh
	retlw	078h
	retlw	056h
	global	_dpowers
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\doprnt.c"
	line	350
_dpowers:
	retlw	01h
	retlw	0

	retlw	0Ah
	retlw	0

	retlw	064h
	retlw	0

	retlw	0E8h
	retlw	03h

	retlw	010h
	retlw	027h

	global	_dpowers
	global	_totalvolt
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_INTCON
_INTCON	set	11
	global	_PORTC
_PORTC	set	7
	global	_ADIF
_ADIF	set	102
	global	_GIE
_GIE	set	95
	global	_GODONE
_GODONE	set	249
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_ADIE
_ADIE	set	1126
	global	_ANSEL
_ANSEL	set	286
	global	_ANSELH
_ANSELH	set	287
	
STR_1:	
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	0
psect	strings
	file	"voltmeter.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_totalvolt:
       ds      2

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	9
_storage:
       ds      4

psect	dataBANK0
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	8
_volts:
       ds      4

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
	fcall	__pidataBANK0+6		;fetch initializer
	movwf	__pdataBANK0+6&07fh		
	fcall	__pidataBANK0+7		;fetch initializer
	movwf	__pdataBANK0+7&07fh		
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
	global	?_clearLCD
?_clearLCD:	; 0 bytes @ 0x0
	global	?_printvoltage
?_printvoltage:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	?_initLCD
?_initLCD:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?i1_pulse
?i1_pulse:	; 0 bytes @ 0x0
	global	??i1_pulse
??i1_pulse:	; 0 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	ds	2
	global	??_clearLCD
??_clearLCD:	; 0 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??_printvoltage
??_printvoltage:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	ds	1
	global	printvoltage@refresh
printvoltage@refresh:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	printvoltage@digit
printvoltage@digit:	; 1 bytes @ 0x6
	ds	1
	global	printvoltage@i
printvoltage@i:	; 1 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
	ds	2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xA
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xC
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x0
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x0
	ds	3
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0x3
	ds	3
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x6
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x7
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x8
	ds	1
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x9
	ds	4
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0xD
	ds	1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0xE
	ds	1
	global	?_compare
?_compare:	; 1 bytes @ 0xF
	global	compare@low
compare@low:	; 1 bytes @ 0xF
	ds	1
	global	??_compare
??_compare:	; 0 bytes @ 0x10
	ds	1
	global	compare@v
compare@v:	; 5 bytes @ 0x11
	ds	5
	global	compare@temp
compare@temp:	; 1 bytes @ 0x16
	ds	1
	global	compare@high
compare@high:	; 1 bytes @ 0x17
	ds	1
	global	??_isr
??_isr:	; 0 bytes @ 0x18
	ds	6
	global	isr@volt
isr@volt:	; 1 bytes @ 0x1E
	ds	1
	global	??_pulse
??_pulse:	; 0 bytes @ 0x1F
	ds	2
	global	??_initLCD
??_initLCD:	; 0 bytes @ 0x21
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x23
	ds	2
;;Data sizes: Strings 3, constant 10, data 8, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     37      47
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?_compare	PTR unsigned char  size(1) Largest target is 5
;;		 -> compare@v(BANK0[5]), 
;;
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 3
;;		 -> STR_1(CODE[3]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 5
;;		 -> compare@v(BANK0[5]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S421$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; isr@volt	PTR unsigned char  size(1) Largest target is 5
;;		 -> compare@v(BANK0[5]), 
;;
;; sp__compare	PTR unsigned char  size(1) Largest target is 5
;;		 -> compare@v(BANK0[5]), 
;;
;; printvoltage@digit	PTR unsigned char  size(1) Largest target is 5
;;		 -> compare@v(BANK0[5]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   _printvoltage->_clearLCD
;;   _clearLCD->i1_pulse
;;   _sprintf->___lwmod
;;   ___lwmod->___lwdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_initLCD
;;   _initLCD->_pulse
;;
;; Critical Paths under _isr in BANK0
;;
;;   _isr->_compare
;;   _compare->_sprintf
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
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
;; (0) _main                                                 2     2      0       0
;;                                             35 BANK0      2     2      0
;;                            _initLCD
;; ---------------------------------------------------------------------------------
;; (1) _initLCD                                              2     2      0       0
;;                                             33 BANK0      2     2      0
;;                              _pulse
;; ---------------------------------------------------------------------------------
;; (2) _pulse                                                2     2      0       0
;;                                             31 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _isr                                                  7     7      0    1467
;;                                             24 BANK0      7     7      0
;;                            _compare
;;                       _printvoltage
;; ---------------------------------------------------------------------------------
;; (4) _printvoltage                                         4     4      0     338
;;                                              4 COMMON     4     4      0
;;                           _clearLCD
;;                            i1_pulse
;; ---------------------------------------------------------------------------------
;; (4) _compare                                              9     8      1    1106
;;                                             15 BANK0      9     8      1
;;                            _sprintf
;; ---------------------------------------------------------------------------------
;; (5) _clearLCD                                             2     2      0       0
;;                                              2 COMMON     2     2      0
;;                            i1_pulse
;; ---------------------------------------------------------------------------------
;; (5) i1_pulse                                              2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (5) _sprintf                                             15    12      3     798
;;                                              0 BANK0     15    12      3
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (6) ___lwmod                                              6     2      4     159
;;                                              8 COMMON     6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (6) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _initLCD
;;     _pulse
;;
;; _isr (ROOT)
;;   _compare
;;     _sprintf
;;       ___lwdiv
;;       ___lwmod
;;         ___lwdiv (ARG)
;;   _printvoltage
;;     _clearLCD
;;       i1_pulse
;;     i1_pulse
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
;;DATA                 0      0      47      10        0.0%
;;ABS                  0      0      3D       8        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       A       2        0.0%
;;BANK0               50     25      2F       3       58.8%
;;BITBANK0            50      0       0       9        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 153 in file "C:\projects\PIC\voltmeter\voltmeter.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_initLCD
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	153
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	155
	
l2484:	
;voltmeter.c: 155: TRISC = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	156
;voltmeter.c: 156: TRISB = 0;
	clrf	(134)^080h	;volatile
	line	157
	
l2486:	
;voltmeter.c: 157: TRISA = 0b00000100;
	movlw	(04h)
	movwf	(133)^080h	;volatile
	line	158
	
l2488:	
;voltmeter.c: 158: ANSEL = 0b00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(286)^0100h	;volatile
	line	159
;voltmeter.c: 159: ANSELH = 0;
	clrf	(287)^0100h	;volatile
	line	160
	
l2490:	
;voltmeter.c: 160: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2857:
	decfsz	((??_main+0)+0),f
	goto	u2857
	decfsz	((??_main+0)+0+1),f
	goto	u2857
opt asmopt_on

	line	161
	
l2492:	
;voltmeter.c: 161: initLCD();
	fcall	_initLCD
	line	162
	
l2494:	
;voltmeter.c: 162: _delay((unsigned long)((5)*(4000000/4000.0)));
	opt asmopt_off
movlw	7
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u2867:
	decfsz	((??_main+0)+0),f
	goto	u2867
	decfsz	((??_main+0)+0+1),f
	goto	u2867
opt asmopt_on

	line	163
	
l2496:	
;voltmeter.c: 163: GIE = 1;
	bsf	(95/8),(95)&7
	line	164
	
l2498:	
;voltmeter.c: 164: ADIE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1126/8)^080h,(1126)&7
	line	165
	
l2500:	
;voltmeter.c: 165: INTCON = 0b11000000;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	166
	
l2502:	
;voltmeter.c: 166: ADCON0 = 0b10001001;
	movlw	(089h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	167
	
l2504:	
;voltmeter.c: 167: ADCON1 = 0b00010000;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	168
	
l2506:	
;voltmeter.c: 168: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	goto	l761
	line	170
;voltmeter.c: 170: while (1);
	
l760:	
	
l761:	
	goto	l761
	
l762:	
	line	172
	
l763:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_initLCD
psect	text277,local,class=CODE,delta=2
global __ptext277
__ptext277:

;; *************** function _initLCD *****************
;; Defined at:
;;		line 137 in file "C:\projects\PIC\voltmeter\voltmeter.c"
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
;;      Temps:          0       2       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_pulse
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text277
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	137
	global	__size_of_initLCD
	__size_of_initLCD	equ	__end_of_initLCD-_initLCD
	
_initLCD:	
	opt	stack 2
; Regs used in _initLCD: [wreg+status,2+status,0+pclath+cstack]
	line	139
	
l2470:	
;voltmeter.c: 139: RB6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(54/8),(54)&7
	line	140
;voltmeter.c: 140: RB7 = 0;
	bcf	(55/8),(55)&7
	line	141
	
l2472:	
;voltmeter.c: 141: _delay((unsigned long)((125)*(4000000/4000.0)));
	opt asmopt_off
movlw	163
movwf	((??_initLCD+0)+0+1),f
	movlw	85
movwf	((??_initLCD+0)+0),f
u2877:
	decfsz	((??_initLCD+0)+0),f
	goto	u2877
	decfsz	((??_initLCD+0)+0+1),f
	goto	u2877
opt asmopt_on

	line	142
;voltmeter.c: 142: PORTC = 0x38;
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	143
	
l2474:	
;voltmeter.c: 143: pulse();
	fcall	_pulse
	line	144
	
l2476:	
;voltmeter.c: 144: PORTC = 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	145
;voltmeter.c: 145: pulse();
	fcall	_pulse
	line	146
	
l2478:	
;voltmeter.c: 146: PORTC = 1;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	147
	
l2480:	
;voltmeter.c: 147: pulse();
	fcall	_pulse
	line	148
	
l2482:	
;voltmeter.c: 148: RB7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(55/8),(55)&7
	line	150
	
l757:	
	return
	opt stack 0
GLOBAL	__end_of_initLCD
	__end_of_initLCD:
;; =============== function _initLCD ends ============

	signat	_initLCD,88
	global	_pulse
psect	text278,local,class=CODE,delta=2
global __ptext278
__ptext278:

;; *************** function _pulse *****************
;; Defined at:
;;		line 14 in file "C:\projects\PIC\voltmeter\voltmeter.c"
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
;;      Temps:          0       2       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initLCD
;; This function uses a non-reentrant model
;;
psect	text278
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	14
	global	__size_of_pulse
	__size_of_pulse	equ	__end_of_pulse-_pulse
	
_pulse:	
	opt	stack 2
; Regs used in _pulse: [wreg]
	line	16
	
l2466:	
;voltmeter.c: 16: RB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	17
;voltmeter.c: 17: RB6 = 0;
	bcf	(54/8),(54)&7
	line	18
	
l2468:	
;voltmeter.c: 18: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_pulse+0)+0+1),f
	movlw	151
movwf	((??_pulse+0)+0),f
u2887:
	decfsz	((??_pulse+0)+0),f
	goto	u2887
	decfsz	((??_pulse+0)+0+1),f
	goto	u2887
	nop2
opt asmopt_on

	line	20
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_pulse
	__end_of_pulse:
;; =============== function _pulse ends ============

	signat	_pulse,88
	global	_isr
psect	text279,local,class=CODE,delta=2
global __ptext279
__ptext279:

;; *************** function _isr *****************
;; Defined at:
;;		line 122 in file "C:\projects\PIC\voltmeter\voltmeter.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  volt            1   30[BANK0 ] PTR unsigned char 
;;		 -> compare@v(5), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       6       0       0
;;      Totals:         0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_compare
;;		_printvoltage
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text279
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	122
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 2
; Regs used in _isr: [allreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr+2)
	movf	fsr0,w
	movwf	(??_isr+3)
	movf	pclath,w
	movwf	(??_isr+4)
	movf	btemp+1,w
	movwf	(??_isr+5)
	ljmp	_isr
psect	text279
	line	126
	
i1l2404:	
;voltmeter.c: 124: char *volt;
;voltmeter.c: 126: ADIF = 0;
	bcf	(102/8),(102)&7
	line	127
	
i1l2406:	
;voltmeter.c: 127: totalvolt = 0;
	movlw	low(0)
	movwf	(_totalvolt)
	movlw	high(0)
	movwf	((_totalvolt))+1
	line	128
	
i1l2408:	
;voltmeter.c: 128: volt = compare(ADRESH, ADRESL);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	movwf	(?_compare)
	movf	(30),w	;volatile
	fcall	_compare
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr+1)+0
	movf	(??_isr+1)+0,w
	movwf	(isr@volt)
	line	129
	
i1l2410:	
;voltmeter.c: 129: printvoltage(volt);
	movf	(isr@volt),w
	fcall	_printvoltage
	line	130
	
i1l2412:	
;voltmeter.c: 130: _delay((unsigned long)((30)*(4000000/4000.0)));
	opt asmopt_off
movlw	39
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_isr+0)+0+1),f
	movlw	245
movwf	((??_isr+0)+0),f
u289_27:
	decfsz	((??_isr+0)+0),f
	goto	u289_27
	decfsz	((??_isr+0)+0+1),f
	goto	u289_27
opt asmopt_on

	line	131
	
i1l2414:	
;voltmeter.c: 131: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	133
	
i1l754:	
	movf	(??_isr+5),w
	movwf	btemp+1
	movf	(??_isr+4),w
	movwf	pclath
	movf	(??_isr+3),w
	movwf	fsr0
	movf	(??_isr+2),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
	global	_printvoltage
psect	text280,local,class=CODE,delta=2
global __ptext280
__ptext280:

;; *************** function _printvoltage *****************
;; Defined at:
;;		line 36 in file "C:\projects\PIC\voltmeter\voltmeter.c"
;; Parameters:    Size  Location     Type
;;  digit           1    wreg     PTR unsigned char 
;;		 -> compare@v(5), 
;; Auto vars:     Size  Location     Type
;;  digit           1    6[COMMON] PTR unsigned char 
;;		 -> compare@v(5), 
;;  i               1    7[COMMON] unsigned char 
;;  refresh         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_clearLCD
;;		i1_pulse
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text280
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	36
	global	__size_of_printvoltage
	__size_of_printvoltage	equ	__end_of_printvoltage-_printvoltage
	
_printvoltage:	
	opt	stack 2
; Regs used in _printvoltage: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;printvoltage@digit stored from wreg
	line	39
	movwf	(printvoltage@digit)
	
i1l2236:	
;voltmeter.c: 38: char i;
;voltmeter.c: 39: char refresh = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(printvoltage@refresh)
	line	41
	
i1l2238:	
;voltmeter.c: 41: if(totalvolt > 100)
	movlw	high(065h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_totalvolt+1),w
	movlw	low(065h)
	skipnz
	subwf	(_totalvolt),w
	skipc
	goto	u243_21
	goto	u243_20
u243_21:
	goto	i1l2242
u243_20:
	line	43
	
i1l2240:	
;voltmeter.c: 42: {
;voltmeter.c: 43: volts[0] = digit[0];
	movf	(printvoltage@digit),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_printvoltage+0)+0
	movf	(??_printvoltage+0)+0,w
	movwf	(_volts)
	line	44
;voltmeter.c: 44: volts[2] = digit[1];
	movf	(printvoltage@digit),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_printvoltage+0)+0
	movf	(??_printvoltage+0)+0,w
	movwf	0+(_volts)+02h
	line	45
;voltmeter.c: 45: }
	goto	i1l2250
	line	47
	
i1l725:	
	
i1l2242:	
;voltmeter.c: 47: else if(totalvolt > 10)
	movlw	high(0Bh)
	subwf	(_totalvolt+1),w
	movlw	low(0Bh)
	skipnz
	subwf	(_totalvolt),w
	skipc
	goto	u244_21
	goto	u244_20
u244_21:
	goto	i1l2248
u244_20:
	line	49
	
i1l2244:	
;voltmeter.c: 48: {
;voltmeter.c: 49: volts[0] = '0';
	movlw	(030h)
	movwf	(??_printvoltage+0)+0
	movf	(??_printvoltage+0)+0,w
	movwf	(_volts)
	line	50
	
i1l2246:	
;voltmeter.c: 50: volts[2] = digit[0];
	movf	(printvoltage@digit),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_printvoltage+0)+0
	movf	(??_printvoltage+0)+0,w
	movwf	0+(_volts)+02h
	line	51
;voltmeter.c: 51: }
	goto	i1l2250
	line	53
	
i1l727:	
	line	55
	
i1l2248:	
;voltmeter.c: 53: else
;voltmeter.c: 54: {
;voltmeter.c: 55: volts[0] = '0';
	movlw	(030h)
	movwf	(??_printvoltage+0)+0
	movf	(??_printvoltage+0)+0,w
	movwf	(_volts)
	line	56
;voltmeter.c: 56: volts[2] = '0';
	movlw	(030h)
	movwf	(??_printvoltage+0)+0
	movf	(??_printvoltage+0)+0,w
	movwf	0+(_volts)+02h
	goto	i1l2250
	line	57
	
i1l728:	
	goto	i1l2250
	
i1l726:	
	line	59
	
i1l2250:	
;voltmeter.c: 57: }
;voltmeter.c: 59: for(i=0;i<4;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(printvoltage@i)
	
i1l2252:	
	movlw	(04h)
	subwf	(printvoltage@i),w
	skipc
	goto	u245_21
	goto	u245_20
u245_21:
	goto	i1l2256
u245_20:
	goto	i1l2264
	
i1l2254:	
	goto	i1l2264
	line	60
	
i1l729:	
	line	61
	
i1l2256:	
;voltmeter.c: 60: {
;voltmeter.c: 61: if(storage[i] != volts[i])
	movf	(printvoltage@i),w
	addlw	_volts&0ffh
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_printvoltage+0)+0
	movf	(printvoltage@i),w
	addlw	_storage&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(??_printvoltage+0)+0,w
	skipnz
	goto	u246_21
	goto	u246_20
u246_21:
	goto	i1l2260
u246_20:
	line	63
	
i1l2258:	
;voltmeter.c: 62: {
;voltmeter.c: 63: refresh = 1;
	clrf	(printvoltage@refresh)
	bsf	status,0
	rlf	(printvoltage@refresh),f
	line	64
;voltmeter.c: 64: break;
	goto	i1l2264
	line	65
	
i1l731:	
	line	59
	
i1l2260:	
	movlw	(01h)
	movwf	(??_printvoltage+0)+0
	movf	(??_printvoltage+0)+0,w
	addwf	(printvoltage@i),f
	
i1l2262:	
	movlw	(04h)
	subwf	(printvoltage@i),w
	skipc
	goto	u247_21
	goto	u247_20
u247_21:
	goto	i1l2256
u247_20:
	goto	i1l2264
	
i1l730:	
	line	68
	
i1l2264:	
;voltmeter.c: 65: }
;voltmeter.c: 66: }
;voltmeter.c: 68: if(refresh == 1)
	movf	(printvoltage@refresh),w
	xorlw	01h
	skipz
	goto	u248_21
	goto	u248_20
u248_21:
	goto	i1l2282
u248_20:
	line	70
	
i1l2266:	
;voltmeter.c: 69: {
;voltmeter.c: 70: clearLCD();
	fcall	_clearLCD
	line	71
	
i1l2268:	
;voltmeter.c: 71: for(i=0;i<4;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(printvoltage@i)
	
i1l2270:	
	movlw	(04h)
	subwf	(printvoltage@i),w
	skipc
	goto	u249_21
	goto	u249_20
u249_21:
	goto	i1l2274
u249_20:
	goto	i1l2282
	
i1l2272:	
	goto	i1l2282
	line	72
	
i1l733:	
	line	73
	
i1l2274:	
;voltmeter.c: 72: {
;voltmeter.c: 73: PORTC = volts[i];
	movf	(printvoltage@i),w
	addlw	_volts&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	74
	
i1l2276:	
;voltmeter.c: 74: pulse();
	fcall	i1_pulse
	line	71
	
i1l2278:	
	movlw	(01h)
	movwf	(??_printvoltage+0)+0
	movf	(??_printvoltage+0)+0,w
	addwf	(printvoltage@i),f
	
i1l2280:	
	movlw	(04h)
	subwf	(printvoltage@i),w
	skipc
	goto	u250_21
	goto	u250_20
u250_21:
	goto	i1l2274
u250_20:
	goto	i1l2282
	
i1l734:	
	goto	i1l2282
	line	76
	
i1l732:	
	line	78
	
i1l2282:	
;voltmeter.c: 75: }
;voltmeter.c: 76: }
;voltmeter.c: 78: for(i=0;i<4;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(printvoltage@i)
	
i1l2284:	
	movlw	(04h)
	subwf	(printvoltage@i),w
	skipc
	goto	u251_21
	goto	u251_20
u251_21:
	goto	i1l2288
u251_20:
	goto	i1l737
	
i1l2286:	
	goto	i1l737
	line	79
	
i1l735:	
	line	80
	
i1l2288:	
;voltmeter.c: 79: {
;voltmeter.c: 80: storage[i] = volts[i];
	movf	(printvoltage@i),w
	addlw	_volts&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_printvoltage+0)+0
	movf	(printvoltage@i),w
	addlw	_storage&0ffh
	movwf	fsr0
	movf	(??_printvoltage+0)+0,w
	movwf	indf
	line	78
	
i1l2290:	
	movlw	(01h)
	movwf	(??_printvoltage+0)+0
	movf	(??_printvoltage+0)+0,w
	addwf	(printvoltage@i),f
	
i1l2292:	
	movlw	(04h)
	subwf	(printvoltage@i),w
	skipc
	goto	u252_21
	goto	u252_20
u252_21:
	goto	i1l2288
u252_20:
	goto	i1l737
	
i1l736:	
	line	83
	
i1l737:	
	return
	opt stack 0
GLOBAL	__end_of_printvoltage
	__end_of_printvoltage:
;; =============== function _printvoltage ends ============

	signat	_printvoltage,4216
	global	_compare
psect	text281,local,class=CODE,delta=2
global __ptext281
__ptext281:

;; *************** function _compare *****************
;; Defined at:
;;		line 88 in file "C:\projects\PIC\voltmeter\voltmeter.c"
;; Parameters:    Size  Location     Type
;;  high            1    wreg     unsigned char 
;;  low             1   15[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  high            1   23[BANK0 ] unsigned char 
;;  v               5   17[BANK0 ] unsigned char [5]
;;  temp            1   22[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       7       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       9       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_sprintf
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text281
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	88
	global	__size_of_compare
	__size_of_compare	equ	__end_of_compare-_compare
	
_compare:	
	opt	stack 2
; Regs used in _compare: [allreg]
;compare@high stored from wreg
	line	91
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(compare@high)
	
i1l2294:	
;voltmeter.c: 90: char v[5];
;voltmeter.c: 91: char temp = high;
	movf	(compare@high),w
	movwf	(??_compare+0)+0
	movf	(??_compare+0)+0,w
	movwf	(compare@temp)
	line	93
	
i1l2296:	
;voltmeter.c: 93: if((temp=(high & 0b00000010)) == 0b00000010)
	movf	(compare@high),w
	andlw	02h
	movwf	(compare@temp)
	xorlw	02h
	skipz
	goto	u253_21
	goto	u253_20
u253_21:
	goto	i1l2300
u253_20:
	line	94
	
i1l2298:	
;voltmeter.c: 94: totalvolt = totalvolt + 250;
	movf	(_totalvolt),w
	addlw	low(0FAh)
	movwf	(_totalvolt)
	movf	(_totalvolt+1),w
	skipnc
	addlw	1
	addlw	high(0FAh)
	movwf	1+(_totalvolt)
	goto	i1l2300
	
i1l740:	
	line	95
	
i1l2300:	
;voltmeter.c: 95: if((temp=(high & 0b00000001)) == 0b00000001)
	movf	(compare@high),w
	andlw	01h
	movwf	(compare@temp)
	xorlw	01h
	skipz
	goto	u254_21
	goto	u254_20
u254_21:
	goto	i1l2304
u254_20:
	line	96
	
i1l2302:	
;voltmeter.c: 96: totalvolt = totalvolt + 125;
	movf	(_totalvolt),w
	addlw	low(07Dh)
	movwf	(_totalvolt)
	movf	(_totalvolt+1),w
	skipnc
	addlw	1
	addlw	high(07Dh)
	movwf	1+(_totalvolt)
	goto	i1l2304
	
i1l741:	
	line	97
	
i1l2304:	
;voltmeter.c: 97: if((temp=(low & 0b10000000)) == 0b10000000)
	movf	(compare@low),w
	andlw	080h
	movwf	(compare@temp)
	xorlw	080h
	skipz
	goto	u255_21
	goto	u255_20
u255_21:
	goto	i1l2308
u255_20:
	line	98
	
i1l2306:	
;voltmeter.c: 98: totalvolt = totalvolt + 62;
	movf	(_totalvolt),w
	addlw	low(03Eh)
	movwf	(_totalvolt)
	movf	(_totalvolt+1),w
	skipnc
	addlw	1
	addlw	high(03Eh)
	movwf	1+(_totalvolt)
	goto	i1l2308
	
i1l742:	
	line	99
	
i1l2308:	
;voltmeter.c: 99: if((temp=(low & 0b01000000)) == 0b01000000)
	movf	(compare@low),w
	andlw	040h
	movwf	(compare@temp)
	xorlw	040h
	skipz
	goto	u256_21
	goto	u256_20
u256_21:
	goto	i1l2312
u256_20:
	line	100
	
i1l2310:	
;voltmeter.c: 100: totalvolt = totalvolt + 31;
	movf	(_totalvolt),w
	addlw	low(01Fh)
	movwf	(_totalvolt)
	movf	(_totalvolt+1),w
	skipnc
	addlw	1
	addlw	high(01Fh)
	movwf	1+(_totalvolt)
	goto	i1l2312
	
i1l743:	
	line	101
	
i1l2312:	
;voltmeter.c: 101: if((temp=(low & 0b00100000)) == 0b00100000)
	movf	(compare@low),w
	andlw	020h
	movwf	(compare@temp)
	xorlw	020h
	skipz
	goto	u257_21
	goto	u257_20
u257_21:
	goto	i1l2316
u257_20:
	line	102
	
i1l2314:	
;voltmeter.c: 102: totalvolt = totalvolt + 15;
	movf	(_totalvolt),w
	addlw	low(0Fh)
	movwf	(_totalvolt)
	movf	(_totalvolt+1),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+(_totalvolt)
	goto	i1l2316
	
i1l744:	
	line	103
	
i1l2316:	
;voltmeter.c: 103: if((temp=(low & 0b00010000)) == 0b00010000)
	movf	(compare@low),w
	andlw	010h
	movwf	(compare@temp)
	xorlw	010h
	skipz
	goto	u258_21
	goto	u258_20
u258_21:
	goto	i1l2320
u258_20:
	line	104
	
i1l2318:	
;voltmeter.c: 104: totalvolt = totalvolt + 8;
	movf	(_totalvolt),w
	addlw	low(08h)
	movwf	(_totalvolt)
	movf	(_totalvolt+1),w
	skipnc
	addlw	1
	addlw	high(08h)
	movwf	1+(_totalvolt)
	goto	i1l2320
	
i1l745:	
	line	105
	
i1l2320:	
;voltmeter.c: 105: if((temp=(low & 0b00001000)) == 0b00001000)
	movf	(compare@low),w
	andlw	08h
	movwf	(compare@temp)
	xorlw	08h
	skipz
	goto	u259_21
	goto	u259_20
u259_21:
	goto	i1l2324
u259_20:
	line	106
	
i1l2322:	
;voltmeter.c: 106: totalvolt = totalvolt + 4;
	movf	(_totalvolt),w
	addlw	low(04h)
	movwf	(_totalvolt)
	movf	(_totalvolt+1),w
	skipnc
	addlw	1
	addlw	high(04h)
	movwf	1+(_totalvolt)
	goto	i1l2324
	
i1l746:	
	line	107
	
i1l2324:	
;voltmeter.c: 107: if((temp=(low & 0b00000100)) == 0b00000100)
	movf	(compare@low),w
	andlw	04h
	movwf	(compare@temp)
	xorlw	04h
	skipz
	goto	u260_21
	goto	u260_20
u260_21:
	goto	i1l2328
u260_20:
	line	108
	
i1l2326:	
;voltmeter.c: 108: totalvolt = totalvolt +2;
	movf	(_totalvolt),w
	addlw	low(02h)
	movwf	(_totalvolt)
	movf	(_totalvolt+1),w
	skipnc
	addlw	1
	addlw	high(02h)
	movwf	1+(_totalvolt)
	goto	i1l2328
	
i1l747:	
	line	109
	
i1l2328:	
;voltmeter.c: 109: if((temp=(low & 0b00000010)) == 0b00000010)
	movf	(compare@low),w
	andlw	02h
	movwf	(compare@temp)
	xorlw	02h
	skipz
	goto	u261_21
	goto	u261_20
u261_21:
	goto	i1l2332
u261_20:
	line	110
	
i1l2330:	
;voltmeter.c: 110: totalvolt = totalvolt + 1;
	movf	(_totalvolt),w
	addlw	low(01h)
	movwf	(_totalvolt)
	movf	(_totalvolt+1),w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(_totalvolt)
	goto	i1l2332
	
i1l748:	
	line	112
	
i1l2332:	
;voltmeter.c: 112: if(totalvolt == 499)
	movlw	high(01F3h)
	xorwf	(_totalvolt+1),w
	skipz
	goto	u262_25
	movlw	low(01F3h)
	xorwf	(_totalvolt),w
u262_25:

	skipz
	goto	u262_21
	goto	u262_20
u262_21:
	goto	i1l2338
u262_20:
	line	113
	
i1l2334:	
;voltmeter.c: 113: if((temp=(low & 0b00000001)) == 0b00000001)
	movf	(compare@low),w
	andlw	01h
	movwf	(compare@temp)
	xorlw	01h
	skipz
	goto	u263_21
	goto	u263_20
u263_21:
	goto	i1l2338
u263_20:
	line	114
	
i1l2336:	
;voltmeter.c: 114: totalvolt = totalvolt + 1;
	movf	(_totalvolt),w
	addlw	low(01h)
	movwf	(_totalvolt)
	movf	(_totalvolt+1),w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(_totalvolt)
	goto	i1l2338
	
i1l750:	
	goto	i1l2338
	line	116
	
i1l749:	
	
i1l2338:	
;voltmeter.c: 116: sprintf(v, "%d", totalvolt);
	movlw	((STR_1-__stringbase))&0ffh
	movwf	(??_compare+0)+0
	movf	(??_compare+0)+0,w
	movwf	(?_sprintf)
	movf	(_totalvolt+1),w
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	movf	(_totalvolt),w
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	movlw	(compare@v)&0ffh
	fcall	_sprintf
	line	118
	
i1l2340:	
;voltmeter.c: 118: return v;
	movlw	(compare@v)&0ffh
	goto	i1l751
	
i1l2342:	
	line	119
	
i1l751:	
	return
	opt stack 0
GLOBAL	__end_of_compare
	__end_of_compare:
;; =============== function _compare ends ============

	signat	_compare,8313
	global	_clearLCD
psect	text282,local,class=CODE,delta=2
global __ptext282
__ptext282:

;; *************** function _clearLCD *****************
;; Defined at:
;;		line 24 in file "C:\projects\PIC\voltmeter\voltmeter.c"
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
;;		i1_pulse
;; This function is called by:
;;		_printvoltage
;; This function uses a non-reentrant model
;;
psect	text282
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	24
	global	__size_of_clearLCD
	__size_of_clearLCD	equ	__end_of_clearLCD-_clearLCD
	
_clearLCD:	
	opt	stack 2
; Regs used in _clearLCD: [wreg+status,2+status,0+pclath+cstack]
	line	26
	
i1l2228:	
;voltmeter.c: 26: RB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	27
	
i1l2230:	
;voltmeter.c: 27: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_clearLCD+0)+0+1),f
	movlw	151
movwf	((??_clearLCD+0)+0),f
u290_27:
	decfsz	((??_clearLCD+0)+0),f
	goto	u290_27
	decfsz	((??_clearLCD+0)+0+1),f
	goto	u290_27
	nop2
opt asmopt_on

	line	28
;voltmeter.c: 28: PORTC = 1;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	29
	
i1l2232:	
;voltmeter.c: 29: pulse();
	fcall	i1_pulse
	line	30
	
i1l2234:	
;voltmeter.c: 30: RB7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(55/8),(55)&7
	line	32
	
i1l722:	
	return
	opt stack 0
GLOBAL	__end_of_clearLCD
	__end_of_clearLCD:
;; =============== function _clearLCD ends ============

	signat	_clearLCD,88
	global	i1_pulse
psect	text283,local,class=CODE,delta=2
global __ptext283
__ptext283:

;; *************** function i1_pulse *****************
;; Defined at:
;;		line 14 in file "C:\projects\PIC\voltmeter\voltmeter.c"
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
;;		_clearLCD
;;		_printvoltage
;; This function uses a non-reentrant model
;;
psect	text283
	file	"C:\projects\PIC\voltmeter\voltmeter.c"
	line	14
	global	__size_ofi1_pulse
	__size_ofi1_pulse	equ	__end_ofi1_pulse-i1_pulse
	
i1_pulse:	
	opt	stack 3
; Regs used in i1_pulse: [wreg]
	line	16
	
i1l2462:	
;voltmeter.c: 16: RB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	17
;voltmeter.c: 17: RB6 = 0;
	bcf	(54/8),(54)&7
	line	18
	
i1l2464:	
;voltmeter.c: 18: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??i1_pulse+0)+0+1),f
	movlw	151
movwf	((??i1_pulse+0)+0),f
u291_27:
	decfsz	((??i1_pulse+0)+0),f
	goto	u291_27
	decfsz	((??i1_pulse+0)+0+1),f
	goto	u291_27
	nop2
opt asmopt_on

	line	20
	
i1l719:	
	return
	opt stack 0
GLOBAL	__end_ofi1_pulse
	__end_ofi1_pulse:
;; =============== function i1_pulse ends ============

	signat	i1_pulse,88
	global	_sprintf
psect	text284,local,class=CODE,delta=2
global __ptext284
__ptext284:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> compare@v(5), 
;;  f               1    0[BANK0 ] PTR const unsigned char 
;;		 -> STR_1(3), 
;; Auto vars:     Size  Location     Type
;;  sp              1   13[BANK0 ] PTR unsigned char 
;;		 -> compare@v(5), 
;;  _val            4    9[BANK0 ] struct .
;;  c               1   14[BANK0 ] char 
;;  prec            1    8[BANK0 ] char 
;;  flag            1    7[BANK0 ] unsigned char 
;;  ap              1    6[BANK0 ] PTR void [1]
;;		 -> ?_sprintf(2), 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       3       0       0
;;      Locals:         0       9       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0      15       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_compare
;; This function uses a non-reentrant model
;;
psect	text284
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\doprnt.c"
	line	488
	global	__size_of_sprintf
	__size_of_sprintf	equ	__end_of_sprintf-_sprintf
	
_sprintf:	
	opt	stack 2
; Regs used in _sprintf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;sprintf@sp stored from wreg
	line	537
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@sp)
	
i1l2344:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	i1l2398
	
i1l773:	
	line	542
	
i1l2346:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u264_21
	goto	u264_20
u264_21:
	goto	i1l2352
u264_20:
	line	545
	
i1l2348:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l2350:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	i1l2398
	line	547
	
i1l774:	
	line	552
	
i1l2352:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(sprintf@flag)
	line	638
	goto	i1l2356
	line	640
	
i1l776:	
	line	641
	goto	i1l2400
	line	700
	
i1l778:	
	goto	i1l2358
	line	701
	
i1l779:	
	line	702
	goto	i1l2358
	line	805
	
i1l781:	
	line	816
	goto	i1l2398
	line	825
	
i1l2354:	
	goto	i1l2358
	line	638
	
i1l775:	
	
i1l2356:	
	clrw
	iorlw	01h
	addwf	(sprintf@f),f
	clrw
	iorlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(sprintf@c)
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 105
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    10     6 (average)
; direct_byte   228    16 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	i1l2400
	xorlw	100^0	; case 100
	skipnz
	goto	i1l2358
	xorlw	105^100	; case 105
	skipnz
	goto	i1l2358
	goto	i1l2398

	line	825
	
i1l780:	
	line	1254
	
i1l2358:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
i1l2360:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
i1l2362:	
	btfss	(sprintf@_val+1),7
	goto	u265_21
	goto	u265_20
u265_21:
	goto	i1l2368
u265_20:
	line	1257
	
i1l2364:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
i1l2366:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	i1l2368
	line	1259
	
i1l782:	
	line	1300
	
i1l2368:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
i1l2370:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u266_21
	goto	u266_20
u266_21:
	goto	i1l2374
u266_20:
	goto	i1l2382
	
i1l2372:	
	goto	i1l2382
	line	1301
	
i1l783:	
	
i1l2374:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+1)+0
	fcall	stringdir
	movwf	(??_sprintf+1)+0+1
	movf	1+(??_sprintf+1)+0,w
	subwf	(sprintf@_val+1),w
	skipz
	goto	u267_25
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u267_25:
	skipnc
	goto	u267_21
	goto	u267_20
u267_21:
	goto	i1l2378
u267_20:
	goto	i1l2382
	line	1302
	
i1l2376:	
	goto	i1l2382
	
i1l785:	
	line	1300
	
i1l2378:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
i1l2380:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u268_21
	goto	u268_20
u268_21:
	goto	i1l2374
u268_20:
	goto	i1l2382
	
i1l784:	
	line	1433
	
i1l2382:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u269_21
	goto	u269_20
u269_21:
	goto	i1l2388
u269_20:
	line	1434
	
i1l2384:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l2386:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l2388
	
i1l786:	
	line	1467
	
i1l2388:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	i1l2396
	
i1l788:	
	line	1484
	
i1l2390:	
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(sprintf@prec),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?___lwdiv)
	fcall	stringdir
	movwf	(?___lwdiv+1)
	movf	(sprintf@_val+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(sprintf@_val),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_sprintf+1)+0
	movf	(??_sprintf+1)+0,w
	movwf	(sprintf@c)
	line	1516
	
i1l2392:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l2394:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l2396
	line	1517
	
i1l787:	
	line	1469
	
i1l2396:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u270_21
	goto	u270_20
u270_21:
	goto	i1l2390
u270_20:
	goto	i1l2398
	
i1l789:	
	goto	i1l2398
	line	1525
	
i1l772:	
	line	540
	
i1l2398:	
	clrw
	iorlw	01h
	addwf	(sprintf@f),f
	clrw
	iorlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@c)
	movf	((sprintf@c)),f
	skipz
	goto	u271_21
	goto	u271_20
u271_21:
	goto	i1l2346
u271_20:
	goto	i1l2400
	
i1l790:	
	goto	i1l2400
	line	1527
	
i1l777:	
	line	1530
	
i1l2400:	
	clrc
	movf	(sprintf@sp),w
	movwf	fsr0
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 7	;select IRP bank0
	movwf	indf
	goto	i1l791
	line	1532
	
i1l2402:	
	line	1533
;	Return value of _sprintf is never used
	
i1l791:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	___lwmod
psect	text285,local,class=CODE,delta=2
global __ptext285
__ptext285:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    8[COMMON] unsigned int 
;;  dividend        2   10[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    8[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text285
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 2
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l2440:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u279_21
	goto	u279_20
u279_21:
	goto	i1l2458
u279_20:
	line	9
	
i1l2442:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	i1l2448
	
i1l818:	
	line	11
	
i1l2444:	
	movlw	01h
	
u280_25:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u280_25
	line	12
	
i1l2446:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	i1l2448
	line	13
	
i1l817:	
	line	10
	
i1l2448:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u281_21
	goto	u281_20
u281_21:
	goto	i1l2444
u281_20:
	goto	i1l2450
	
i1l819:	
	goto	i1l2450
	line	14
	
i1l820:	
	line	15
	
i1l2450:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u282_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u282_25:
	skipc
	goto	u282_21
	goto	u282_20
u282_21:
	goto	i1l2454
u282_20:
	line	16
	
i1l2452:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	i1l2454
	
i1l821:	
	line	17
	
i1l2454:	
	movlw	01h
	
u283_25:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u283_25
	line	18
	
i1l2456:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u284_21
	goto	u284_20
u284_21:
	goto	i1l2450
u284_20:
	goto	i1l2458
	
i1l822:	
	goto	i1l2458
	line	19
	
i1l816:	
	line	20
	
i1l2458:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	i1l823
	
i1l2460:	
	line	21
	
i1l823:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text286,local,class=CODE,delta=2
global __ptext286
__ptext286:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text286
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 2
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
i1l2416:	
	movlw	low(0)
	movwf	(___lwdiv@quotient)
	movlw	high(0)
	movwf	((___lwdiv@quotient))+1
	line	10
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u272_21
	goto	u272_20
u272_21:
	goto	i1l2436
u272_20:
	line	11
	
i1l2418:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	i1l2424
	
i1l808:	
	line	13
	
i1l2420:	
	movlw	01h
	
u273_25:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u273_25
	line	14
	
i1l2422:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	i1l2424
	line	15
	
i1l807:	
	line	12
	
i1l2424:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u274_21
	goto	u274_20
u274_21:
	goto	i1l2420
u274_20:
	goto	i1l2426
	
i1l809:	
	goto	i1l2426
	line	16
	
i1l810:	
	line	17
	
i1l2426:	
	movlw	01h
	
u275_25:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u275_25
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u276_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u276_25:
	skipc
	goto	u276_21
	goto	u276_20
u276_21:
	goto	i1l2432
u276_20:
	line	19
	
i1l2428:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
i1l2430:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l2432
	line	21
	
i1l811:	
	line	22
	
i1l2432:	
	movlw	01h
	
u277_25:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u277_25
	line	23
	
i1l2434:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u278_21
	goto	u278_20
u278_21:
	goto	i1l2426
u278_20:
	goto	i1l2436
	
i1l812:	
	goto	i1l2436
	line	24
	
i1l806:	
	line	25
	
i1l2436:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	i1l813
	
i1l2438:	
	line	26
	
i1l813:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
psect	text287,local,class=CODE,delta=2
global __ptext287
__ptext287:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
