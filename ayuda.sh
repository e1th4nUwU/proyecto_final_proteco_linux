#!/bin/bash
# Check if user has given an argument, if not, ask it
if [ -z $1 ] ; then
    echo ""
    read -p $'\e[35m-> \e[36mIngrese el comando del cual necesitas ayuda: \e[0m'  command
else 
    command=$1
fi
if [ -z $command ] ; then
    echo -e "\e[31m-> ERROR: No se ingresó ningún comando"
else 
    # Check if command was created by us
    case $command in
        "-a" ) # Descripción de todos los comandos
            ;;
        "-l" ) # Lista de comandos disponibles
            echo -e "\e[35m --------------------------"
            echo -e " || \e[36mComandos disponibles \e[35m||"
            echo -e " --------------------------\e[0m"
            echo -e "   ahorcado"    
            echo -e "   ayuda"
            echo -e "   buscar"
            echo -e "   creditos"
            echo -e "   infosis"
            echo -e "   musica"
            echo -e "   tiempo"
            ;;
        "ahorcado" ) # Juego ahorcado
            echo -e "\e[35m ---------------"
            echo -e " || \e[36mAhorcado  \e[35m||"
            echo -e " ---------------"
            echo -e "- \e[36mUso: \e[0m"
            echo -e "   ahorcado \e[0m"
            echo ""
            echo -e "- \e[36mDescripción: \e[0m"
            echo -e "   Se ejecuta el juego del ahorcado: se trata de adivinar una palabra secreta, ingresando letras. Si se adivina la palabra, se gana. Si se adivina la palabra, se pierde."
            ;;
        "ayuda" ) # Comando de ayuda
            echo -e "\e[35m -----------------------"
            echo -e " || \e[36mComando de ayuda  \e[35m||"
            echo -e " -----------------------"
            echo -e "- \e[36mUso: \e[0m"
            echo -e "   ayuda \e[0m"
            echo -e "   ayuda \e[1mcomando_a_consultar\e[0m"
            echo -e "   ayuda \e[1m-l\e[0m (ver lista de comandos disponibles))"
            echo -e "   ayuda \e[1m-a\e[0m (ver descripción todos los comandos disponibles)"
            echo ""
            echo -e "- \e[36mDescripción: \e[0m"
            echo -e "   Muestra la información de un comando creado por nosotros."  
            ;;
        "buscar" ) # Comando de búsqueda
            echo -e "\e[35m --------------------------"
            echo -e " || \e[36mComando de búsqueda  \e[35m||"
            echo -e " --------------------------"
            echo -e "- \e[36mUso: \e[0m"
            echo -e "   buscar"
            echo -e "   buscar \e[1;36mdirectorio_donde_buscar\e[0m"
            echo -e "   buscar \e[1;36mdirectorio_donde_buscar archivo_a_buscar\e[0m"
            echo ""
            echo -e "- \e[36mDescripción: \e[0m"
            echo -e "   Busca un archivo en el sistema de archivos: si lo encuentra muestra un mensaje de éxito, si no lo encuentra muestra que no lo encontró y si el directorio no existe muestra un mensaje de error."
            ;;
        "creditos" ) # Comando para ver créditos de los autores
            echo -e "\e[35m ------------------------------"
            echo -e " || \e[36mCréditos de los autores  \e[35m||"
            echo -e " ------------------------------"
            echo -e "- \e[36mUso: \e[0m"
            echo -e "   creditos \e[0m"
            echo ""
            echo -e "- \e[36mDescripción: \e[0m"
            echo -e "   Muestra los créditos de los autores del proyecto y un personaje de Among Us."
            ;;
        "infosis" ) # Comando para ver información del sistema
            echo -e "\e[35m ------------------------------"
            echo -e " || \e[36mInformación del sistema  \e[35m||"
            echo -e " ------------------------------"
            echo -e "- \e[36mUso: \e[0m"
            echo -e "   infosis \e[0m"
            echo ""
            echo -e "- \e[36mDescripción: \e[0m"
            echo -e "   Muestra información del sistema:
        * Memoria RAM (total, libre y disponible).
        * Arquitectura
        * Sistema operativo y versión del kernel"
            ;;
        "musica" ) # Reproductor de mp3
            echo -e "\e[35m -------------------------"
            echo -e " || \e[36mReproductor de mp3  \e[35m||"
            echo -e " -------------------------"
            echo -e "- \e[36mUso: \e[0m"
            echo -e "   musica \e[0m"
            echo -e "   musica \e[1mdirectorio_con_mp3\e[0m"
            echo ""
            echo -e "- \e[36mDescripción: \e[0m"
            echo -e "   Abre un reproductor de música en el directorio especificado que permite reproducir archivos mp3. Si no se especifica un directorio, se abre en el directorio actual."
            ;;
        
        "tiempo" )  # Ver tiempo actual
            echo -e "\e[35m ---------------------------------"
            echo -e " || \e[36mComando para ver el tiempo  \e[35m||"
            echo -e " ---------------------------------"
            echo -e "- \e[36mUso: \e[0m"
            echo -e "   tiempo \e[0m"
            echo ""
            echo -e "- \e[36mDescripción: \e[0m"
            echo -e "   Muestra la hora y fecha actual."
            ;;
        * ) # Cualquier otro input
            echo ""
            echo -e "\e[35m-> \e[31mLa información de este comando no está disponible con "ayuda""
            echo -e "\e[35m-> \e[36mPara ver la lista de comandos disponible, ejecute \e[1;36mayuda -l\e[0m"
            ;;
    esac
    echo ""
fi

