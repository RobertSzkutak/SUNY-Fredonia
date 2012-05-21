#include <htc.h>
#define _XTAL_FREQ 4000000

__CONFIG(UNPROTECT & BORDIS & MCLRDIS & PWRTEN & INTIO & WDTDIS);

void interrupt isr(){

		ADIF = 0;
        //PR2 = ADRESH / 2;
		//PR2 = 250 - ADRESH / 2;
		PR2 = 124 + (ADRESH / 2);
		if(PR2 > 249)
	    	PR2 = 249;
        GODONE =1;

}

void main (){

	ANSELH = 0;
	ANSEL = 0b10000000;
	TRISC = 0b11011111;
	TRISB = 0;                        
	INTCON = 0b11000000;
	ADIE = 1;
	ADCON0 = 0b00011101;                  
	ADCON1 = 0b00010000;
	GODONE = 1;
    T2CON = 0b00000101;
    CCP1CON = 0b00001100;
	CCPR1L = 0b00011111;

	while(1);

}