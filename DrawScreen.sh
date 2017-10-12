#!/bin/bash

# This program creates a grid of the specified size, but glitches out over 149 width and 36 height

# Requires four parameters, $1 = x, $2 = y, $3 = char x, and $4 = char y

# Initialize and set variables
declare -i a=1
declare -i b=1
declare -i c=1
declare -i rand_x=$((RANDOM%$1))+1 # The number after modulus is always 1 larger than number you want
declare -i rand_y=$((RANDOM%$2))+1 # The number after modulus is always 1 larger than number you want

# Temporary variables that will be set somewhere else later
# declare -i char_x=$3
# declare -i char_y=$4

# Main drawing loop, this controls height
while [ $a -le $2 ]
do
	# Draws individual lines, this controls width
	while [ $b -le $1 ]
	do
			echo -n "_"
			
			# Check character position compared to row and column drawn at the moment
			if [ $3 -eq $b ] && [ $4 -eq $a ]
			then
	
					echo -n "@"
					b=$b+1
	
			fi
			
			if [ $rand_x -eq $b ] && [ $rand_y -eq $a ]
			then
	
					echo -n "#"
					b=$b+1
	
			fi
			
			b=$b+1
	done
	
	echo ""
	
	b=1
	a=$a+1
done