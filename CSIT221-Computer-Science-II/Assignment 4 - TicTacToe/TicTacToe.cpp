/*
    TicTacToe.cpp : A program written as a homework assignment for a college class demonstrating 
    an ASCII Tic-Tac-Toe game for two players
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

using namespace std;

   class Board 
   {
      public:
             
         Board();//Constructor
         ~Board();//Destructor
         void SetSquare(int input, int setting);//Sets an X or an O on a square
         void DrawBoard();//Draws the ASCII TicTacToe Board
         bool IsEmpty(int square);//Checks to see if a square is empty
         bool GameOver();//Checks to see if the game has ended
         
       protected:
          
          int squares[3][3];//Value of 0 = NotTaken, 1 = X , 2 = O    
   
   };
   
   Board::Board()
   {
      for(int i = 0; i < 3; i++)
      {
         for(int j = 0; j < 3; j++)
            squares[i][j] = 0;
      }
   }
   
   Board::~Board()
   {
                  
   }
   
   void Board::SetSquare(int input, int setting)
   {
      int row = 0, column = 0;
      
      //Convert input to a row and column value
      if(input == 0 || input == 1 || input == 2)
         row = 0;
      if(input == 3 || input == 4 || input == 5)
         row = 1;
      if(input == 6 || input == 7 || input == 8)
         row = 2;
      if(input == 0 || input == 3 || input == 6)
         column = 0;
      if(input == 1 || input == 4 || input == 7)
         column = 1;
      if(input == 2 || input == 5 || input == 8)
         column = 2;
        
      //Set the X or O  
      squares[row][column] = setting;
      
   }
   
   void Board::DrawBoard()
   {
      int boardnum = 0;
   
      for(int i = 0; i < 3; i++)
      {
         
         cout << endl;
         
         if(i != 0)
         {
            for(int j = 0; j < 13; j++)
               cout << "-"; 
         }   
            
         cout << endl;
         
         for(int j = 0; j < 3; j++)
         {   
            cout << "| ";
         
            if(!squares[i][j])
               cout <<  boardnum << " ";
            if(squares[i][j] == 1)
               cout << "X ";
            if(squares[i][j] == 2)
               cout << "O "; 
            
            boardnum++;   
         
         }
         
         cout << "|";
              
      }
   
   }
   
   bool Board::IsEmpty(int square)
   {
      int row = 0, column = 0;
      
      //Convert square to a row and column value
      if(square == 0 || square == 1 || square == 2)
         row = 0;
      if(square == 3 || square == 4 || square == 5)
         row = 1;
      if(square == 6 || square == 7 || square == 8)
         row = 2;
      if(square == 0 || square == 3 || square == 6)
         column = 0;
      if(square == 1 || square == 4 || square == 7)
         column = 1;
      if(square == 2 || square == 5 || square == 8)
         column = 2;
      
      if(!squares[row][column])
         return true;
      else
         return false;
   }
   
   bool Board::GameOver()
   {
      //Check for X Win
      if( (squares[0][0] == 1 && squares[0][1] == 1 && squares[0][2] == 1) || \
          (squares[1][0] == 1 && squares[1][1] == 1 && squares[1][2] == 1) || \
          (squares[2][0] == 1 && squares[2][1] == 1 && squares[2][2] == 1) || \
          (squares[0][0] == 1 && squares[1][0] == 1 && squares[2][0] == 1) || \
          (squares[0][1] == 1 && squares[1][1] == 1 && squares[2][1] == 1) || \
          (squares[0][2] == 1 && squares[1][2] == 1 && squares[2][2] == 1) || \
          (squares[0][0] == 1 && squares[1][1] == 1 && squares[2][2] == 1) || \
          (squares[0][2] == 1 && squares[1][1] == 1 && squares[2][0] == 1) )
          {
                      
             cout << endl << endl << "Player X wins the game!" << endl;
             return true;
             
          }
      
      //Check for O Win
      if( (squares[0][0] == 2 && squares[0][1] == 2 && squares[0][2] == 2) || \
          (squares[1][0] == 2 && squares[1][1] == 2 && squares[1][2] == 2) || \
          (squares[2][0] == 2 && squares[2][1] == 2 && squares[2][2] == 2) || \
          (squares[0][0] == 2 && squares[1][0] == 2 && squares[2][0] == 2) || \
          (squares[0][1] == 2 && squares[1][1] == 2 && squares[2][1] == 2) || \
          (squares[0][2] == 2 && squares[1][2] == 2 && squares[2][2] == 2) || \
          (squares[0][0] == 2 && squares[1][1] == 2 && squares[2][2] == 2) || \
          (squares[0][2] == 2 && squares[1][1] == 2 && squares[2][0] == 2) )
          {
                      
             cout << endl << endl << "Player O wins the game!" << endl;
             return true;
             
          }
      
      //Check for a Draw
      for(int i = 0; i < 3; i++)
      {
         for(int j = 0; j < 3; j++)
         {
            if(!squares[i][j])
               break;
         
            if(squares[i][j] && i == 2 && j == 2)
            {
                       
               cout << endl << endl << "The game is a draw!" << endl;
               return true;              
         
            }
         }
      
      }
      
      return false;
        
   }
   
   int main()
   {
   
      Board OurBoard;
      int player = 1, input = 0;
      bool switchplayer = false;
      
      //Game Loop
      while(true)
      {
                 
         switchplayer = false;
         
         //Draw Game Board
         system("cls");
                 
         OurBoard.DrawBoard();
         
         //Check for Win/Draw to Exit
         if(OurBoard.GameOver())
            break;
         
         //Get Input
         while(true)
         {
            cout << endl << endl << "Player ";
            if(player == 1)
               cout << "X ";
            if(player == 2)
               cout << "O ";
            cout << "please make your move!";
            cin >> input;
            if((input != 0 && input != 1 && input != 2 && input != 3 && input != 4 && input != 5 && input != 6 && input != 7 && input != 8 && input != 9) || !OurBoard.IsEmpty(input))
               cout << endl << "Invalid choice.";
            else
               break;
         }   
         
         OurBoard.SetSquare(input, player);
         
         //Change Player
         if(player == 1 && switchplayer == false)
         {
            switchplayer = true;
            player = 2;
         }
         
         if(player == 2 && switchplayer == false)
         {
            switchplayer = true;
            player = 1;
         }
         
      }
      
      cout << endl;
      
      system("pause");
   
      return 0;    
       
   }
   
   
   
