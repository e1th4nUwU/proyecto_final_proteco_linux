#!/bin/bash

# Verify mpg123 installation, if not installed, try to install it
if ! which mpg123 >/dev/null; then
        echo -e "
        ->\e[31m ADVERTENCIA: NO TIENES INSTALADO EL PAQUETE mpg123
	\e[37mPara ejecutar esta función necesitas instarlo"
	read -p "	Deseas instalarlo?(y/n):" input
	if [ $input != "n" ] && [ $input != "N" ]
	then
	        echo -e "
		\e[37mDetectando distribución de Linux para instalar la dependencia..."
	        packagesNeeded='curl jq'
	        if [ -x "$(command -v apk)" ]
	                then sudo apk add --no-cache mpg123
	        elif [ -x "$(command -v apt-get)" ]
	                then sudo apt-get install mpg123
	        elif [ -x "$(command -v dnf)" ]
	                then sudo dnf install mpg123
	        elif [ -x "$(command -v zypper)" ]
	                then sudo zypper install mpg123
	        elif [ -x "$(command -v pacman)" ]
	                then sudo pacman -S mpg123
	        else
	                echo -e "
	->\e[31mERROR: No se pudo instalar el paquete mpg123
	\e[37mPara continuar, instala manualmente el programa
	        \e[0m"
	                exit
        	fi
	fi
fi

# Ask for playist path if not already given
if [ -z "$1" ] ; then 
	read -p $'
	\e[37mIngresa la ruta de dónde se encuentran las canciones\e[2m(presiona enter si es en el directorio actual)\e[0m: ' path
	if [ -z "$path" ] ; then # Assign current one if it's empty
		path=$(pwd)
	fi
else
	path=$1
fi
if [[ $path  != "/"* ]] ; then 
	path=$(pwd)/$path/
fi
if [ ! -d $path ] ; then
	echo -e "
        ->\e[31mERROR: No existe el directorio
        \e[37mCerrando programa...
        \e[0m"
        exit
fi

# Search for songs inside chosen path
i=0
songs=()
song_names=()
for file in $path*
do
    if [ "${file##*.}" == "mp3" ] ; then
	echo "Found song: $file"
	# Add song to the array
	songs+=("$file")
	song_name=("$(basename "$file")")
	song_names+=("${song_name::-4}")
	i+=1
    fi
done
if [ $i == 0  ] ; then # No songs detected causes the program to close
	echo -e "
    	->\e[31mERROR: No hay archivos .mp3 en el directorio
        \e[37mCerrando programa...
	\e[0m"
	exit
fi
	
# Menu cycle
selected=0
current_song=-1
loop=false
pausa=false
pid=""
echo "" > tmp # tmp file to store name of the current song


# Play function
function play(){
	# Play the selected song
	while true ; do
		echo "${song_names[$current_song]}" > tmp # Save the name of the current song
		mpg123 -q "${songs[$current_song]}" # Play the song	
		# Increase counter
		current_song=$((current_song+1))
		# If loop is not enabled break the cycle, if not go back to the first song
		if [ $current_song == $i ] ; then
			if [ $loop == false ] ; then
				echo "" > tmp # Clear tmp file
				break
			else
				current_song=0
			fi
		fi
	done
}
# Kill track
function kill_track(){
	# Kill the current song
	if [ $current_song != -1 ] ; then
		kill $pid
	fi
	pkill mpg123
}
while true ; do
	# Clear the screen
	clear

	# Show controls
	echo -e " \e[34m█▀▀ █▀█ █▄░█ ▀█▀ █▀█ █▀█ █░░ █▀▀ █▀
 █▄▄ █▄█ █░▀█ ░█░ █▀▄ █▄█ █▄▄ ██▄ ▄█

	\e[35m↑↓\e[0m: 	Moverse entre las canciones
	\e[35mo\e[0m : 	Reproducir la canción seleccionada
	\e[35mp\e[0m : 	Pausar la canción
	\e[35mc\e[0m : 	Continuar la canción
	\e[35ms\e[0m : 	Detener la canción
	\e[35m→\e[0m : 	Saltar a la siguiente canción
	\e[35m←\e[0m : 	Regresar a la canción anterior
	\e[35mr\e[0m : 	Encender/Apagar el modo repetir
	\e[35mq\e[0m : 	Salir del programa
	"
	
	# Show songs title
	echo -e " \e[34m█▀▀ ▄▀█ █▄░█ █▀▀ █ █▀█ █▄░█ █▀▀ █▀
 █▄▄ █▀█ █░▀█ █▄▄ █ █▄█ █░▀█ ██▄ ▄█
"

	# Show playing status
	if [ $current_song != -1 ] ; then
		if [ $pausa == true ] ; then
			echo -e "\e[31mPAUSADO"
		else
			echo -e "\e[32mREPRODUCIENDO"
		fi
	fi

	# Show current loop status
	if [ $loop == true ] ; then
		echo -e "\e[94mREPETIR: \e[32mON\e[0m
		"
	else
		echo -e "\e[94mREPETIR: \e[31mOFF\e[0m
		"
	fi
        
    # Show available songs
	for i in "${!song_names[@]}"; do
		if [[ $i -eq $selected ]]; then
        	# Highlight the selected file with a ">" symbol
	        printf "\e[35m> "
		else
			printf "  "
		fi
		# Compare current song with the one in the tmp file
		if [ "${song_names[$i]}" == "$(cat tmp)" ] ; then
	        	# Highlight the currently playing song in green
		        printf "\e[92m%s\n\e[0m" "${song_names[$i]}"
		else
        		printf "\e[0m%s\n" "${song_names[$i]}"
	    fi
    done
        
	# Read a single character from the user
    read -rsn1 -d '' input
	# Execute actions based on the user input
	case $input in
		'q')  # Quit
			kill_track
			rm tmp
			clear
			break
			;;
		$'A')  # Up arrow
		        if [ $selected -gt 0 ] ; then
				selected=$((selected - 1))
			fi
			;;
		$'B')  # Down arrow
			if [[ $selected -lt $i ]] ; then
				selected=$((selected + 1))
			fi
			;;
		# Play selected song
		 $'o')
		 	# Change status
		 	pausa=false
    		# Kill previous track
    		kill_track
    		# Play selected song
    		current_song=$selected
			play & pid=$!
			;;
        $'p') # Pause
			# Change status
		 	pausa=true
			kill -STOP $(pgrep mpg123) > /dev/null 2>&1
			;;
		$'c') # Continue
			# Change status
		 	pausa=false
			kill -CONT $(pgrep mpg123) > /dev/null 2>&1
			;;
		$'s') # Stop
			# Change status
		 	pausa=true
			# Kill previous track
			kill_track
			current_song=-1
			;;
		$'C') # Next
			# Change status
		 	pausa=false
			# Kill previous track
			kill_track
			# Find next song
			if [ $current_song -lt $i ] ; then
				current_song=$((current_song + 1))
				play & pid=$!
			elif [ $current_song -eq $i ] ; then
				if [ $loop == true ] ; then
					current_song=0
					play & pid=$!
				else
					current_song=-1
					pausa=true
					echo "" > tmp # Clear tmp file
				fi
			fi	
			;;
		$'D') # Back
			# Change status
		 	pausa=false
			# Kill previous track
			kill_track
			# Find previous song
			if [ $current_song -eq -1 ] ; then
				current_song=$i
			elif [ $current_song -eq 0 ] ; then
				if [ $loop == true ] ; then
					current_song=$i
				else
					current_song=0
				fi
			else
				current_song=$((current_song - 1))
			fi
			play & pid=$!
			;;
		$'r') # Repeat
			if [ $loop == false ] ; then
				loop=true
			else
				loop=false
			fi
			;;	
    esac
done
reset
