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
# 4 "C:\projects\PIC\trafficc\trafficc.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "C:\projects\PIC\trafficc\trafficc.c"
	dw 0x3FFF & 0x3CFF & 0x3FDF & 0x3FEF & 0x3FFC & 0x3FF7 ;#
	FNCALL	_main,_resetcount
	FNCALL	_main,_green1on
	FNCALL	_main,_green2off
	FNCALL	_main,_yellow1off
	FNCALL	_main,_yellow2off
	FNCALL	_main,_red1off
	FNCALL	_main,_red2on
	FNROOT	_main
	FNCALL	_isr,_timer
	FNCALL	_isr,_button
	FNCALL	_timer,_green1off
	FNCALL	_timer,_yellow1on
	FNCALL	_timer,i1_yellow1off
	FNCALL	_timer,_red1on
	FNCALL	_timer,_green2on
	FNCALL	_timer,_red2off
	FNCALL	_timer,i1_green2off
	FNCALL	_timer,_yellow2on
	FNCALL	_timer,i1_yellow2off
	FNCALL	_timer,i1_red2on
	FNCALL	_timer,i1_red1off
	FNCALL	_timer,i1_green1on
	FNCALL	_timer,i1_resetcount
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_count6
psect	nvBANK0,class=BANK0,space=1
global __pnvBANK0
__pnvBANK0:
_count6:
       ds      2

	global	_count
psect	nvCOMMON,class=COMMON,space=1
global __pnvCOMMON
__pnvCOMMON:
_count:
       ds      2

	global	_count2
_count2:
       ds      2

	global	_count3
_count3:
       ds      2

	global	_count4
_count4:
       ds      2

	global	_count5
_count5:
       ds      2

	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
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
	file	"trafficc.as"
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
	global	?_timer
?_timer:	; 0 bytes @ 0x0
	global	??_timer
??_timer:	; 0 bytes @ 0x0
	global	?_button
?_button:	; 0 bytes @ 0x0
	global	??_button
??_button:	; 0 bytes @ 0x0
	global	?_green1off
?_green1off:	; 0 bytes @ 0x0
	global	??_green1off
??_green1off:	; 0 bytes @ 0x0
	global	?_yellow1on
?_yellow1on:	; 0 bytes @ 0x0
	global	??_yellow1on
??_yellow1on:	; 0 bytes @ 0x0
	global	?_yellow1off
?_yellow1off:	; 0 bytes @ 0x0
	global	?_red1on
?_red1on:	; 0 bytes @ 0x0
	global	??_red1on
??_red1on:	; 0 bytes @ 0x0
	global	?_green2on
?_green2on:	; 0 bytes @ 0x0
	global	??_green2on
??_green2on:	; 0 bytes @ 0x0
	global	?_red2off
?_red2off:	; 0 bytes @ 0x0
	global	??_red2off
??_red2off:	; 0 bytes @ 0x0
	global	?_green2off
?_green2off:	; 0 bytes @ 0x0
	global	?_yellow2on
?_yellow2on:	; 0 bytes @ 0x0
	global	??_yellow2on
??_yellow2on:	; 0 bytes @ 0x0
	global	?_yellow2off
?_yellow2off:	; 0 bytes @ 0x0
	global	?_red2on
?_red2on:	; 0 bytes @ 0x0
	global	?_red1off
?_red1off:	; 0 bytes @ 0x0
	global	?_green1on
?_green1on:	; 0 bytes @ 0x0
	global	?_resetcount
?_resetcount:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?i1_resetcount
?i1_resetcount:	; 0 bytes @ 0x0
	global	??i1_resetcount
??i1_resetcount:	; 0 bytes @ 0x0
	global	?i1_green1on
?i1_green1on:	; 0 bytes @ 0x0
	global	??i1_green1on
??i1_green1on:	; 0 bytes @ 0x0
	global	?i1_yellow1off
?i1_yellow1off:	; 0 bytes @ 0x0
	global	??i1_yellow1off
??i1_yellow1off:	; 0 bytes @ 0x0
	global	?i1_red1off
?i1_red1off:	; 0 bytes @ 0x0
	global	??i1_red1off
??i1_red1off:	; 0 bytes @ 0x0
	global	?i1_green2off
?i1_green2off:	; 0 bytes @ 0x0
	global	??i1_green2off
??i1_green2off:	; 0 bytes @ 0x0
	global	?i1_yellow2off
?i1_yellow2off:	; 0 bytes @ 0x0
	global	??i1_yellow2off
??i1_yellow2off:	; 0 bytes @ 0x0
	global	?i1_red2on
?i1_red2on:	; 0 bytes @ 0x0
	global	??i1_red2on
??i1_red2on:	; 0 bytes @ 0x0
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_yellow1off
??_yellow1off:	; 0 bytes @ 0x0
	global	??_green2off
??_green2off:	; 0 bytes @ 0x0
	global	??_yellow2off
??_yellow2off:	; 0 bytes @ 0x0
	global	??_red2on
??_red2on:	; 0 bytes @ 0x0
	global	??_red1off
??_red1off:	; 0 bytes @ 0x0
	global	??_green1on
??_green1on:	; 0 bytes @ 0x0
	global	??_resetcount
??_resetcount:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 12 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4      14
;; BANK0           80      0       2
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
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
;;                         _resetcount
;;                           _green1on
;;                          _green2off
;;                         _yellow1off
;;                         _yellow2off
;;                            _red1off
;;                             _red2on
;; ---------------------------------------------------------------------------------
;; (1) _resetcount                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _green1on                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _red1off                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _red2on                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _yellow2off                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _green2off                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _yellow1off                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _isr                                                  4     4      0       0
;;                                              0 COMMON     4     4      0
;;                              _timer
;;                             _button
;; ---------------------------------------------------------------------------------
;; (3) _timer                                                0     0      0       0
;;                          _green1off
;;                          _yellow1on
;;                       i1_yellow1off
;;                             _red1on
;;                           _green2on
;;                            _red2off
;;                        i1_green2off
;;                          _yellow2on
;;                       i1_yellow2off
;;                           i1_red2on
;;                          i1_red1off
;;                         i1_green1on
;;                       i1_resetcount
;; ---------------------------------------------------------------------------------
;; (4) i1_red2on                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) i1_yellow2off                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) i1_green2off                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) i1_red1off                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) i1_yellow1off                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) i1_green1on                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) i1_resetcount                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _yellow2on                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _red2off                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _green2on                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _red1on                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _yellow1on                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _green1off                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _button                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _resetcount
;;   _green1on
;;   _green2off
;;   _yellow1off
;;   _yellow2off
;;   _red1off
;;   _red2on
;;
;; _isr (ROOT)
;;   _timer
;;     _green1off
;;     _yellow1on
;;     i1_yellow1off
;;     _red1on
;;     _green2on
;;     _red2off
;;     i1_green2off
;;     _yellow2on
;;     i1_yellow2off
;;     i1_red2on
;;     i1_red1off
;;     i1_green1on
;;     i1_resetcount
;;   _button
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      4       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50      0       2       3        2.5%
;;BITBANK1            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;BANK2               50      0       0       7        0.0%
;;ABS                  0      0      10       8        0.0%
;;BITBANK0            50      0       0       9        0.0%
;;DATA                 0      0      17      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 142 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_resetcount
;;		_green1on
;;		_green2off
;;		_yellow1off
;;		_yellow2off
;;		_red1off
;;		_red2on
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	142
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	144
	
l2243:	
;trafficc.c: 144: ANSEL = ANSELH = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(287)^0100h	;volatile
	clrf	(286)^0100h	;volatile
	line	145
;trafficc.c: 145: TRISC = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	146
	
l2245:	
;trafficc.c: 146: TRISA = 0b11111111;
	movlw	(0FFh)
	movwf	(133)^080h	;volatile
	line	147
	
l2247:	
;trafficc.c: 147: OPTION = 0b10000111;
	movlw	(087h)
	movwf	(129)^080h	;volatile
	line	148
	
l2249:	
;trafficc.c: 148: T0IE = 1;
	bsf	(93/8),(93)&7
	line	149
	
l2251:	
;trafficc.c: 149: INTE = 1;
	bsf	(92/8),(92)&7
	line	150
	
l2253:	
;trafficc.c: 150: GIE = 1;
	bsf	(95/8),(95)&7
	line	152
	
l2255:	
;trafficc.c: 152: resetcount();
	fcall	_resetcount
	line	153
	
l2257:	
;trafficc.c: 153: green1on();
	fcall	_green1on
	line	154
	
l2259:	
;trafficc.c: 154: green2off();
	fcall	_green2off
	line	155
	
l2261:	
;trafficc.c: 155: yellow1off();
	fcall	_yellow1off
	line	156
	
l2263:	
;trafficc.c: 156: yellow2off();
	fcall	_yellow2off
	line	157
	
l2265:	
;trafficc.c: 157: red1off();
	fcall	_red1off
	line	158
	
l2267:	
;trafficc.c: 158: red2on();
	fcall	_red2on
	goto	l808
	line	161
;trafficc.c: 161: while(1){
	
l807:	
	line	163
	
l808:	
	line	161
	goto	l808
	
l809:	
	line	164
	
l810:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_resetcount
psect	text846,local,class=CODE,delta=2
global __ptext846
__ptext846:

;; *************** function _resetcount *****************
;; Defined at:
;;		line 83 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text846
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	83
	global	__size_of_resetcount
	__size_of_resetcount	equ	__end_of_resetcount-_resetcount
	
_resetcount:	
	opt	stack 4
; Regs used in _resetcount: [wreg]
	line	85
	
l2241:	
;trafficc.c: 85: count = 24;
	movlw	low(018h)
	movwf	(_count)
	movlw	high(018h)
	movwf	((_count))+1
	line	86
;trafficc.c: 86: count2 = 16;
	movlw	low(010h)
	movwf	(_count2)
	movlw	high(010h)
	movwf	((_count2))+1
	line	87
;trafficc.c: 87: count3 = 8;
	movlw	low(08h)
	movwf	(_count3)
	movlw	high(08h)
	movwf	((_count3))+1
	line	88
;trafficc.c: 88: count4 = 24;
	movlw	low(018h)
	movwf	(_count4)
	movlw	high(018h)
	movwf	((_count4))+1
	line	89
;trafficc.c: 89: count5 = 16;
	movlw	low(010h)
	movwf	(_count5)
	movlw	high(010h)
	movwf	((_count5))+1
	line	90
;trafficc.c: 90: count6 = 8;
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_count6)
	movlw	high(08h)
	movwf	((_count6))+1
	line	92
	
l768:	
	return
	opt stack 0
GLOBAL	__end_of_resetcount
	__end_of_resetcount:
;; =============== function _resetcount ends ============

	signat	_resetcount,88
	global	_green1on
psect	text847,local,class=CODE,delta=2
global __ptext847
__ptext847:

;; *************** function _green1on *****************
;; Defined at:
;;		line 94 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text847
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	94
	global	__size_of_green1on
	__size_of_green1on	equ	__end_of_green1on-_green1on
	
_green1on:	
	opt	stack 4
; Regs used in _green1on: []
	line	95
	
l2239:	
;trafficc.c: 95: RC5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
	line	96
	
l771:	
	return
	opt stack 0
GLOBAL	__end_of_green1on
	__end_of_green1on:
;; =============== function _green1on ends ============

	signat	_green1on,88
	global	_red1off
psect	text848,local,class=CODE,delta=2
global __ptext848
__ptext848:

;; *************** function _red1off *****************
;; Defined at:
;;		line 114 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text848
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	114
	global	__size_of_red1off
	__size_of_red1off	equ	__end_of_red1off-_red1off
	
_red1off:	
	opt	stack 4
; Regs used in _red1off: []
	line	115
	
l2237:	
;trafficc.c: 115: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	116
	
l786:	
	return
	opt stack 0
GLOBAL	__end_of_red1off
	__end_of_red1off:
;; =============== function _red1off ends ============

	signat	_red1off,88
	global	_red2on
psect	text849,local,class=CODE,delta=2
global __ptext849
__ptext849:

;; *************** function _red2on *****************
;; Defined at:
;;		line 134 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text849
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	134
	global	__size_of_red2on
	__size_of_red2on	equ	__end_of_red2on-_red2on
	
_red2on:	
	opt	stack 4
; Regs used in _red2on: []
	line	135
	
l2235:	
;trafficc.c: 135: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	136
	
l801:	
	return
	opt stack 0
GLOBAL	__end_of_red2on
	__end_of_red2on:
;; =============== function _red2on ends ============

	signat	_red2on,88
	global	_yellow2off
psect	text850,local,class=CODE,delta=2
global __ptext850
__ptext850:

;; *************** function _yellow2off *****************
;; Defined at:
;;		line 130 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text850
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	130
	global	__size_of_yellow2off
	__size_of_yellow2off	equ	__end_of_yellow2off-_yellow2off
	
_yellow2off:	
	opt	stack 4
; Regs used in _yellow2off: []
	line	131
	
l2233:	
;trafficc.c: 131: RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	line	132
	
l798:	
	return
	opt stack 0
GLOBAL	__end_of_yellow2off
	__end_of_yellow2off:
;; =============== function _yellow2off ends ============

	signat	_yellow2off,88
	global	_green2off
psect	text851,local,class=CODE,delta=2
global __ptext851
__ptext851:

;; *************** function _green2off *****************
;; Defined at:
;;		line 122 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text851
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	122
	global	__size_of_green2off
	__size_of_green2off	equ	__end_of_green2off-_green2off
	
_green2off:	
	opt	stack 4
; Regs used in _green2off: []
	line	123
	
l2231:	
;trafficc.c: 123: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	124
	
l792:	
	return
	opt stack 0
GLOBAL	__end_of_green2off
	__end_of_green2off:
;; =============== function _green2off ends ============

	signat	_green2off,88
	global	_yellow1off
psect	text852,local,class=CODE,delta=2
global __ptext852
__ptext852:

;; *************** function _yellow1off *****************
;; Defined at:
;;		line 106 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text852
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	106
	global	__size_of_yellow1off
	__size_of_yellow1off	equ	__end_of_yellow1off-_yellow1off
	
_yellow1off:	
	opt	stack 4
; Regs used in _yellow1off: []
	line	107
	
l2229:	
;trafficc.c: 107: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	108
	
l780:	
	return
	opt stack 0
GLOBAL	__end_of_yellow1off
	__end_of_yellow1off:
;; =============== function _yellow1off ends ============

	signat	_yellow1off,88
	global	_isr
psect	text853,local,class=CODE,delta=2
global __ptext853
__ptext853:

;; *************** function _isr *****************
;; Defined at:
;;		line 24 in file "C:\projects\PIC\trafficc\trafficc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0
;;      Temps:          4       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_timer
;;		_button
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text853
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	24
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 4
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
	movwf	(??_isr+0)
	movf	fsr0,w
	movwf	(??_isr+1)
	movf	pclath,w
	movwf	(??_isr+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr+3)
	ljmp	_isr
psect	text853
	line	26
	
i1l2111:	
;trafficc.c: 26: if(T0IF)
	btfss	(90/8),(90)&7
	goto	u222_21
	goto	u222_20
u222_21:
	goto	i1l2115
u222_20:
	line	27
	
i1l2113:	
;trafficc.c: 27: timer();
	fcall	_timer
	goto	i1l2115
	
i1l751:	
	line	28
	
i1l2115:	
;trafficc.c: 28: if(INTF)
	btfss	(89/8),(89)&7
	goto	u223_21
	goto	u223_20
u223_21:
	goto	i1l753
u223_20:
	line	29
	
i1l2117:	
;trafficc.c: 29: button();
	fcall	_button
	goto	i1l753
	
i1l752:	
	line	30
	
i1l753:	
	movf	(??_isr+3),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_isr+2),w
	movwf	pclath
	movf	(??_isr+1),w
	movwf	fsr0
	movf	(??_isr+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
	global	_timer
psect	text854,local,class=CODE,delta=2
global __ptext854
__ptext854:

;; *************** function _timer *****************
;; Defined at:
;;		line 32 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_green1off
;;		_yellow1on
;;		i1_yellow1off
;;		_red1on
;;		_green2on
;;		_red2off
;;		i1_green2off
;;		_yellow2on
;;		i1_yellow2off
;;		i1_red2on
;;		i1_red1off
;;		i1_green1on
;;		i1_resetcount
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text854
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	32
	global	__size_of_timer
	__size_of_timer	equ	__end_of_timer-_timer
	
_timer:	
	opt	stack 4
; Regs used in _timer: [wreg+status,2+status,0+pclath+cstack]
	line	34
	
i1l2119:	
;trafficc.c: 34: T0IF = 0;
	bcf	(90/8),(90)&7
	line	35
	
i1l2121:	
;trafficc.c: 35: if(count != 0){
	movf	(_count+1),w
	iorwf	(_count),w
	skipnz
	goto	u224_21
	goto	u224_20
u224_21:
	goto	i1l2127
u224_20:
	line	36
	
i1l2123:	
;trafficc.c: 36: count--;
	movlw	low(-1)
	addwf	(_count),f
	skipnc
	incf	(_count+1),f
	movlw	high(-1)
	addwf	(_count+1),f
	goto	i1l757
	line	37
	
i1l2125:	
;trafficc.c: 37: return;
	goto	i1l757
	line	38
	
i1l756:	
	line	39
	
i1l2127:	
;trafficc.c: 38: }
;trafficc.c: 39: green1off();
	fcall	_green1off
	line	40
;trafficc.c: 40: yellow1on();
	fcall	_yellow1on
	line	41
	
i1l2129:	
;trafficc.c: 41: if(count2 != 0){
	movf	(_count2+1),w
	iorwf	(_count2),w
	skipnz
	goto	u225_21
	goto	u225_20
u225_21:
	goto	i1l2135
u225_20:
	line	42
	
i1l2131:	
;trafficc.c: 42: count2--;
	movlw	low(-1)
	addwf	(_count2),f
	skipnc
	incf	(_count2+1),f
	movlw	high(-1)
	addwf	(_count2+1),f
	goto	i1l757
	line	43
	
i1l2133:	
;trafficc.c: 43: return;
	goto	i1l757
	line	44
	
i1l758:	
	line	45
	
i1l2135:	
;trafficc.c: 44: }
;trafficc.c: 45: yellow1off();
	fcall	i1_yellow1off
	line	46
;trafficc.c: 46: red1on();
	fcall	_red1on
	line	47
	
i1l2137:	
;trafficc.c: 47: if(count3 != 0){
	movf	(_count3+1),w
	iorwf	(_count3),w
	skipnz
	goto	u226_21
	goto	u226_20
u226_21:
	goto	i1l2143
u226_20:
	line	48
	
i1l2139:	
;trafficc.c: 48: count3--;
	movlw	low(-1)
	addwf	(_count3),f
	skipnc
	incf	(_count3+1),f
	movlw	high(-1)
	addwf	(_count3+1),f
	goto	i1l757
	line	49
	
i1l2141:	
;trafficc.c: 49: return;
	goto	i1l757
	line	50
	
i1l759:	
	line	51
	
i1l2143:	
;trafficc.c: 50: }
;trafficc.c: 51: green2on();
	fcall	_green2on
	line	52
;trafficc.c: 52: red2off();
	fcall	_red2off
	line	53
	
i1l2145:	
;trafficc.c: 53: if(count4 != 0){
	movf	(_count4+1),w
	iorwf	(_count4),w
	skipnz
	goto	u227_21
	goto	u227_20
u227_21:
	goto	i1l2151
u227_20:
	line	54
	
i1l2147:	
;trafficc.c: 54: count4--;
	movlw	low(-1)
	addwf	(_count4),f
	skipnc
	incf	(_count4+1),f
	movlw	high(-1)
	addwf	(_count4+1),f
	goto	i1l757
	line	55
	
i1l2149:	
;trafficc.c: 55: return;
	goto	i1l757
	line	56
	
i1l760:	
	line	57
	
i1l2151:	
;trafficc.c: 56: }
;trafficc.c: 57: green2off();
	fcall	i1_green2off
	line	58
;trafficc.c: 58: yellow2on();
	fcall	_yellow2on
	line	59
	
i1l2153:	
;trafficc.c: 59: if(count5 != 0){
	movf	(_count5+1),w
	iorwf	(_count5),w
	skipnz
	goto	u228_21
	goto	u228_20
u228_21:
	goto	i1l2159
u228_20:
	line	60
	
i1l2155:	
;trafficc.c: 60: count5--;
	movlw	low(-1)
	addwf	(_count5),f
	skipnc
	incf	(_count5+1),f
	movlw	high(-1)
	addwf	(_count5+1),f
	goto	i1l757
	line	61
	
i1l2157:	
;trafficc.c: 61: return;
	goto	i1l757
	line	62
	
i1l761:	
	line	63
	
i1l2159:	
;trafficc.c: 62: }
;trafficc.c: 63: yellow2off();
	fcall	i1_yellow2off
	line	64
;trafficc.c: 64: red2on();
	fcall	i1_red2on
	line	65
	
i1l2161:	
;trafficc.c: 65: if(count6 != 0){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_count6+1),w
	iorwf	(_count6),w
	skipnz
	goto	u229_21
	goto	u229_20
u229_21:
	goto	i1l2167
u229_20:
	line	66
	
i1l2163:	
;trafficc.c: 66: count6--;
	movlw	low(-1)
	addwf	(_count6),f
	skipnc
	incf	(_count6+1),f
	movlw	high(-1)
	addwf	(_count6+1),f
	goto	i1l757
	line	67
	
i1l2165:	
;trafficc.c: 67: return;
	goto	i1l757
	line	68
	
i1l762:	
	line	69
	
i1l2167:	
;trafficc.c: 68: }
;trafficc.c: 69: red1off();
	fcall	i1_red1off
	line	70
;trafficc.c: 70: green1on();
	fcall	i1_green1on
	line	72
	
i1l2169:	
;trafficc.c: 72: resetcount();
	fcall	i1_resetcount
	line	74
	
i1l757:	
	return
	opt stack 0
GLOBAL	__end_of_timer
	__end_of_timer:
;; =============== function _timer ends ============

	signat	_timer,88
	global	i1_red2on
psect	text855,local,class=CODE,delta=2
global __ptext855
__ptext855:

;; *************** function i1_red2on *****************
;; Defined at:
;;		line 134 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text855
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	134
	global	__size_ofi1_red2on
	__size_ofi1_red2on	equ	__end_ofi1_red2on-i1_red2on
	
i1_red2on:	
	opt	stack 4
; Regs used in i1_red2on: []
	line	135
	
i1l2201:	
;trafficc.c: 135: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	136
	
i1l801:	
	return
	opt stack 0
GLOBAL	__end_ofi1_red2on
	__end_ofi1_red2on:
;; =============== function i1_red2on ends ============

	signat	i1_red2on,88
	global	i1_yellow2off
psect	text856,local,class=CODE,delta=2
global __ptext856
__ptext856:

;; *************** function i1_yellow2off *****************
;; Defined at:
;;		line 130 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text856
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	130
	global	__size_ofi1_yellow2off
	__size_ofi1_yellow2off	equ	__end_ofi1_yellow2off-i1_yellow2off
	
i1_yellow2off:	
	opt	stack 4
; Regs used in i1_yellow2off: []
	line	131
	
i1l2199:	
;trafficc.c: 131: RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	line	132
	
i1l798:	
	return
	opt stack 0
GLOBAL	__end_ofi1_yellow2off
	__end_ofi1_yellow2off:
;; =============== function i1_yellow2off ends ============

	signat	i1_yellow2off,88
	global	i1_green2off
psect	text857,local,class=CODE,delta=2
global __ptext857
__ptext857:

;; *************** function i1_green2off *****************
;; Defined at:
;;		line 122 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text857
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	122
	global	__size_ofi1_green2off
	__size_ofi1_green2off	equ	__end_ofi1_green2off-i1_green2off
	
i1_green2off:	
	opt	stack 4
; Regs used in i1_green2off: []
	line	123
	
i1l2197:	
;trafficc.c: 123: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	124
	
i1l792:	
	return
	opt stack 0
GLOBAL	__end_ofi1_green2off
	__end_ofi1_green2off:
;; =============== function i1_green2off ends ============

	signat	i1_green2off,88
	global	i1_red1off
psect	text858,local,class=CODE,delta=2
global __ptext858
__ptext858:

;; *************** function i1_red1off *****************
;; Defined at:
;;		line 114 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text858
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	114
	global	__size_ofi1_red1off
	__size_ofi1_red1off	equ	__end_ofi1_red1off-i1_red1off
	
i1_red1off:	
	opt	stack 4
; Regs used in i1_red1off: []
	line	115
	
i1l2195:	
;trafficc.c: 115: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	116
	
i1l786:	
	return
	opt stack 0
GLOBAL	__end_ofi1_red1off
	__end_ofi1_red1off:
;; =============== function i1_red1off ends ============

	signat	i1_red1off,88
	global	i1_yellow1off
psect	text859,local,class=CODE,delta=2
global __ptext859
__ptext859:

;; *************** function i1_yellow1off *****************
;; Defined at:
;;		line 106 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text859
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	106
	global	__size_ofi1_yellow1off
	__size_ofi1_yellow1off	equ	__end_ofi1_yellow1off-i1_yellow1off
	
i1_yellow1off:	
	opt	stack 4
; Regs used in i1_yellow1off: []
	line	107
	
i1l2193:	
;trafficc.c: 107: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	108
	
i1l780:	
	return
	opt stack 0
GLOBAL	__end_ofi1_yellow1off
	__end_ofi1_yellow1off:
;; =============== function i1_yellow1off ends ============

	signat	i1_yellow1off,88
	global	i1_green1on
psect	text860,local,class=CODE,delta=2
global __ptext860
__ptext860:

;; *************** function i1_green1on *****************
;; Defined at:
;;		line 94 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text860
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	94
	global	__size_ofi1_green1on
	__size_ofi1_green1on	equ	__end_ofi1_green1on-i1_green1on
	
i1_green1on:	
	opt	stack 4
; Regs used in i1_green1on: []
	line	95
	
i1l2191:	
;trafficc.c: 95: RC5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
	line	96
	
i1l771:	
	return
	opt stack 0
GLOBAL	__end_ofi1_green1on
	__end_ofi1_green1on:
;; =============== function i1_green1on ends ============

	signat	i1_green1on,88
	global	i1_resetcount
psect	text861,local,class=CODE,delta=2
global __ptext861
__ptext861:

;; *************** function i1_resetcount *****************
;; Defined at:
;;		line 83 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text861
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	83
	global	__size_ofi1_resetcount
	__size_ofi1_resetcount	equ	__end_ofi1_resetcount-i1_resetcount
	
i1_resetcount:	
	opt	stack 4
; Regs used in i1_resetcount: [wreg]
	line	85
	
i1l2189:	
;trafficc.c: 85: count = 24;
	movlw	low(018h)
	movwf	(_count)
	movlw	high(018h)
	movwf	((_count))+1
	line	86
;trafficc.c: 86: count2 = 16;
	movlw	low(010h)
	movwf	(_count2)
	movlw	high(010h)
	movwf	((_count2))+1
	line	87
;trafficc.c: 87: count3 = 8;
	movlw	low(08h)
	movwf	(_count3)
	movlw	high(08h)
	movwf	((_count3))+1
	line	88
;trafficc.c: 88: count4 = 24;
	movlw	low(018h)
	movwf	(_count4)
	movlw	high(018h)
	movwf	((_count4))+1
	line	89
;trafficc.c: 89: count5 = 16;
	movlw	low(010h)
	movwf	(_count5)
	movlw	high(010h)
	movwf	((_count5))+1
	line	90
;trafficc.c: 90: count6 = 8;
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_count6)
	movlw	high(08h)
	movwf	((_count6))+1
	line	92
	
i1l768:	
	return
	opt stack 0
GLOBAL	__end_ofi1_resetcount
	__end_ofi1_resetcount:
;; =============== function i1_resetcount ends ============

	signat	i1_resetcount,88
	global	_yellow2on
psect	text862,local,class=CODE,delta=2
global __ptext862
__ptext862:

;; *************** function _yellow2on *****************
;; Defined at:
;;		line 126 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text862
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	126
	global	__size_of_yellow2on
	__size_of_yellow2on	equ	__end_of_yellow2on-_yellow2on
	
_yellow2on:	
	opt	stack 4
; Regs used in _yellow2on: []
	line	127
	
i1l2185:	
;trafficc.c: 127: RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(57/8),(57)&7
	line	128
	
i1l795:	
	return
	opt stack 0
GLOBAL	__end_of_yellow2on
	__end_of_yellow2on:
;; =============== function _yellow2on ends ============

	signat	_yellow2on,88
	global	_red2off
psect	text863,local,class=CODE,delta=2
global __ptext863
__ptext863:

;; *************** function _red2off *****************
;; Defined at:
;;		line 138 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text863
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	138
	global	__size_of_red2off
	__size_of_red2off	equ	__end_of_red2off-_red2off
	
_red2off:	
	opt	stack 4
; Regs used in _red2off: []
	line	139
	
i1l2183:	
;trafficc.c: 139: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	140
	
i1l804:	
	return
	opt stack 0
GLOBAL	__end_of_red2off
	__end_of_red2off:
;; =============== function _red2off ends ============

	signat	_red2off,88
	global	_green2on
psect	text864,local,class=CODE,delta=2
global __ptext864
__ptext864:

;; *************** function _green2on *****************
;; Defined at:
;;		line 118 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text864
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	118
	global	__size_of_green2on
	__size_of_green2on	equ	__end_of_green2on-_green2on
	
_green2on:	
	opt	stack 4
; Regs used in _green2on: []
	line	119
	
i1l2181:	
;trafficc.c: 119: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	120
	
i1l789:	
	return
	opt stack 0
GLOBAL	__end_of_green2on
	__end_of_green2on:
;; =============== function _green2on ends ============

	signat	_green2on,88
	global	_red1on
psect	text865,local,class=CODE,delta=2
global __ptext865
__ptext865:

;; *************** function _red1on *****************
;; Defined at:
;;		line 110 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text865
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	110
	global	__size_of_red1on
	__size_of_red1on	equ	__end_of_red1on-_red1on
	
_red1on:	
	opt	stack 4
; Regs used in _red1on: []
	line	111
	
i1l2179:	
;trafficc.c: 111: RC3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	112
	
i1l783:	
	return
	opt stack 0
GLOBAL	__end_of_red1on
	__end_of_red1on:
;; =============== function _red1on ends ============

	signat	_red1on,88
	global	_yellow1on
psect	text866,local,class=CODE,delta=2
global __ptext866
__ptext866:

;; *************** function _yellow1on *****************
;; Defined at:
;;		line 102 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text866
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	102
	global	__size_of_yellow1on
	__size_of_yellow1on	equ	__end_of_yellow1on-_yellow1on
	
_yellow1on:	
	opt	stack 4
; Regs used in _yellow1on: []
	line	103
	
i1l2177:	
;trafficc.c: 103: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	104
	
i1l777:	
	return
	opt stack 0
GLOBAL	__end_of_yellow1on
	__end_of_yellow1on:
;; =============== function _yellow1on ends ============

	signat	_yellow1on,88
	global	_green1off
psect	text867,local,class=CODE,delta=2
global __ptext867
__ptext867:

;; *************** function _green1off *****************
;; Defined at:
;;		line 98 in file "C:\projects\PIC\trafficc\trafficc.c"
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
;;		_timer
;; This function uses a non-reentrant model
;;
psect	text867
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	98
	global	__size_of_green1off
	__size_of_green1off	equ	__end_of_green1off-_green1off
	
_green1off:	
	opt	stack 4
; Regs used in _green1off: []
	line	99
	
i1l2175:	
;trafficc.c: 99: RC5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	line	100
	
i1l774:	
	return
	opt stack 0
GLOBAL	__end_of_green1off
	__end_of_green1off:
;; =============== function _green1off ends ============

	signat	_green1off,88
	global	_button
psect	text868,local,class=CODE,delta=2
global __ptext868
__ptext868:

;; *************** function _button *****************
;; Defined at:
;;		line 76 in file "C:\projects\PIC\trafficc\trafficc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
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
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text868
	file	"C:\projects\PIC\trafficc\trafficc.c"
	line	76
	global	__size_of_button
	__size_of_button	equ	__end_of_button-_button
	
_button:	
	opt	stack 5
; Regs used in _button: [wreg+status,2+status,0]
	line	78
	
i1l2171:	
;trafficc.c: 78: INTF = 0;
	bcf	(89/8),(89)&7
	line	79
	
i1l2173:	
;trafficc.c: 79: count3 = count6 = 40;
	movlw	low(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_count6)
	movlw	high(028h)
	movwf	((_count6))+1
	movf	((_count6+1)),w
	clrf	(_count3+1)
	addwf	(_count3+1)
	movf	((_count6)),w
	clrf	(_count3)
	addwf	(_count3)

	line	81
	
i1l765:	
	return
	opt stack 0
GLOBAL	__end_of_button
	__end_of_button:
;; =============== function _button ends ============

	signat	_button,88
psect	text869,local,class=CODE,delta=2
global __ptext869
__ptext869:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
