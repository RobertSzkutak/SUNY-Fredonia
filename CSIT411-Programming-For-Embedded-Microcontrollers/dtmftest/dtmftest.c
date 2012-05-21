#include <htc.h>
#define _XTAL_FREQ 4000000

__CONFIG(UNPROTECT & BORDIS & MCLRDIS & PWRTEN & INTIO & WDTDIS);

//RC7 for clock
//RC4 for data
//RC2 for chip enable

void pulse(void){
	RC7 = 0;
	__delay_us(5);
	RC7 = 1;
	__delay_us(5);
}

void main(){
	char i;
	TRISC = 0;
	ANSEL = ANSELH = 0;//Keeps pins digital not analog
	PORTC = 0b10000100;//Makes chip enable and clock high
	__delay_ms(10);
	RC2 = 0;
	__delay_ms(10);//This lets the clock get moving up to speed
	//Send signal to play a tone tone!!
	RC4 = 1;
	pulse();
	RC4 = 0;
	pulse();
	RC4 = 0;
	pulse();
	RC4 = 0;
	pulse();
	RC4 = 0;
	pulse();
	__delay_ms(195);
	//Send signal to turn off chip
	RC4 = 1;
	for (i = 0; i < 5; i++)
		pulse();
	RC2 = 1;
	while(1);
}