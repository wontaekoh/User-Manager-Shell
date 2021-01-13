#!/bin/bash

# Author: Wontaek Oh
# Description: This program create/delete/modify user accounts 

exit="N";

# Program starts, prompting user's input, stop program when 'Q' or 'q' is entered.
while [[ "$exit" != "Y" ]]
do
	echo "Choose one of the following options:";
	echo "A Create a user account";
	echo "B Delete a user account";
	echo "C Change supplementary group for a user account";
	echo "D Change initial group for a user account";
	echo "E Change default login shell for a user account";
	echo "F Change account expiration date for a user account";
	echo "Q Quit";
	echo -n "What would you like to do?: "; read input;

	# A: User Creation
	if [[ "$input" = "A" || "$input" = "a" ]]
	then
		echo -n "Enter username: "; read username;
		echo -n "Enter user's home directory (using absolute path): "; read homeDir;
		echo -n "Enter login shell (using absolute path): "; read shell;
		useradd -c "$username" -d $homeDir -m -s $shell $username;	
	# B: User Deletion
	elif [[ "$input" = "B" || "$input" = "b" ]]
	then
		echo -n "Enter a username to delete: "; read username;
		userdel -r $username;
	# C: Change user's supplementary group
	elif [[ "$input" = "C" || "$input" = "c" ]]
	then
		echo -n "Enter username: "; read username;
		echo -n "Enter supplementary group name: "; read suplGroup;
		usermod -G $suplGroup $username;
	# D: Change user's initial group
	elif [[ "$input" = "D" || "$input" = "d" ]]
	then
		echo -n "Enter username: "; read username;
		echo -n "Enter initial group name: "; read initGroup;
		usermod -g $initGroup $username;
	# E: Change user's default login shell
	elif [[ "$input" = "E" || "$input" = "e" ]]
	then
		echo -n "Enter username: "; read username;
		echo -n "Enter shell name: "; read shell;
		usermod -s $shell $username;
	# F: Change expiration date of user account
	elif [[ "$input" = "F" || "$input" = "f" ]]
	then
		echo -n "Enter username: "; read username;
		echo -n "Enter expiration date (YYYY-MM-DD): "; read expDate;
		usermod -e $expDate $username;
	elif [[ "$input" = "Q" || "$input" = "q" ]]
	then
		exit="Y";
	else
		echo "Invalid option is chosen."; sleep 2;
	fi
	clear;
	echo "You entered $input."; sleep 2;
done
