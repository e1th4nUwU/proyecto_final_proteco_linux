#!/bin/bash
function search()
{
	if [ -d $1 ] ; then
		if [[ -f "$1/$2" ]]; then
			echo -e "\n\e[92m	EL ARCHIVO SI ESTA EN EL DIRECTORIO"
		else 
			echo -e "\n\e[33m	EL ARCHIVO NO ESTA EN EL ESE DIRECTORIO"
		fi
	else
		echo -e "\n\e[31m	!!! NO EXISTE ESE DIRECTORIO !!!"
	fi
}
if [ $1 ]; then
	if [ $2 ] ; then
		search $1 $2
	else
		read -p $'\e[35m-> \e[36mIngrese el nombre del archivo que se va a buscar: \e[0m'  dir
		search $1 $dir
	fi
else 
	read -p $'\e[35m-> \e[36mIngrese el nombre del directorio dentro del que se va a buscar: \e[0m'  dir
	read -p $'\e[35m-> \e[36mIngrese el nombre del archivo a buscar: \e[0m'  file
	search $dir $file
fi
echo -e "\e[0m"
