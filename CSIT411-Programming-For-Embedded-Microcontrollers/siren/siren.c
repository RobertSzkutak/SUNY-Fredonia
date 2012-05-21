#include <htc.h>
#define _XTAL_FREQ 4000000

__CONFIG(UNPROTECT & BORDIS & MCLRDIS & PWRTEN & INTIO & WDTDIS);

void main(){

	char direction = 0;//1 == increase, 0 == decrease

    ANSEL=ANSELH=0;
    TRISC = 0;
    PR2 = 249;
    T2CON = 0b00000101;
    CCP1CON = 0b00001100;
	CCPR1L = 0b00011111;

	while(1){

		__delay_ms(20);

		if(direction == 1)
			PR2++;
		if(direction == 0)
			PR2--;

		if(PR2 == 249)
			direction = 0;
		if(PR2 == 124)
			direction = 1;

	}

}