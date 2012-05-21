#include <iostream>  
#include <fstream>  

    using namespace std;      


        int main() {  
        
            ifstream inFile;   

            char c;  
            int nNum = 0;   

            inFile.open("vowel.txt");  

            while(!inFile.eof()) {  
                inFile.get(c);  

                if (c == 'a' || c == 'e' ||  c == 'i' ||  c == 'o' || c == 'u' || c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U')  
                    nNum++;  
            }  

            inFile.close();  

            cout << "The total number of vowels is " << nNum << ".\n";  
            system("pause");
            
            return 0;  

        }
