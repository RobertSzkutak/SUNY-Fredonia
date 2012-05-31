// Written by Robert Szkutak

#include <iostream> //stdio streams
#include <ctime>    //rand()

using namespace std;

//OS Definitions execute shell calls like "clear" (LINUX) or "cls" (WINDOWS) if enabled
#define WINDOWS 1
#undef LINUX

#if WINDOWS == 0 && LINUX == 0
    #warning No pre-processor operating system chosen, which will result in slightly less functionality
#endif

//Constant values
#define ROWS    6
#define COLUMNS 7

//This class represents the game board. The intelligent agent is encompassed in this class.
class Connect4
{
	public:
		Connect4() {} //Constructor
		~Connect4() {} //Destructor
		void initialize(); //Intiializes the game board
		void printBoard(); //Sends the status of the game board to stdout
		void getInput(int player); //Receives a move from either the player or the intelligent agent
		int checkForWin(); //Returns true if the game is won
		void setChip(int set) { chip = set; } //Sets whether the intelligent agent is playing as chip 1 or 2
		void dropChip(int col, int val); //Drops a chip into a connect 4 column
		void removeChip(int col); //Removes the top chip in a column
		
	private:
        void agentMove(); //The intelligent agent selects which column to drop a chip into
		int board[ROWS][COLUMNS]; //The game board
		int chip;//Agents chip, either a 1 or a 2
};

void Connect4::dropChip(int col, int val)
{
    for(int i = 5; i >= 0; i--)
	{
		if(board[i][col] == 0)
		{
			board[i][col] = val;
			break;
		}
	}
}

void Connect4::removeChip(int col)
{
     for(int i = 0; i < ROWS; i++)
     {
             if(board[i][col] > 0)
             {
                 board[i][col] = 0;
                 break;
             }
     }
}

void Connect4::agentMove()
{    
    //Can the agent win? If so, move there
    for(int i = 0; i < COLUMNS; i++)
    {
            if(board[0][i] == 0)//Dont test if column is full
            {
                dropChip(i, chip);
                if(checkForWin() == chip)
                    return;
                removeChip(i);
            }
    }
    
    //Can the opponent win? If so, move there
    int oppchip = 0;//This represents the value of the opoonents chip
    if(chip == 1)
        oppchip = 2;
    if(chip == 2)
        oppchip = 1;
    for(int i = 0; i < COLUMNS; i++)
    {
            if(board[0][i] == 0)//Dont test if column is full
            {
                dropChip(i, oppchip);
                if(checkForWin() == oppchip)
                {
                    removeChip(i);
                    dropChip(i, chip);
                    return;
                }
                removeChip(i);
            }
    }
    
    //Make a "strageic" move
    int priority[COLUMNS];//A score of how "smart" it is to drop a chip in this column
    
        //Test each column, assign a value according to how good of a move it is
        for(int i = 0; i < COLUMNS; i++)
        {
            priority[i] = 0;
            
            if(board[0][i] == 0)//Dont test if column is full
            {
	            dropChip(i, chip);//Drop the chip to test
	            
	            //Make sure the opponent can't win on the next turn if this move is made
	            for(int j = 0; j < COLUMNS; j++)
	            {
                    if(board[0][j] == 0)//Dont test if column is full
                    {
                        dropChip(j, oppchip);//Drop test opponent chip
                    
                        if(checkForWin() == oppchip)
                            priority[i] = -1;//Opponenet will win if we make this move, only make it if it is the only valid move to make
                    
                        removeChip(j);//Remove test opponent chip
                    }
                }
                
                if(priority[i] == 0)//So long as the next move won't make us lose, lets see if it will help us win
                {
                    //Could we win in at least one consecutive move from placing this test chip?
                    for(int j = 0; j < COLUMNS; j++)
                    {
                        if(board[0][j] == 0)//Dont test if column is full
                        {
                            dropChip(j, chip);//Drop our second test chip
                        
                            if(checkForWin() == chip)
                                priority[i]+=2;//Note: Being able to win in one consecutive move is worth twice as much as being able to win in two
                            else
                            {
                        
                                //Could we win in two consecutive moves from placing this test chip?
                                for(int h = 0; h < COLUMNS; h++)
                                {
                                    if(board[0][h] == 0)//Dont test if column is full
                                    {
                                        dropChip(h, chip);//Drop our third test chip
                                
                                        if(checkForWin() == chip)
                                            priority[i]++;
                                
                                        removeChip(h);//Remove our third test chip
                                    }
                                }
                            }
                    
                            removeChip(j);//Remove our second test chip
                        }
                    }
                }
	            removeChip(i);//Remove the original test chip
            }
            else
                priority[i] = -2;//Invalid move, can't make it because column is full
        }
        
        //Which column has the highest priority
        int maxPriority = 0;//This highest priority value
        
        for(int i = 0; i < COLUMNS; i++)
        {
                if(priority[i] > maxPriority)
                {
                    maxPriority = priority[i];
                }
        }
        
        //Since multiple columns will usually share the same priority value
        //We will randomly select a column and drop it in the first column
        //which has a priority value equal to the highest priority value
        while(true)
        {
            int column = rand() % COLUMNS;
            if(priority[column] == maxPriority)
            {
                dropChip(column, chip);
                break;
            }
        }
}

int Connect4::checkForWin()
{
	//Check for vertical alignment
	for(int column = 0; column < COLUMNS; column++)
		for(int row = 0; row+3 < ROWS; row++)
			if(board[row][column] > 0                       &&
               board[row][column] == board[row+1][column]   &&
		 	   board[row+1][column] == board[row+2][column] &&
   	           board[row+2][column] == board[row+3][column])
                   return board[row][column];
				
	//Check for horizontal alignment
	for(int row = 0; row < ROWS; row++)
        for(int column = 0; column+3 < COLUMNS; column++)
            if(board[row][column] > 0                       && 
               board[row][column] == board[row][column+1]   &&
               board[row][column+1] == board[row][column+2] &&
               board[row][column+2] == board[row][column+3])
                   return board[row][column];
	                                      
    //Check for upper left to bottom right diagonal alignment
    for(int row = 0; row+3 < ROWS; row++)
        for(int column = 0; column+3 < COLUMNS; column++)
            if(board[row][column] > 0                           &&
               board[row][column] == board[row+1][column+1]     &&
               board[row+1][column+1] == board[row+2][column+2] &&
               board[row+2][column+2] == board[row+3][column+3])
                   return board[row][column];
               
    //Check for bottom left to upper right diagonal alignment
    for(int row = ROWS-1; row >= 3; row--)
        for(int column = 0; column+3 < COLUMNS; column++)
            if(board[row][column] > 0                           &&
               board[row][column] == board[row-1][column+1]     &&
               board[row-1][column+1] == board[row-2][column+2] &&
               board[row-2][column+2] == board[row-3][column+3])
                   return board[row][column];
    
    //Check for upper right to bottom left diagonal alignment
    for(int row = 0; row+3 < ROWS; row++)
        for(int column = COLUMNS-1; column >= 3; column--)
            if(board[row][column] > 0                           &&
               board[row][column] == board[row+1][column-1]     &&
               board[row+1][column-1] == board[row+2][column-2] &&
               board[row+2][column-2] == board[row+3][column-3])
                   return board[row][column];
    
    //Check for bottom right to upper left diagonal alignment
    for(int row = ROWS-1; row <= 3; row--)
        for(int column = COLUMNS-1; column > 3; column--)
            if(board[row][column] > 0                           &&
               board[row][column] == board[row-1][column-1]     &&
               board[row-1][column-1] == board[row-2][column-2] &&
               board[row-2][column-2] == board[row-3][column-3])
                   return board[row][column];
    
    //Check for a tie
    for(int i = 0; i < ROWS; i++)
        for(int j = 0; j < COLUMNS; j++)
            if(board[i][j] == 0)
                return 0;
            else
                if(i == ROWS-1 && j == COLUMNS-1)
                    return 3;
	                                      
	return 0;
}

void Connect4::initialize()
{
	for(int i = 0; i < ROWS; i++)
		for(int j = 0; j < COLUMNS; j++)
			board[i][j] = 0;
	chip = 0;
}

void Connect4::printBoard()
{
    #ifdef LINUX
        system("clear");
    #endif
    #ifdef WINDOWS
         system("cls");
    #endif
    
	cout << "  ";
	for(int i = 0; i < COLUMNS; i++)
        	cout << i+1 << "   ";
	cout << "\n|";
	for(int i = 0; i < COLUMNS; i++)
		cout << "---|";
	for(int i = 0; i < ROWS; i++)
	{
		cout << "\n|";
		for(int j = 0; j < COLUMNS; j++)
		{
            if(board[i][j] > 0)
			    cout << " " << board[i][j] << " |";
            else
                cout << "   |";
        }
	}
        cout << "\n|";
	for(int i = 0; i < COLUMNS; i++)
		cout << "---|";
	cout << endl;
}

void Connect4::getInput(int player)
{
    if(chip == player)
    {
        agentMove();
        return;
    }
    
	int column = 0;
	while(true)
	{
		cout << endl << "Choose a column 1 - 7: ";
		cin >> column;
		column -= 1;

		if(column >=0 && column < COLUMNS)
			if(board[0][column] == 0)
				break;
			else
				cout << endl << "That column is full. Please choose a different column.";
		else
			cout << endl << "That is an invalid column. Please choose a valid column.";
	}

	dropChip(column, player);
}

int main()
{
    srand(time(0));
    
	Connect4 connect4;
	connect4.initialize();

	int player = 1, win = 0, mode = 0;
	
	cout << "How many players? (1 or 2) ";
	cin >> mode;
	if(mode == 1)
	{
	    cout << endl << "Will you move first or second? (1 or 2) ";
	    cin >> mode;
	    if(mode == 1)
	        connect4.setChip(2);
        else
            connect4.setChip(1);
    }

    while(!win)
	{
		connect4.printBoard();
		connect4.getInput(player);

		player++;
		if(player > 2)
			player = 1;

		win = connect4.checkForWin();
	}

	connect4.printBoard();
	
	if(win == 3)
        cout << endl << "The game is a tie!";
	else
	    cout << endl << "Player " << win << " wins!" << endl;
	
    #ifdef WINDOWS
	    system("pause");
    #endif

	return 0;
}
