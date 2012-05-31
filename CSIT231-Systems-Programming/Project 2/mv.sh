#!/bin/bash

#Written By: Robert Szkutak

#$1 is first argument, $2 is second, etc...

if [ -e $2 ] #if the destination exists
then
	file_index=1 #set the index to 1
	while [ -e $2.$file_index ]; do #loop while our destination exists
		let file_index+=1 #add 1 to index
	done
	mv $1 $2.$file_index #perform the move
	echo "File moved to $2.$file_index instead of $2" #inform the user so they know where their file went
else #if it doesn't exist
	mv $1 $2 #perform the move
fi