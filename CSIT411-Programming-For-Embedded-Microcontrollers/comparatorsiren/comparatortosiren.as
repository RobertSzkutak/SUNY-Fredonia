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
# 4 "C:\projects\PIC\comparatorsiren\comparatorsiren.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "C:\projects\PIC\comparatorsiren\comparatorsiren.c"
	dw 0x3FFF & 0x3CFF & 0x3FDF & 0x3FEF & 0x3FFC & 0x3FF7 ;#
	FNROOT	_main
	FNCALL	_isr,___awdiv
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_ADCON0
psect	text94,local,class=CODE,delta=2
global __ptext94
__ptext94:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_INTCON
_INTCON	set	11
	global	_T2CON
_T2CON	set	18
	global	_ADIF
_ADIF	set	102
	global	_GODONE
_GODONE	set	249
	global	_ADCON1
_ADCON1	set	159
	global	_PR2
_PR2	set	146
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
	file	"comparatortosiren.as"
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
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	ds	2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	ds	6
	global	??_main
??_main:	; 0 bytes @ 0x6
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80      6       6
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   _isr->___awdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (1) _isr                                                  6     6      0     195
;;                                              0 BANK0      6     6      0
;;                            ___awdiv
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     195
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;
;; _isr (ROOT)
;;   ___awdiv
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       9       1       64.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50      6       6       3        7.5%
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
;;		line 17 in file "C:\projects\PIC\comparatorsiren\comparatorsiren.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\projects\PIC\comparatorsiren\comparatorsiren.c"
	line	17
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2]
	line	19
	
l1929:	
;comparatorsiren.c: 19: ANSELH = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(287)^0100h	;volatile
	line	20
	
l1931:	
;comparatorsiren.c: 20: ANSEL = 0b10000000;
	movlw	(080h)
	movwf	(286)^0100h	;volatile
	line	21
	
l1933:	
;comparatorsiren.c: 21: TRISC = 0b11011111;
	movlw	(0DFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	22
;comparatorsiren.c: 22: TRISB = 0;
	clrf	(134)^080h	;volatile
	line	23
	
l1935:	
;comparatorsiren.c: 23: INTCON = 0b11000000;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	24
	
l1937:	
;comparatorsiren.c: 24: ADIE = 1;
	bsf	(1126/8)^080h,(1126)&7
	line	25
	
l1939:	
;comparatorsiren.c: 25: ADCON0 = 0b00011101;
	movlw	(01Dh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	26
	
l1941:	
;comparatorsiren.c: 26: ADCON1 = 0b00010000;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	27
	
l1943:	
;comparatorsiren.c: 27: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	28
	
l1945:	
;comparatorsiren.c: 28: T2CON = 0b00000101;
	movlw	(05h)
	movwf	(18)	;volatile
	line	29
	
l1947:	
;comparatorsiren.c: 29: CCP1CON = 0b00001100;
	movlw	(0Ch)
	movwf	(23)	;volatile
	line	30
	
l1949:	
;comparatorsiren.c: 30: CCPR1L = 0b00011111;
	movlw	(01Fh)
	movwf	(21)	;volatile
	goto	l714
	line	32
;comparatorsiren.c: 32: while(1);
	
l713:	
	
l714:	
	goto	l714
	
l715:	
	line	34
	
l716:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_isr
psect	text95,local,class=CODE,delta=2
global __ptext95
__ptext95:

;; *************** function _isr *****************
;; Defined at:
;;		line 6 in file "C:\projects\PIC\comparatorsiren\comparatorsiren.c"
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
;;      Temps:          0       6       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awdiv
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text95
	file	"C:\projects\PIC\comparatorsiren\comparatorsiren.c"
	line	6
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 6
; Regs used in _isr: [wreg+status,2+status,0+pclath+cstack]
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
psect	text95
	line	8
	
i1l1919:	
;comparatorsiren.c: 8: ADIF = 0;
	bcf	(102/8),(102)&7
	line	10
	
i1l1921:	
;comparatorsiren.c: 10: PR2 = 124 + (ADRESH / 2);
	movlw	low(02h)
	movwf	(?___awdiv)
	movlw	high(02h)
	movwf	((?___awdiv))+1
	movf	(30),w	;volatile
	movwf	(??_isr+0)+0
	clrf	(??_isr+0)+0+1
	movf	0+(??_isr+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_isr+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	07Ch
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	11
	
i1l1923:	
;comparatorsiren.c: 11: if(PR2 > 249)
	movlw	(0FAh)
	subwf	(146)^080h,w	;volatile
	skipc
	goto	u215_21
	goto	u215_20
u215_21:
	goto	i1l1927
u215_20:
	line	12
	
i1l1925:	
;comparatorsiren.c: 12: PR2 = 249;
	movlw	(0F9h)
	movwf	(146)^080h	;volatile
	goto	i1l1927
	
i1l709:	
	line	13
	
i1l1927:	
;comparatorsiren.c: 13: GODONE =1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	15
	
i1l710:	
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
	global	___awdiv
psect	text96,local,class=CODE,delta=2
global __ptext96
__ptext96:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         4       0       0       0
;;      Locals:         4       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text96
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.80\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
i1l1477:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___awdiv@sign)
	line	10
	
i1l1479:	
	btfss	(___awdiv@divisor+1),7
	goto	u102_21
	goto	u102_20
u102_21:
	goto	i1l1483
u102_20:
	line	11
	
i1l1481:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	i1l1483
	line	13
	
i1l865:	
	line	14
	
i1l1483:	
	btfss	(___awdiv@dividend+1),7
	goto	u103_21
	goto	u103_20
u103_21:
	goto	i1l866
u103_20:
	line	15
	
i1l1485:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
i1l1487:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	line	17
	
i1l866:	
	line	18
	movlw	low(0)
	movwf	(___awdiv@quotient)
	movlw	high(0)
	movwf	((___awdiv@quotient))+1
	line	19
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u104_21
	goto	u104_20
u104_21:
	goto	i1l1507
u104_20:
	line	20
	
i1l1489:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	i1l1495
	
i1l869:	
	line	22
	
i1l1491:	
	movlw	01h
	
u105_25:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u105_25
	line	23
	
i1l1493:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	i1l1495
	line	24
	
i1l868:	
	line	21
	
i1l1495:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u106_21
	goto	u106_20
u106_21:
	goto	i1l1491
u106_20:
	goto	i1l1497
	
i1l870:	
	goto	i1l1497
	line	25
	
i1l871:	
	line	26
	
i1l1497:	
	movlw	01h
	
u107_25:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u107_25
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u108_25
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u108_25:
	skipc
	goto	u108_21
	goto	u108_20
u108_21:
	goto	i1l1503
u108_20:
	line	28
	
i1l1499:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
i1l1501:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	i1l1503
	line	30
	
i1l872:	
	line	31
	
i1l1503:	
	movlw	01h
	
u109_25:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u109_25
	line	32
	
i1l1505:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u110_21
	goto	u110_20
u110_21:
	goto	i1l1497
u110_20:
	goto	i1l1507
	
i1l873:	
	goto	i1l1507
	line	33
	
i1l867:	
	line	34
	
i1l1507:	
	movf	(___awdiv@sign),w
	skipz
	goto	u111_20
	goto	i1l1511
u111_20:
	line	35
	
i1l1509:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	i1l1511
	
i1l874:	
	line	36
	
i1l1511:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	i1l875
	
i1l1513:	
	line	37
	
i1l875:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
psect	text97,local,class=CODE,delta=2
global __ptext97
__ptext97:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
