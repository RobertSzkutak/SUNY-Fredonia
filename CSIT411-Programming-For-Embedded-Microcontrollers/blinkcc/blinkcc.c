#include <htc.h>
#define _XTAL_FREQ 4000000 //PIC16F690 runs at 4MegaHertz

__CONFIG(UNPROTECT & BORDIS & MCLRDIS & PWRTEN & INTIO & WDTDIS);

/*void interrupt isr(void){

	RC5 = RC5 ^ 1;
	T0IF = 0;//Clear timer 0 interrupt flag
	//INTF = 0;//Ehhhhh this might be the right timer 0 flag
}*/

void main(){
	ANSEL = ANSELH = 0;
	TRISC = 0b11011111;//Set inputs and outputs for port C
	TRISA = 0b11111111;//Set all pins as inputs for port A
	OPTION = 0;
	//OPTION = 0b10000111;//Prescalar of 256
	//T0IE = 1;//Enable Internal Timer 0
	//GIE = 1;//Global Interrupt Enable
	while(1){
		/*
		RC5 = 0;//Light on
		__delay_ms(197);//Highest number of millisecconds you can delay to
		RC5 = 1;//Light off
		__delay_ms(197);
		*/
		
		if(RA2 == 0)//Button is pressed
			RC5 = RC5 ^ 1;//XOR operation to flip bit for toggling effect
		
	}
}