/*
    adressbook.cpp : A program written as a homework assignment for a college class demonstrating 
    using C++ streams to store, maintain, and edit a simple text address book database
    Copyright (C) 2010  : Robert L Szkutak II

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

*/

#include <iostream>
#include <fstream>
#include <string>

using namespace std;

typedef struct Entry
{
   string Name;
   string Address;
   string Phone;   
};

void AddEntry();
void DeleteEntry();
void SearchForEntry();

int main()
{
    
   bool exit = false;
   char input;
   
   while(!exit)
   {
      cout << "Welcome to the Address Book Application!" << endl << endl;
      cout << "\tSelect an option:" << endl << endl;
      cout << "\tA -- Add New Entry" << endl;
      cout << "\tD -- Delete an Entry" << endl;
      cout << "\tS -- Search for an Existing Entry" << endl;
      cout << "\tE -- Exit" << endl << endl;
      
      cin >> input;
      
      switch(input)
      {
         case 'a':
         case 'A':
         cin.ignore(255,'\n');//Apparently necessary because an extra new line carrys over in the cin stream
         system("cls");
         AddEntry();
         break;
         
         case 'd':
         case 'D':
         cin.ignore(255,'\n');//Apparently necessary because an extra new line carrys over in the cin stream
         system("cls");
         DeleteEntry();
         break;
         
         case 's':
         case 'S':
         cin.ignore(255,'\n');//Apparently necessary because an extra new line carrys over in the cin stream
         system("cls");
         SearchForEntry();
         break;
         
         case 'e':
         case 'E':
         exit = true;
         break;
         
         default:
         system("cls");
         cout << input << " is not a valid option." << endl << endl;
         break;
      }
      
   }
   
   return 0;
   
}

void AddEntry()
{
     
   Entry buffer;
   char ch;
   
   cout << "Enter Phone Number: ";
   getline(cin, buffer.Phone);
   cout << endl << "Enter Name: ";
   getline(cin, buffer.Name);
   cout << endl << "Enter Address: ";
   getline(cin, buffer.Address);
   
   ifstream fin("address.txt");
   if(!fin)
   {
      fin.close();
      ofstream fout("address.txt");
      fout << buffer.Phone << endl << buffer.Name << endl << buffer.Address << endl;
      fout.close();
   }
   if(fin)
   {
      ofstream obuffer("buffer.txt");
      while(fin && fin.get(ch))
         obuffer.put(ch);
      fin.close();
      obuffer.close();
      ifstream ibuffer("buffer.txt");
      ofstream fout("address.txt");
      while(ibuffer && ibuffer.get(ch))
         fout.put(ch);
      ibuffer.close();
      remove("buffer.txt");
      fout << endl << buffer.Phone << endl << buffer.Name << endl << buffer.Address << endl;
      fout.close();
   }
         
   buffer.Phone.erase();
   buffer.Name.erase();
   buffer.Address.erase();
     
}

void DeleteEntry()
{
     
   string stringinput, stringoutput;
   char ch;
   
   cout << "Enter the phone number of the entry to delete: ";
   cin >> stringinput;
   ifstream fin("address.txt");
   if(!fin)
   {
      cout << endl << "No entries exist!";
      fin.close();
      return;
   }
   ofstream obuffer("buffer.txt");
   /* Copy everything over into the buffer besides the account we wish to delete */
   while(!fin.eof())
   {    
      fin.read(&ch, sizeof(char));
            
      if(ch != '\n' && ch != '\0')
         stringoutput += ch;
            
      if(ch == '\n' || ch == '\0')
      {
         if(stringinput.compare(stringoutput))
         {
            stringoutput += ch;
            obuffer << stringoutput;
            stringoutput.erase();
         }
               
         if(!stringinput.compare(stringoutput))
         {
            stringoutput += ch;
            getline(fin, stringoutput);
            getline(fin, stringoutput);
            getline(fin, stringoutput);
            stringoutput.erase();
         }
               
      }
                          
   }
         
   obuffer << stringoutput;//Copy over the last line
   stringoutput.erase();
         
   fin.close();
   obuffer.close();
         
   ofstream fout("address.txt");
   ifstream ibuffer("buffer.txt");
         
   while(ibuffer && ibuffer.get(ch))
      fout.put(ch);
            
   ibuffer.close();
   fout.close();
   remove("buffer.txt");
         
   cout << endl << "Entry " << stringinput << " deleted successfully!" << endl;
   stringinput.erase();
   stringoutput.erase();
     
}

void SearchForEntry()
{

   bool found = false;
   string stringinput, stringoutput;
   char ch;
         
   ifstream fin("address.txt");
   if(!fin)
   {
      cout << "No entries currently exist!" << endl << endl;
      fin.close();
      return;
   }
         
   cout << "Enter the phone number to search for: ";
   cin >> stringinput;
         
   while(!fin.eof())
   {
      fin.read(&ch, sizeof(char));
            
      if(ch != '\n' && ch != '\0')
         stringoutput += ch;
            
      if(ch == '\n' || ch == '\0')
      {
         if(!stringinput.compare(stringoutput))
         {
            found = true;
            break;
         }
         else
         {
            /* This eliminates the chance to compare names or addresses */
            getline(fin, stringoutput);
            getline(fin, stringoutput);
            getline(fin, stringoutput);
         }
         
         
         stringoutput.erase();
      }
            
   }
         
   if(found)
   {
      cout << endl << "Phone Number: " << stringinput << endl;
      getline(fin, stringoutput);
      cout << "Name: " << stringoutput << endl;
      getline(fin, stringoutput);
      cout << "Address: " << stringoutput << endl << endl;
   }
         
   if(!found)
   {
      stringoutput.erase();
      cout << endl << stringinput << " is not in the address book!" << endl << endl;
   }
         
   stringinput.erase();
   stringoutput.erase();
   fin.close();
     
}
