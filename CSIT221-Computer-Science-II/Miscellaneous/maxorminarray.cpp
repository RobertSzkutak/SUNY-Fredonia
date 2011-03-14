/*
    maxorminarray.cpp : A program written for a college class demonstrating returning the maximum or minuimum integer value held in an array
    Copyright (C) 2010  Robert L Szkutak II

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

#define MAX_ARRAY_SIZE 10

using namespace std;

int GetMaxOrMin(int array[], bool maxormin);

int main() 
{
  int array[MAX_ARRAY_SIZE], max, min;
  int i;

  for (i=0; i<10; i++) 
  {
    cout << "Enter an integer value: " ;
    cin >> array[i]; 
    cout << endl;
  }

  max = GetMaxOrMin(array, true);
  min = GetMaxOrMin(array, false);

  system("cls");//Clear the console making the output look a bit nicer

  cout << "The array is: " << endl;
  for (i=0; i<10; i++){
    cout << array[i] << endl;
  }
  cout << "The largest value is: " << max << endl;
  cout << "The smallest value is: " << min << endl;
  
  cin >> i;//Pause the program so we can read the console output

  return 0;
}

//********************************************************************************* 
//
// Function: GetMaxorMin
// Returns the maximum or minimum integer value stored in an array
//
// Paramters:
// int array[]: The array of which the maximum or minimum value is being determined
// bool maxormin: Determines whether to find the maximum or minimum value
//
//*********************************************************************************
int GetMaxOrMin(int array[], bool maxormin) 
{
  int extreme = array[0];
  int i;
  for (i=1; i<MAX_ARRAY_SIZE; i++)
  {
   //Find maximum
    if(maxormin){
      if (array[i]>extreme) 
         extreme = array[i];
    }
   //Find minimum
    if(!maxormin){
      if (array[i]<extreme) 
         extreme = array[i];
    }
  }
  return extreme; 
}
