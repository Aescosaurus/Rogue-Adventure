#!/bin/bash

# This program contains the main bulk of the game, and concatenates other functions

# Initialize variables
declare -i char_x=1
declare -i char_y=1

declare -i char_hp=20
declare -i char_block=3
declare -i char_attack=1
declare -i char_heal=1
declare -i char_level=1
declare -i char_weapon_damage=3

declare -i level_up_xp=10
declare -i level_up_ADD=15
declare -i char_level_ADD=1 # Misleading name!! Beware!

declare -i rand_enemy=$((RANDOM%4)) # The number after modulus is always 1 larger than number of enemies
declare -i rand_encounter=0

declare -i total_gold=0
declare -i total_xp=0
declare -i gold_given=0
declare -i xp_given=0
declare -i gold=10
declare -i xp=5

declare willDraw="false"

declare up="w"
declare down="s"
declare right="d"
declare left="a"
declare menu="m"
declare isReady
declare command
declare char_weapon_type="Weak_Sword"

echo "Initializing..."
sleep 1
echo "Type 'Ready' to begin!"

read isReady

Merchant ()
{
	echo "test"
	# echo "test"
	# echo "test"
	# echo "test"
	# echo "test"
}

# Begin bulk of code
if [ $isReady = "Ready" ]
then
	source DrawScreen.sh 20 10 $char_x $char_y
	
	# Game loop
	while [ $char_hp -gt 0 ]
	do
	
			echo "Type '$up', '$down', '$right', or '$left' to move in the specified direction, or '$menu' to access the menu."
			read -n 1 command
	
			echo ""
	
			if [ -z $command ]
			then
	
					echo "Invalid command!"
					willDraw="false"
	
			elif [ $command = $up ] && [ $char_y -gt 1 ]
			then
	
					char_y=$char_y-1
					willDraw="true"
	
			elif [ $command = $down ] && [ $char_y -lt 10 ]
			then
	
					char_y=$char_y+1
					willDraw="true"
	
			elif [ $command = $right ] && [ $char_x -lt 19 ]
			then
	
					char_x=$char_x+1
					willDraw="true"
	
			elif [ $command = $left ] && [ $char_x -gt 1 ]
			then
	
					char_x=$char_x-1
					willDraw="true"
	
			elif [ $command = $menu ]
			then
	
					echo "Level: $char_level"  echo "Hit Points: $char_hp"
					echo "Blocks: $char_block"
					echo "Heal: $char_heal"
					echo "Damage: $char_damage"
					echo "Gold: $total_gold"
					echo "XP: $total_xp"
					willDraw="false"
	
			else
	
					echo "Invalid command!"
					willDraw="false"
	
			fi
	
			if [ $willDraw = "true" ]
			then
	
					source DrawScreen.sh 20 10 $char_x $char_y
	
			else
	
					echo ""
	
			fi
	
			rand_encounter=$((RANDOM%5))
			rand_enemy=$((RANDOM%4))
	
			if [ $rand_encounter -eq 1 ] && [ $willDraw = "true" ]
			then
	
					source DoBattle.sh $rand_enemy $char_hp $char_attack $char_heal $char_weapon_damage
					gold_given=$((RANDOM%gold+1))
					xp_given=$((RANDOM%xp+1))
	
					echo "You looted $gold_given gold from the corpse."
					total_gold=$total_gold+$gold_given
	
					sleep 1
	
					echo "From the battle, you have attained $xp_given experience points."
					total_xp=$total_xp+$xp_given
	
					sleep 1
	
			elif [ $rand_encounter -eq 2 ] && [ $willDraw = "true" ]
			then
	
					Merchant
	
			fi
			if [ $total_xp -ge $level_up_xp ] && [ $char_level -eq $char_level_ADD ]
			then
	
					char_level_ADD=$char_level_ADD+1
	
					level_up_xp=$level_up_xp+$level_up_ADD
					level_up_ADD=$level_up_ADD+5
	
					char_hp=$char_hp+5
					char_block=$char_block
					char_damage=$char_damage+1
					char_heal=$char_heal+1
	
					char_xp=$char_xp+1
					char_level=$char_level+1
					echo "Level up!  You are now level $char_level!"
	
					sleep 1
	
					echo "Your stats have improved!"
	
					sleep 1
	
			fi
	
	done
	
	echo "Game Over!"
	
else
	echo "Exiting program!"
	sleep 1
fi