/*
    assignment2.cpp : A program written as a homework assignment for a college class demonstrating 
    solving the cannibals vs missionaries problem.
    Copyright (C) 2011  : Robert L Szkutak II

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

#define MAXPEOPLE 6

using namespace std;

class Person 
{
      
      public:
             Person();
             ~Person();  
             int id;//1 == Hackers , 2 == Lawyers
             int place;//1 == Hotel , 2 == Courtroom

};

Person::Person() {}
Person::~Person() {}

bool success(Person People[]);
void moveRight(Person People[], int hackers, int lawyers);
void moveLeft(Person People[], int hackers, int lawyers);
void printStatus(Person People[]);

int main()
{
     Person People[MAXPEOPLE];
    
     for (int i = 0; i < MAXPEOPLE; i++)
     {
         People[i].place = 1;
        
         if(i < MAXPEOPLE / 2)
              People[i].id = 1;
         else
              People[i].id = 2;
        
     }
     
     printStatus(People);    
     moveRight(People, 1, 1);
     printStatus(People);
     moveLeft(People, 1, 0);
     printStatus(People);
     moveRight(People, 0, 2);
     printStatus(People);
     moveLeft(People, 0, 1);
     printStatus(People);
     moveRight(People, 2, 0);
     printStatus(People);
     moveLeft(People, 1, 1);
     printStatus(People);
     moveRight(People, 2, 0);
     printStatus(People);
     moveLeft(People, 0, 1);
     printStatus(People);
     moveRight(People, 0, 2);
     printStatus(People);
     moveLeft(People, 0, 1);
     printStatus(People);
     moveRight(People, 0, 2);
     printStatus(People);
     
     if(!success(People))
          cout << "\n\nERROR!!!";
     
     cin >> People[0].id;
 
     return 0;
    
}

bool success(Person People[]){
     
     bool ret = true;
     
     for(int i = 0; i < MAXPEOPLE; i++)
     {
          if(People[i].place == 1)
               ret = false;
     }
     
     return ret;
     
}

void moveRight(Person People[], int hackers, int lawyers){
     
     for(int i = 0; i < MAXPEOPLE; i++)
     {
          if(People[i].id == 1 && People[i].place == 1 && hackers > 0)
          {
               People[i].place = 2;
               hackers--;
          }
          
          if(People[i].id == 2 && People[i].place == 1 && lawyers > 0)
          {
               People[i].place = 2;
               lawyers--;
          }
     }
}

void moveLeft(Person People[], int hackers, int lawyers){
     
     for(int i = 0; i < MAXPEOPLE; i++)
     {
          if(People[i].id == 1 && People[i].place == 2 && hackers > 0)
          {
               People[i].place = 1;
               hackers--;
          }
          
          if(People[i].id == 2 && People[i].place == 2 && lawyers > 0)
          {
               People[i].place = 1;
               lawyers--;
          }
     }
}

void printStatus(Person People[])
{
     int hotelhcount = 0, courthcount = 0;
     int hotellcount = 0, courtlcount = 0;
     
     for(int i = 0; i < MAXPEOPLE; i++)
     {
          if(People[i].id == 1 && People[i].place == 1)
               hotelhcount++;   
          if(People[i].id == 1 && People[i].place == 2)
               courthcount++; 
          if(People[i].id == 2 && People[i].place == 1)
               hotellcount++; 
          if(People[i].id == 2 && People[i].place == 2)
               courtlcount++;      
     }
             
     cout << "Hotel: " << hotelhcount << "H/" << hotellcount << "L";
     cout << "     Court: " << courthcount << "H/" << courtlcount << "L\n\n";
                   
     return;              
}
