#include <iostream>

#define useavalue 1

using namespace std;

void GiveMeTehBinary(char bin);

         int main(){
         
         #ifdef useavalue
         char b = 'a';
         #else
         char b = '\0';   
         #endif 
         
         GiveMeTehBinary(b);
         
         system("pause");
         
         return 0;
         
         }
         
         void GiveMeTehBinary(char bin){
             
         long s;
                      
         for (int i = 0; i < 8; i++){
             
             s = bin >> i;
             
             cout << s%2;
             
             }
             
             cout << endl << endl;
         
             
         }
