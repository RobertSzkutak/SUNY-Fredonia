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

void playTone(char tone){
	char i;
	if(tone == 1 || tone == 3 || tone == 5 || tone == 7 || tone == 9)
		RC4 = 1;
	if(tone == 0 || tone == 2 || tone == 4 || tone == 6 || tone == 8)
		RC4 = 0;
	pulse();
	if(tone == 0 || tone == 2 || tone == 3 || tone == 6 || tone == 7)
		RC4 = 1;
	if(tone == 1 || tone == 4 || tone == 5 || tone == 8 || tone == 9)
		RC4 = 0;
	pulse();
	if(tone == 4 || tone == 5 || tone == 6 || tone == 7)
		RC4 = 1;
	if(tone == 0 || tone == 1 || tone == 2 || tone == 3 || tone == 8 || tone == 9)
		RC4 = 0;
	pulse();
	if(tone == 8 || tone == 9 || tone == 0)
		RC4 = 1;
	if(tone < 8)
		RC4 = 0;
	pulse();
	RC4 = 0;
	pulse();

	__delay_ms(195);
	RC4 = 1;
	for (i = 0; i < 5; i++)
		pulse();
	__delay_ms(195);

}

char dialNumber(char state){
	if(state == 0){
		playTone(6);
	}
	if(state == 1){
		playTone(7);
	}
	if(state == 2){
		playTone(3);
	}
	if(state == 3){
		playTone(3);
	}
	if(state == 4){
		playTone(8);
	}
	if(state == 5){
		playTone(6);
	}
	if(state == 6){
		playTone(9);
	}
	state++;
	if(state > 6)
		state = 0;
	return state;
}

void main(){
	char i, state, debounce;
	i = state = debounce = 0;
	ANSEL = ANSELH = 0;
	TRISC = 0;
	TRISA = 0b11111111;
	OPTION = 0;
	PORTC = 0b10000100;//Makes chip enable and clock high
	__delay_ms(10);
	RC2 = 0;
	__delay_ms(10);//This lets the clock get moving up to speed
	
	while(1){
		if(RA2 == 0 && debounce == 1){
			state = dialNumber(state);
			debounce = 0;
		}
		if(RA2 == 1){
			debounce = 1;
		}
	}
}