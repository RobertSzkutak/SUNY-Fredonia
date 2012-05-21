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
# 4 "C:\projects\PIC\siren\siren.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "C:\projects\PIC\siren\siren.c"
	dw 0x3FFF & 0x3CFF & 0x3FDF & 0x3FEF & 0x3FFC & 0x3FF7 ;#
	FNROOT	_main
	global	_CCP1CON
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_T2CON
_T2CON	set	18
	global	_PR2
_PR2	set	146
	global	_TRISC
_TRISC	set	135
	global	_ANSEL
_ANSEL	set	286
	global	_ANSELH
_ANSELH	set	287
	file	"siren.as"
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
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	2
	global	main@direction
main@direction:	; 1 bytes @ 0x2
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      3       3
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
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
;; (0) _main                                                 3     3      0      30
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      3       3       1       21.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       0       2        0.0%
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
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "C:\projects\PIC\siren\siren.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  direction       1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\projects\PIC\siren\siren.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0]
	line	8
	
l1873:	
;siren.c: 8: char direction = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@direction)
	line	10
	
l1875:	
;siren.c: 10: ANSEL=ANSELH=0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(287)^0100h	;volatile
	clrf	(286)^0100h	;volatile
	line	11
	
l1877:	
;siren.c: 11: TRISC = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	12
	
l1879:	
;siren.c: 12: PR2 = 249;
	movlw	(0F9h)
	movwf	(146)^080h	;volatile
	line	13
	
l1881:	
;siren.c: 13: T2CON = 0b00000101;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	14
	
l1883:	
;siren.c: 14: CCP1CON = 0b00001100;
	movlw	(0Ch)
	movwf	(23)	;volatile
	line	15
	
l1885:	
;siren.c: 15: CCPR1L = 0b00011111;
	movlw	(01Fh)
	movwf	(21)	;volatile
	goto	l1887
	line	17
;siren.c: 17: while(1){
	
l711:	
	line	19
	
l1887:	
;siren.c: 19: _delay((unsigned long)((20)*(4000000/4000.0)));
	opt asmopt_off
movlw	26
movwf	((??_main+0)+0+1),f
	movlw	248
movwf	((??_main+0)+0),f
u2187:
	decfsz	((??_main+0)+0),f
	goto	u2187
	decfsz	((??_main+0)+0+1),f
	goto	u2187
	clrwdt
opt asmopt_on

	line	21
	
l1889:	
;siren.c: 21: if(direction == 1)
	movf	(main@direction),w
	xorlw	01h
	skipz
	goto	u2141
	goto	u2140
u2141:
	goto	l1893
u2140:
	line	22
	
l1891:	
;siren.c: 22: PR2++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(146)^080h,f	;volatile
	goto	l1893
	
l712:	
	line	23
	
l1893:	
;siren.c: 23: if(direction == 0)
	movf	(main@direction),f
	skipz
	goto	u2151
	goto	u2150
u2151:
	goto	l1897
u2150:
	line	24
	
l1895:	
;siren.c: 24: PR2--;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(146)^080h,f	;volatile
	goto	l1897
	
l713:	
	line	26
	
l1897:	
;siren.c: 26: if(PR2 == 249)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(146)^080h,w	;volatile
	xorlw	0F9h
	skipz
	goto	u2161
	goto	u2160
u2161:
	goto	l1901
u2160:
	line	27
	
l1899:	
;siren.c: 27: direction = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@direction)
	goto	l1901
	
l714:	
	line	28
	
l1901:	
;siren.c: 28: if(PR2 == 124)
	movf	(146)^080h,w	;volatile
	xorlw	07Ch
	skipz
	goto	u2171
	goto	u2170
u2171:
	goto	l1887
u2170:
	line	29
	
l1903:	
;siren.c: 29: direction = 1;
	clrf	(main@direction)
	bsf	status,0
	rlf	(main@direction),f
	goto	l1887
	
l715:	
	goto	l1887
	line	31
	
l716:	
	line	17
	goto	l1887
	
l717:	
	line	33
	
l718:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
