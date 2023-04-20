#!/bin/bash

# Verify mpg123 installation, if not installed, try to install it
if ! which mpg123 >/dev/null; then
        echo -e "
        ->\e[31m ADVERTENCIA: NO TIENES INSTALADO EL PAQUETE mpg123
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

# Ask for folder; if user doesn't input anything, use current folder
# Menu to choose music
# Run song while showing menu and player options


# Test run
mpg123 --quiet Playlist/15\ Weight\ of\ the\ World\ English\ Version.mp3 > /tmp/mpg123.out 2>&1 &

# kill -STOP $(pgrep mpg123)

# kill -CONT $(pgrep mpg123) 2>/dev/null
