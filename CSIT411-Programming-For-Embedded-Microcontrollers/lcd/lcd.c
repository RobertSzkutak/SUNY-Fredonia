#include <pic.h>
#define _XTAL_FREQ 4000000


 

__CONFIG(UNPROTECT & BORDIS & MCLRDIS & PWRTEN & INTIO & WDTDIS);

 

void pulse(void){

      RB6 = 1;

      RB6 = 0;          //pulse E line to write data

      __delay_ms(2);

}

 

void initLCD(void){

      RB6 = 0;          //set E low  (disable write)

      RB7 = 0;          //set RS low (command)

      __delay_ms(125);  //wait for display to power up

      PORTC = 0x38;  //set 8 bit, 2 lines, 5x7 matrix

      pulse();

      PORTC = 0x0F;           //display on, cursor on, cursor blinking

      pulse();

      PORTC = 1;  //clear display

      pulse();

      RB7 = 1;          //switch to data mode

}

 void main(){

      char i;

      char text[] = {'H','e','l','l','o',' ','W','o','r','l','d','!'};

      TRISC = 0;

      TRISB = 0;

      ANSEL = 0;

      ANSELH = 0;

      __delay_ms(5);

      initLCD();

      for (i=0; i<12; i++){

            PORTC = text[i];

            pulse();

      }

      while (1);

}