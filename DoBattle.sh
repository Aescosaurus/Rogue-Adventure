#!/bin/bash

# This program occurs when an enemy is encountered

# Requires five parameters, $1 = enemy_type, $char_HP = character HP, $3 = total damage, $4 = character heal, and $5 = weapon damage

# Initialize variables
declare -i char_HP=$2
declare -i char_block=3
declare -i total_damage=$3
declare -i char_heal=$4
declare -i char_weapon_damage=1
declare -i enemy_HP=1
declare -i enemy_damage=1

declare command="invalid"
declare attack="v"
declare block="b"
declare enemy_type="NULL"

declare isDefeated="false"
declare isDead="false"

# Temporary variables that may be changed later
# declare -i $char_HP=20
# declare -i =1
# declare -i char_block=3
# declare -i enemy=0

if [ $1 -eq 0 ]
then
	enemy_type="Flame Whelp"
	enemy_HP=5
	enemy_damage=2
	gold=10
	xp=5
elif [ $1 -eq 1 ]
then
	enemy_type="Swordsman"
	enemy_HP=7
	enemy_damage=1
	gold=10
	xp=5
elif [ $1 -eq 2 ]
then
	enemy_type="Mage"
	enemy_HP=3
	enemy_damage=3
	gold=10
	xp=5
elif [ $1 -eq 3 ]
then
	enemy_type="Living Wall"
	enemy_HP=10
	enemy_damage=1
	gold=10
	xp=5
else
	enemy_type="NULL"
	gold=0
	xp=0
fi

source DrawEnemy.sh $1

echo "An enemy $enemy_type appears!"

# Main battle loop
while [ $isDefeated = "false" ] && [ $isDead = "false" ]
do
	source DrawEnemy.sh $1
	
	echo "Type '$attack' to attack or '$block' to block and heal."
	
	read -n 1 command
	
	echo ""
	
	if [ -z $command ]
	then
	
			echo "Invalid command!"
	
	elif [ $command = $attack ]
	then
	
			char_weapon_damage=$((RANDOM%$5))
			char_weapon_damage=$char_weapon_damage+1
			total_damage=$char_weapon_damage+$3
	
			enemy_HP=$enemy_HP-$3-$char_weapon_damage
			echo "You strike your foe for $total_damage damage!"
	
			sleep 1
	
			echo "The enemy $enemy_type now has $enemy_HP hit points remaining."
	
			sleep 1
	
			char_HP=$char_HP-$enemy_damage
			echo "The $enemy_type hits you for $enemy_damage damage, leaving you with $char_HP hit points left over!"
	
			sleep 1
	
	elif [ $command = $block ]
	then
	
			if [ $char_block -eq 3 ]
			then
	
					char_block=$char_block-$enemy_damage
					echo "Your shield cracks a bit as the attack of the $enemy_type collides with it!"
	
			elif [ $char_block -eq 2 ]
			then
	
					char_block=$char_block-$enemy_damage
					echo "Your shield nearly breaks under the attack of the enemy $enemy_type!"
	
			elif [ $char_block -eq 1 ]
			then
	
					char_block=$char_block-$enemy_damage
					echo "As the attack is repelled, your trusty shield is torn apart!"
	
			else
	
					$char_HP=$char_HP-$enemy_damage
					echo "Your shield is broken, and is no longer effective!"
					echo "You sustain $enemy_damage damage, and have $char_HP hit points remaining!"
	
			fi
	
			$char_HP=$char_HP+$4
			echo "You regenerate $4 hit point, your health is now $char_HP."
	
			sleep 1
			else
	
			echo "Invalid command!"
	
	fi
	
	if [ $enemy_HP -le 0 ]
	then
	
			isDefeated="true"
	
	elif [ $char_HP -le 0 ]
	then
	
			isDead="true"
	
	fi
done

if [ $isDefeated = "true" ]
then
	echo "You have defeated the enemy $enemy_type!"
	
	sleep 1
elif [ $isDead = "true" ]
then
	echo "Game Over!"
	
	sleep 1
fi