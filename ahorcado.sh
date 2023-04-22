#!/bin/bash
function dibujo {
    case $1 in
    0)
    echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "         |         |"
echo "      ---|---      |"
echo "         |         |"
echo "         |         |"
echo "        / \        |"
echo "       /   \       |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
        ;;
    1)
        echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "         |         |"
echo "      ---|---      |"
echo "         |         |"
echo "         |         |"
echo "        /          |"
echo "       /           |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
        ;;
    2)
       echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "         |         |"
echo "      ---|---      |"
echo "         |         |"
echo "         |         |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
        ;;
    3)
echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "         |         |"
echo "      ---|         |"
echo "         |         |"
echo "         |         |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
        ;;
    4)
       echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "         |         |"
echo "         |         |"
echo "         |         |"
echo "         |         |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
        ;;
    5)
        echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
        ;;
    6)
        echo "          __________"
        echo "         |         |"
        echo "         |         |"
        echo "                   |"
        echo "                   |"
        echo "                   |"
        echo "                   |"
        echo "                   |"
        echo "                   |"
        echo "                   |"
        echo "                   |"
        echo "                   |"
        echo "      _____________|_____"
        echo "                           "
        ;;
    
  esac      
}
function empezarJuego {
clear   
 intentos=6   
 num=$(($RANDOM%19))
 palabra=${frutas[$num]}
longitud=${#palabra}
frase=()
i=0
while [ $i -lt $longitud ]
do
frase+=( "_" )
i=$((i+1))
done
while [ $intentos -ne 0 ]
do
clear
acierto=0
echo Categoria: $cat
echo Intentos: $intentos
dibujo $intentos
printf "\n\n\n"
echo ${frase[@]}

espacio=0
space="_"
for is in ${frase[@]}
do
    if [ $is == $space ]
    then
        espacio=$((espacio+1))
    fi
done
if [ $espacio -eq 0 ]
then
    echo !Felicidades has ganado!
    echo '          _____                    _____                    _____                    _____                    _____                _____                    _____          
         /\    \                  /\    \                  /\    \                  /\    \                  /\    \              /\    \                  /\    \         
        /::\    \                /::\    \                /::\____\                /::\    \                /::\    \            /::\    \                /::\    \        
       /::::\    \              /::::\    \              /::::|   |               /::::\    \              /::::\    \           \:::\    \              /::::\    \       
      /::::::\    \            /::::::\    \            /:::::|   |              /::::::\    \            /::::::\    \           \:::\    \            /::::::\    \      
     /:::/\:::\    \          /:::/\:::\    \          /::::::|   |             /:::/\:::\    \          /:::/\:::\    \           \:::\    \          /:::/\:::\    \     
    /:::/  \:::\    \        /:::/__\:::\    \        /:::/|::|   |            /:::/__\:::\    \        /:::/__\:::\    \           \:::\    \        /:::/__\:::\    \    
   /:::/    \:::\    \      /::::\   \:::\    \      /:::/ |::|   |           /::::\   \:::\    \       \:::\   \:::\    \          /::::\    \      /::::\   \:::\    \   
  /:::/    / \:::\    \    /::::::\   \:::\    \    /:::/  |::|   | _____    /::::::\   \:::\    \    ___\:::\   \:::\    \        /::::::\    \    /::::::\   \:::\    \  
 /:::/    /   \:::\ ___\  /:::/\:::\   \:::\    \  /:::/   |::|   |/\    \  /:::/\:::\   \:::\    \  /\   \:::\   \:::\    \      /:::/\:::\    \  /:::/\:::\   \:::\    \ 
/:::/____/  ___\:::|    |/:::/  \:::\   \:::\____\/:: /    |::|   /::\____\/:::/  \:::\   \:::\____\/::\   \:::\   \:::\____\    /:::/  \:::\____\/:::/__\:::\   \:::\____\
\:::\    \ /\  /:::|____|\::/    \:::\  /:::/    /\::/    /|::|  /:::/    /\::/    \:::\  /:::/    /\:::\   \:::\   \::/    /   /:::/    \::/    /\:::\   \:::\   \::/    /
 \:::\    /::\ \::/    /  \/____/ \:::\/:::/    /  \/____/ |::| /:::/    /  \/____/ \:::\/:::/    /  \:::\   \:::\   \/____/   /:::/    / \/____/  \:::\   \:::\   \/____/ 
  \:::\   \:::\ \/____/            \::::::/    /           |::|/:::/    /            \::::::/    /    \:::\   \:::\    \      /:::/    /            \:::\   \:::\    \     
   \:::\   \:::\____\               \::::/    /            |::::::/    /              \::::/    /      \:::\   \:::\____\    /:::/    /              \:::\   \:::\____\    
    \:::\  /:::/    /               /:::/    /             |:::::/    /               /:::/    /        \:::\  /:::/    /    \::/    /                \:::\   \::/    /    
     \:::\/:::/    /               /:::/    /              |::::/    /               /:::/    /          \:::\/:::/    /      \/____/                  \:::\   \/____/     
      \::::::/    /               /:::/    /               /:::/    /               /:::/    /            \::::::/    /                                 \:::\    \         
       \::::/    /               /:::/    /               /:::/    /               /:::/    /              \::::/    /                                   \:::\____\        
        \::/____/                \::/    /                \::/    /                \::/    /                \::/    /                                     \::/    /        
                                  \/____/                  \/____/                  \/____/                  \/____/                                       \/____/         
                                                                                                                                                                           '
    read
    return 0
fi
    printf "\n\n"
    echo la palabra tiene la primer letra mayuscula
    echo ingresa una letra
    read caracter
i=0
while [ $i -lt $longitud ]
do
    if [ $caracter == ${palabra:$i:1} ]
    then
    frase[i]=$caracter
    acierto=$((acierto+1))
    fi
    i=$((i+1))
done
    if [ $acierto -eq 0 ]
    then
        intentos=$((intentos-1))
    fi
done
clear
echo INTENTOS: $intentos
dibujo $intentos
if [ $intentos -eq 0 ]
then
    printf "\n\n LO SIENTO, PERDISTE ):\n"
    echo La solucion era: $palabra
        echo ' _______  _______  _______  ______  _________ _______ _________ _______ 
(  ____ )(  ____ \(  ____ )(  __  \ \__   __/(  ____ \\__   __/(  ____ \
| (    )|| (    \/| (    )|| (  \  )   ) (   | (    \/   ) (   | (    \/
| (____)|| (__    | (____)|| |   ) |   | |   | (_____    | |   | (__    
|  _____)|  __)   |     __)| |   | |   | |   (_____  )   | |   |  __)   
| (      | (      | (\ (   | |   ) |   | |         ) |   | |   | (      
| )      | (____/\| ) \ \__| (__/  )___) (___/\____) |   | |   | (____/\
|/       (_______/|/   \__/(______/ \_______/\_______)   )_(   (_______/'

    echo presiona una tecla para volver a jugar
    read
fi
}

repetir=0
while [ $repetir -lt 6  ]
do
clear
echo Bienvenido a Ahorcado
echo Elige una ccategoria:
echo "1. Frutas"
echo "2. Animales"
echo "3. paises"
echo "4. colores"
echo "5. apellidos"
echo "Presiona otro numero para salir"
read repetir
frutas=( "Melon" "Papaya" "Sandia" "Manzana" "Pera" "Naranja" "Uva" "Cereza" "Ciruela" "Kiwi" "Mandarina" "Aguacate" "Platano" "Tuna" "Limon" "Guayaba" "Fresa" "Coco" "Almendra" "Granada")
animales=( "Perro" "Gato" "Caballo" "Gallina" "Jirafa" "Mono" "Vaca" "Conejo" "Tortuga" "Lobo" "Tiburon" "Elefante" "Cabra" "Rinoceronte" "Cucaracha" "Mariposa" "Raton" "Leon" "Pato" "Rana")
paises=("Peru" "Colombia" "Argentina" "Nicaragua" "Italia" "Mexico" "Canada" "Venezuela" "Ecuador" "Brasil" "Rusia" "Francia" "Cuba" "Chile" "Japon" "China" "Corea" "Australia" "Pakistan" "Bolivia")
colores=("Rosa" "Negro" "Azul" "Amarillo" "Anaranjado" "Plateado" "Dorado" "Gris" "Cafe" "Blanco" "Verde" "Morado" "Turquesa" "Rojo" "Lila" "Marron" "Beige" "Vino" "Fuchsia" "Magenta")
apellidos=("Hernandez" "Garcia" "Martinez" "Lopez" "Perez" "Rodriguez" "Sanchez" "Ramirez" "Cruz" "Flores" "Gomez" "Juarez" "Diaz" "Aguirre" "Castillo" "Vargas" "Segura" "Rivera" "Morales" "Mendoza")
nombrecat=("Frutas" "Animales" "Paises" "Colores" "Apellidos")
	case $repetir in
		1)
		    juego=("${frutas[@]}")
		    cat=("${nombrecat[0]}")
			empezarJuego 
			;;
		2)
		    juego=("${animales[@]}")
		    cat=("${nombrecat[1]}")
			empezarJuego 
			;;
		3)
		    juego=("${paises[@]}")
		    cat=("${nombrecat[2]}")
			empezarJuego 
			;;
		4)
		    juego=("${colores[@]}")
		    cat=("${nombrecat[3]}")
			empezarJuego 
			;;
        5)
            juego=("${apellidos[@]}")
		    cat=("${nombrecat[4]}")
            empezarJuego 
            ;;
        *)
            clear
            echo adios
            repetir=6
            ;;
    esac
done