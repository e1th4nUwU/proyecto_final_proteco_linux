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

# Ask for playist path
read -p $'
\e[37mIngresa la ruta de dónde se encuentran las canciones\e[2m(presiona enter si es en el directorio actual)\e[0m: ' path
if [ -z "$path" ] # Assign current one if it's empty
then
	path=$(pwd)
elif [[ $path  != "/"* ]]
then 
	path=$(pwd)/$path/
elif [ ! -d "/dir1/" ] 
then
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
    if [ "${file##*.}" == "mp3" ]
    then
		echo "Found song: $file"
		# Add song to the array
		songs+=("$file")
		song_name=("$(basename "$file")")
		song_names+=("${song_name::-4}")
		i+=1
    fi
done
if [ $i == 0  ] # No songs detected causes the program to close
then
	echo -e "
    	->\e[31mERROR: No hay archivos .mp3 en el directorio
        \e[37mCerrando programa...
	\e[0m"
	exit
fi
	
# Menu cycle
selected=0
now_playing=-1
while true
do
	# Clear the screen
	clear

	# Show controls
	echo -e " \e[34m█▀▀ █▀█ █▄░█ ▀█▀ █▀█ █▀█ █░░ █▀▀ █▀
 █▄▄ █▄█ █░▀█ ░█░ █▀▄ █▄█ █▄▄ ██▄ ▄█

	\e[35m↑↓\e[0m: 	Moverse entre las canciones
	\e[35mo\e[0m: 	Reproducir la canción seleccionada
	\e[35mp\e[0m: 	Pausar la canción
	\e[35mc\e[0m: 	Continuar la canción
	\e[35ms\e[0m: 	Detener la canción
	\e[35m→\e[0m: 	Saltar a la siguiente canción
	\e[35m←\e[0m: 	Regresar a la canción anterior
	\e[35mq\e[0m: 	Salir del programa
	"
	
	# Show songs title
	echo -e " \e[34m█▀▀ ▄▀█ █▄░█ █▀▀ █ █▀█ █▄░█ █▀▀ █▀
 █▄▄ █▀█ █░▀█ █▄▄ █ █▄█ █░▀█ ██▄ ▄█
"

	tput sgr0  # Reset text color
        
    # Show available songs
	for i in "${!song_names[@]}"; do
        if [[ $i -eq $selected ]]; then
        	# Highlight the selected file with a ">" symbol
	        printf "\e[35m> \e[0m%s\n" "${song_names[$i]}"
        else
        	printf "  %s\n" "${song_names[$i]}"
	    fi
    done
        
	# Read a single character from the user
    read -rsn1 -d '' input
	# Execute actions based on the user input
	case $input in
		'q')  # Quit
			exit
			;;
		$'A')  # Up arrow
	        if [ $selected -gt 0 ]
			then
				selected=$((selected - 1))
			fi
			;;
		$'B')  # Down arrow
			if [[ $selected -lt $i ]]
			then
				selected=$((selected + 1))
			fi
			;;
		# Play selected song
		 $'o')
    		# Kill previous song
    		if [ $now_playing -ne -1 ]
    		then
    		    pkill mpg123
    		fi
    		# Play selected song
			mpg123 --quiet "${songs[$selected]}" > /tmp/mpg123.out 2>&1 &
    		now_playing=$selected	
			;;
        $'p') # Pause
			kill -STOP $(pgrep mpg123) > /dev/null 2>&1
			;;
		$'c') # Continue
			kill -CONT $(pgrep mpg123) > /dev/null 2>&1
			;;
		$'s') # Stop
			pkill mpg123
			now_playing=-1
			;;
		$'C') # Next
			pkill mpg123
			if [ $now_playing -lt $i ]
			then
				now_playing=$((now_playing + 1))	
			fi
			mpg123 --quiet "${songs[$now_playing]}" > /tmp/mpg123.out 2>&1 &
			;;
		$'D') # Back
			pkill mpg123
			if [ $now_playing -gt 0 ]
			then
				now_playing=$((now_playing - 1))
			fi
			mpg123 --quiet "${songs[$now_playing]}" > /tmp/mpg123.out 2>&1 &
			;;
    esac
done

# Do something with the selected file
echo "You selected: $selected_file"
# Run song while showing menu and player options


# Test run
mpg123 --quiet Playlist/15\ Weight\ of\ the\ World\ English\ Version.mp3 > /tmp/mpg123.out 2>&1 &

# kill -STOP $(pgrep mpg123)

# kill -CONT $(pgrep mpg123) 2>/dev/null
