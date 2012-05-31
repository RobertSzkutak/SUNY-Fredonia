#!/bin/sh
#Robert Szkutak
#Systems Programming
#Assignment 2

#Problem 1
grep \(414\) phones.dat | wc -l | tee problem1.out

#Problem 2
grep \(262\) phones.dat | tee -a problem2.out ; grep \(373\) phones.dat | tee -a problem2.out

#Problem 3
gawk -F: '{ print $2 }' phones.dat | sort -b -u | tee problem3.out

