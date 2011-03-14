/*
    homeworkassignment1.cpp : A program written as a homework assignment for a college class demonstrating 
    multiplying matrices to create a resultant matrix.
    Copyright (C) 2010  "Group 4" : Robert L Szkutak II , Christian Bernard Stevens,
    Devan John Wiech, Lauren Varolian, Mackenzie Richard Watson

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

using namespace std;

int main(){
    
    //Integers to be used in for loops
    int i, j;
    
    //Create Matrix A
    int A[3][3];
    cout << "Matrix A:";
    //Initialize Matrix A
    for(i = 0; i < 3; i++){
          cout << endl;
          for(j = 0; j < 3; j++){
                A[i][j] = i+j;
                cout << A[i][j] << " ";
          }
   }
   
   cout << endl;
                
    //Create Matrix B
    int B[3][3];
    cout << "Matrix B:";
    //Initialize Matrix B
    for(i = 0; i < 3; i++){
          cout << endl;
          for(j = 0; j < 3; j++){
                B[i][j] = i+j;
                cout << B[i][j] << " ";
          }
    }
    
    cout << endl;
    
    //Create Matrix C
    int C[3][3];
    cout << "Matrix C:";
    //Initialize Matrix C
    for(i = 0; i < 3; i++){
          cout << endl;
          for(j = 0; j < 3; j++){
                if(i == 0)
                C[i][j] = (A[j][i]*B[i][j])+(A[j][i+1]*B[i+1][j])+(A[j][i+2]*B[i+2][j]);
                if(i == 1)
                C[i][j] = (A[j][i-1]*B[i-1][j])+(A[j][i]*B[i][j])+(A[j][i+1]*B[i+1][j]);
                if(i == 2)
                C[i][j] = (A[j][i-2]*B[i-2][j])+(A[j][i-1]*B[i-1][j])+(A[j][i]*B[i][j]);
                cout << C[i][j] << " ";
          }
    }
                
    cin >> i;

    return 0;
    
}
