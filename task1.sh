#!/bin/bash

draw_board () {
	for i in {0..8}
	do
		printf "|"
		case ${board_fields[$i]} in
			1) printf "X";;
			2) printf "O";;
			*) printf " ";;
		esac
		if [ $(($i%3)) -eq 2 ]
		then
			printf "|\n"
		fi		
	done
}	

draw_example_board () {
	for i in {0..8}
	do
		printf "|"
		printf $i
		if [ $(($i%3)) -eq 2 ]
		then
			printf "|\n"
		fi		
	done
}

play_game () {
	printf "oznaczenia pol\n"
	draw_example_board
	
	local turn_indicator=1
	
	draw_board
	
	while : 
	do
		if [ $turn_indicator -eq 1 ]
		then
			printf "podaj numer pola dla X\n"
			
		else
			printf "podaj numer pola dla O\n"
			
		fi
		
		read move_option
		
		case $move_option in
			[0-8]) 
			if [ ${board_fields[$move_option]} ]
			then
				printf "nie prawidlowe pole...\n"
			else
				if [ $turn_indicator -eq 1 ]
				then 
					board_fields[$move_option]=1
					turn_indicator=2
				else
					board_fields[$move_option]=2
					turn_indicator=1
				fi
				draw_board
				if [ "${board_fields[0]}" = "${board_fields[1]}" ] && [ "${board_fields[1]}" = "${board_fields[2]}" ] && [ ${board_fields[0]} ]
				then
					printf "\nKONIEC GRY\n"
					break
				elif [ "${board_fields[3]}" = "${board_fields[4]}" ] && [ "${board_fields[4]}" = "${board_fields[5]}" ] && [ ${board_fields[3]} ]
				then
					printf "\nKONIEC GRY\n"
					break
				elif [ "${board_fields[6]}" = "${board_fields[7]}" ] && [ "${board_fields[7]}" = "${board_fields[8]}" ] && [ ${board_fields[6]} ]
				then
					printf "\nKONIEC GRY\n"
					break
				elif [ "${board_fields[0]}" = "${board_fields[4]}" ] && [ "${board_fields[4]}" = "${board_fields[8]}" ] && [ ${board_fields[0]} ]
				then
					printf "\nKONIEC GRY\n"
					break
				elif [ "${board_fields[2]}" = "${board_fields[4]}" ] && [ "${board_fields[4]}" = "${board_fields[6]}" ] && [ ${board_fields[2]} ]
				then
					printf "\nKONIEC GRY\n"
					break
				fi
			fi
			;;
			z) 	
			printf "zapisz\n" ;;
			q) 	
			printf "wyjscie\n" 
			break ;;
			*) 
			printf "nieznana komenda\n";;
		esac
			
	done
}

while :
do

printf "kolko i krzyzyk\n\n"
printf "1. nowa gra\n"
printf "q. koniec\n\n"
printf "podaj znak...\n"

board_fields=()

read menu_option

case $menu_option in
	1)
		printf "\nstart nowej gry\n\n"
		play_game
		;;
	q)
		printf "koniec gry\n"
		break
		;;
	*)
		printf "nieznana komenda\n"
		;;
esac
done

