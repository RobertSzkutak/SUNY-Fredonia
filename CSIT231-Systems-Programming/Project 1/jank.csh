#!/bin/tcsh
#
#Written by Robert Szkutak
#
#
set stop = 0    #While loop counter
set exit = "Goodbye!"
#
# Menu
while ($stop == 0)      #While loop

set listFlag = 0        #Flag to list the files in Recycle_bin
set fileFlag = 0        #Flag to ask the user for the name of a file to be recycled
set restoreFlag = 0     #Flag to restore a file in the Recycle_bin
set purgeFlag = 0       #Flag to delete all files in the Recycle_bin
set recycle = ./.Recycle_bin        #Variable to store path to recycle directory (Recycle_bin)

cat << ENDOFMENU
Dear $USER, the usage of junk is as follows:
Press l - Lists all files in the Recycle Bin
Press i - Input file name and junk it
Press r - Restore all files inside the Recycle Bin
Press d - Delete all files from the Recycle Bin
Press 0 - Exit
ENDOFMENU

echo ""
echo -n 'Please make a selection from the menu. '     
set reply = $<
echo "" 
switch ($reply) #Switch to handle inputs
        case "l":       
        set listFlag = 1
        breaksw
        case "i":       
        set fileFlag = 1
        breaksw
        case "r":       
        set restoreFlag = 1
        breaksw
        case "d":       
        set purgeFlag = 1
        breaksw
        case "0"        
        echo $exit
        set stop = 1    
        breaksw
        default:        
        echo Not a valid selection
        breaksw
endsw   #End of the switch

if (!(-e $recycle)) then        
        'mkdir' $recycle        #Creates a Recycle_bin directory if one doesn't exist already
endif

if ($listFlag) then     
        'ls' -lgF $recycle      #List the files in the Recycle_bin directory
endif

if ($purgeFlag) then    
        'rm' $recycle/* #Deletes all the files in the Recycle_bin directory
endif

if ($restoreFlag) then  
        echo -n 'enter the name of the file you want restored: '        #Ask the user for the name of file they want to restore
        #next line: reads in the input from the console
        set restoreName = $<
        'mv' $recycle/$restoreName ./   #Move the file the user wants restored in the Recycle_bin directory back to the parent directory (project_1)
endif

if ($fileFlag) then    
        echo -n 'enter the name of the file to be moved to the junk directory: '#Asks the user to input the name of a file to recycle
        set name = $<
        'mv' $name $recycle     #Moves the file name inputed into the Recycle_bin directory
endif

echo "" 

end

