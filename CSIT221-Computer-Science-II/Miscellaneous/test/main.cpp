#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main() {
  int characters=0, lines=0, words=0;
  char ch;
  char line[100];
  char word[100];
  string name;

  ifstream myfile; 
  //cout << "Enter the name of the file to open: " ; 
  //cin >> name;
  myfile.open("test.txt");

  if (!myfile)
  {
    cout << "File input.txt does not exists in this folder " << endl;
    return 0;
  }
  //myfile.get(ch);
  //cout << myfile.eof();
  while(!myfile.eof()){
    characters++;
    myfile.read(&ch, sizeof(ch));
    if(ch == ' ' || ch == '\n' || ch == '\0')
    words++;
    if(ch == '\n' || ch == '\0')
    lines++;
  }
  
  cout<<"The number of lines in the file is "<<lines<<endl;

cout << "The number of words in the file is " << words << endl;

    cout<<"The number of characters in the file is "<<characters<<endl;
    
    myfile.close();
    
    system("pause");
    
    return 0;

  }
