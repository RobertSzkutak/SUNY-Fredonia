#include <iostream>

using namespace std;

unsigned short int ByteSwap(unsigned short int *x);

int main(){
    
    unsigned short int x = 258;
    
    ByteSwap(&x);
    
    cout << endl << x << endl;
    
    system("pause");
    
    return 0;
    
}

unsigned short int ByteSwap(unsigned short int *x){

    unsigned short int hibyte, lobyte;
    
    hibyte = (*x & 0xff00) >> 8;
    lobyte = (*x & 0xff);
    *x = lobyte << 8 | hibyte;
            
    return *x;
            
}   
    
    
