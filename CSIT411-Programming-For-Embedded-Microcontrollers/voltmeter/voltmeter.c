#include <pic.h>
#include <stdio.h> // Used for sprintf

#define _XTAL_FREQ 4000000

__CONFIG(UNPROTECT & BORDIS & MCLRDIS & PWRTEN & INTIO & WDTDIS);

char volts[4] = {'x','.','x','V'};//Characters to be output to the LCD  
char storage[4] = {'x','.','x','V'};//Used to see if whats on the LCD is needed to be refreshed
unsigned short int totalvolt;

//Send a pulse letting the LCD know to begin recieving data
void pulse(void)
{

      RB6 = 1;
      RB6 = 0;          //pulse E line to write data
      __delay_ms(2);

}

//Clear the LCD
void clearLCD() 
{
     
	RB7 = 0;
	__delay_ms(2);
	PORTC = 1;
	pulse();
	RB7 = 1;
	
}

//Prints the voltage on the LCD if the voltage has changed since last time this was printed
void printvoltage(char *digit)
{
     
	char i;
	char refresh = 0;//Do we have new output which requires the LCD to be refreshed?

	if(totalvolt > 100)
    {       
		volts[0] = digit[0];
		volts[2] = digit[1];
	}
 
	else if(totalvolt > 10)
    { 
		volts[0] = '0';
		volts[2] = digit[0];
	}
 
	else 
    {                 
		volts[0] = '0';
		volts[2] = '0';
	}

	for(i=0;i<4;i++) 
    {
		if(storage[i] != volts[i]) 
        {
			refresh = 1;
			break;
		}	
	}
	
	if(refresh == 1)
    {
		clearLCD();
		for(i=0;i<4;i++) 
        {
			PORTC = volts[i];
			pulse();
		}
	}

	for(i=0;i<4;i++) 
    {
		storage[i] = volts[i];
	}
	
}

/* Check each bit stored in ADRESH and ADRESL and if that bit is high add a proportionate
   number to the total count of voltage. Then convert the total voltage to a C string and
   return the C string so that we can output it on the LCD */
char *compare(char high, char low){

    char v[5];
	char temp = high;

	if((temp=(high & 0b00000010)) == 0b00000010)
		totalvolt = totalvolt + 250; 
	if((temp=(high & 0b00000001)) == 0b00000001)
		totalvolt = totalvolt + 125;
	if((temp=(low & 0b10000000)) == 0b10000000)
		totalvolt = totalvolt + 62;
	if((temp=(low & 0b01000000)) == 0b01000000)
		totalvolt = totalvolt + 31; 
	if((temp=(low & 0b00100000)) == 0b00100000)
		totalvolt = totalvolt + 15; 
	if((temp=(low & 0b00010000)) == 0b00010000)
		totalvolt = totalvolt + 8;
	if((temp=(low & 0b00001000)) == 0b00001000)
		totalvolt = totalvolt + 4;
	if((temp=(low & 0b00000100)) == 0b00000100)
		totalvolt = totalvolt +2; 
	if((temp=(low & 0b00000010)) == 0b00000010)
		totalvolt = totalvolt + 1;
	
	if(totalvolt == 499)
		if((temp=(low & 0b00000001)) == 0b00000001)
             totalvolt = totalvolt + 1;

	sprintf(v, "%d", totalvolt);

	return v;
}

void interrupt isr() 
{
 
	char *volt;

	ADIF = 0;
	totalvolt = 0;
	volt = compare(ADRESH, ADRESL);
	printvoltage(volt);
	__delay_ms(30);
	GODONE = 1;

}
 
//Initialize the LCD
void initLCD(void)
{ 

	RB6 = 0;          
	RB7 = 0;          
	__delay_ms(125);  
	PORTC = 0x38;     
	pulse();
	PORTC = 0x0F;     
	pulse();
	PORTC = 1;        
	pulse();
	RB7 = 1;          

}

 void main()
 {

	TRISC  = 0;
	TRISB  = 0;
	TRISA = 0b00000100;
	ANSEL = 0b00000100;
	ANSELH = 0;
	__delay_ms(5);
	initLCD();
	__delay_ms(5);
	GIE     = 1;
	ADIE    = 1;
	INTCON  = 0b11000000;
	ADCON0  = 0b10001001;                  
	ADCON1  = 0b00010000;
	GODONE  = 1;

	while (1);
	
}
