#!/bin/bash
# Overwrite the exit command
exit() {
    :
}
# Overwrite the default trap for SIGTSTP, SIGINT and SIGTERM
trap ' ' SIGTSTP SIGINT SIGTERM
while true
do
    # Get current directory, and replace home directory with ~
    DIR=$( basename "$PWD" | sed "s|$HOME|~|" )
    
    # Show prompt with colors and read input
    printf "\e[35m|| <<\e[1;36m$USER\e[0m\e[35m>> (\e[36m$DIR\e[35m) ||: \e[0m"
    read input
    
    # If command with the specified name exists inside the current directory, execute the script
    if [ -e "$(echo $input | cut -d ' ' -f1).sh" ]
    then
        if echo $input | grep -q " "; then
            source "./$(echo $input | cut -d ' ' -f1).sh" "$(echo $input | cut -d ' ' -f2)"
        else
	        source "./$input.sh"
        fi    
    # If input is "salir", exit the loopd
    elif [ "$input" == "salir" ]
    then
	break

    # Execute OS command
    else
	$input
    fi
done

# Return to the default trap for SIGTSTP, SIGINT and SIGTERM
trap - SIGTSTP SIGINT SIGTERM
