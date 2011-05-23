#include <htc.h>
#define _XTAL_FREQ 4000000 //PIC16F690 runs at 4MegaHertz

__CONFIG(UNPROTECT & BORDIS & MCLRDIS & PWRTEN & INTIO & WDTDIS);

int count, count2, count3, count4, count5, count6;

void timer();
void button();
void resetcount();
void green1on();
void green1off();
void yellow1on();
void yellow1off();
void red1on();
void red1off();
void green2on();
void green2off();
void yellow2on();
void yellow2off();
void red2on();
void red2off();

void interrupt isr(void){

	if(T0IF)
		timer();
	if(INTF)
		button();
}

void timer() {

	T0IF = 0;//clear flag
	if(count != 0){
		count--;
		return;
	}
	green1off();
	yellow1on();
	if(count2 != 0){
		count2--;
		return;
	}
	yellow1off();
	red1on();
	if(count3 != 0){
		count3--;
		return;
	}
	green2on();
	red2off();
	if(count4 != 0){
		count4--;
		return;
	}
	green2off();
	yellow2on();
	if(count5 != 0){
		count5--;
		return;
	}
	yellow2off();
	red2on();
	if(count6 != 0){
		count6--;
		return;
	}
	red1off();
	green1on();

	resetcount();

}

void button() {

	INTF = 0;//clear flag
	count3 = count6 = 40;

}

void resetcount() {

	count = 24;
	count2 = 16;
	count3 = 8;
	count4 = 24;
	count5 = 16;
	count6 = 8;

}

void green1on(){
	RC5 = 0;
}

void green1off(){
	RC5 = 1;
}

void yellow1on(){
	RC4 = 0;
}

void yellow1off(){
	RC4 = 1;
}

void red1on(){
	RC3 = 0;
}

void red1off(){
	RC3 = 1;
}

void green2on(){
	RC2 = 0;
}

void green2off(){
	RC2 = 1;
}

void yellow2on(){
	RC1 = 0;
}

void yellow2off(){
	RC1 = 1;
}

void red2on(){
	RC0 = 0;
}

void red2off(){
	RC0 = 1;
}

void main(){

	ANSEL = ANSELH = 0;
	TRISC = 0b00000000;//Set inputs and outputs for port C
	TRISA = 0b11111111;//Set all pins as inputs for port A
	OPTION = 0b10000111;//Prescalar of 256
	T0IE = 1;//Enable Internal Timer 0
	INTE = 1;//Enable external interrupt
	GIE = 1;//Global Interrupt Enable

	resetcount();
	green1on();
	green2off();
	yellow1off();
	yellow2off();
	red1off();
	red2on();
	

	while(1){
		
	}
}