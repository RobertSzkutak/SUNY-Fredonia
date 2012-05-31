#include <iostream>

using namespace std;

int main(){
    
  int Numbers[5];
  
  cout << "Please enter 5 integer values \n";
  
  for(int i = 0; i < 5; i++){
  cin >> *(Numbers+i);        
  }
  
  cout << "\n";
  
  for (int i = 4; i > -1; i--){
  cout << *(Numbers+i) << endl;    
  }  
  
  cin >> *Numbers;
    
 return 0;
    
}
