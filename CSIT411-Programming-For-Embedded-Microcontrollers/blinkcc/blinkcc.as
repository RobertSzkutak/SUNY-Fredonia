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
# 4 "C:\projects\PIC\blinkcc\blinkcc.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "C:\projects\PIC\blinkcc\blinkcc.c"
	dw 0x3FFF & 0x3CFF & 0x3FDF & 0x3FEF & 0x3FFC & 0x3FF7 ;#
	FNROOT	_main
	global	_RA2
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_RA2	set	42
	global	_RC5
_RC5	set	61
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
	file	"blinkcc.as"
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
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      0       0
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

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      0       0       1        0.0%
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
;;		line 13 in file "C:\projects\PIC\blinkcc\blinkcc.c"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\projects\PIC\blinkcc\blinkcc.c"
	line	13
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2]
	line	14
	
l1082:	
;blinkcc.c: 14: ANSEL = ANSELH = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(287)^0100h	;volatile
	clrf	(286)^0100h	;volatile
	line	15
	
l1084:	
;blinkcc.c: 15: TRISC = 0b11011111;
	movlw	(0DFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	16
	
l1086:	
;blinkcc.c: 16: TRISA = 0b11111111;
	movlw	(0FFh)
	movwf	(133)^080h	;volatile
	line	17
;blinkcc.c: 17: OPTION = 0;
	clrf	(129)^080h	;volatile
	goto	l1088
	line	21
;blinkcc.c: 21: while(1){
	
l709:	
	line	29
	
l1088:	
;blinkcc.c: 29: if(RA2 == 0)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u11
	goto	u10
u11:
	goto	l1088
u10:
	line	30
	
l1090:	
;blinkcc.c: 30: RC5 = RC5 ^ 1;
	movlw	1<<((61)&7)
	xorwf	((61)/8),f
	goto	l1088
	
l710:	
	goto	l1088
	line	32
	
l711:	
	line	21
	goto	l1088
	
l712:	
	line	33
	
l713:	
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
