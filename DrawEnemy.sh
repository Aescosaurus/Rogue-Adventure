#!/bin/bash

# This program draws different enemies based on inputted numbers when called, all 8x8

# Requires one parameter, $1 = enemy number, starting at 0

# Drawing checks are here, also, the echo's use '' instead of "" to make backslashes and such not throw errors
if [ $1 -eq 0 ]
then
	# I call this one a whelp
	echo '  _/__/ '
	echo ' /> > | '
	echo '|__---- '
	echo '   /  / '
	echo '>=|  /  '
	echo '  |  |  '
	echo '  |  \__'
	echo '__\____\'
elif [ $1 -eq 1 ]
then
	# This one looks like a samurai, or swordsman
	echo ' _____ |'
	echo ' \___/ |'
	echo ' (P_P) |'
	echo '  | /==|'
	echo '  |_|==|'
	echo ' // \\  '
	echo '_||_||__'
	echo '________'
elif [ $1 -eq 2 ]
then
	# Wizard or mage
	echo 'O0O     '
	echo '\|/ _^_ '
	echo ' | (*_*)'
	echo ' |=\   /'
	echo ' |= |_| '
	echo ' |  / \ '
	echo '_|_/___\'
	echo '________'
elif [ $1 -eq 3 ]
then
	# Living wall
	echo '|_|__|_|'
	echo '|__\_/_|'
	echo '|_6___6|'
	echo '|__|__||'
	echo '|_|__|_|'
	echo '|__|___|'
	echo '||___|_|'
	echo '|_|__|_|'
fi