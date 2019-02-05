#!/bin/bash
OP=0

bo=$(tput bold)
no=$(tput sgr0)

# Run as root, of course.

if [ "$UID" -ne "0" ]
then
        echo "Debes ser root para poder ejecutar este script"
        exit
fi
while true
do
clear
echo "-------------------------"
echo Menu
echo "-------------------------"
printf "Usuarios\n\n"
cat /etc/passwd | grep home | cut -f 1,6 -d : 
printf "\n\n"
echo "[q] Salir"
echo "[1] Usuarios con /home"
echo "[2] Borra usuario"
echo "[3] Crea usuario"
echo "[4] Últimos accesos"
echo "Elegir opcion"

read OP
case $OP in
    1)  clear
        cut -f 1,6 /etc/passwd -d : | grep home | sort
        read parar
        ;;
    2)  read -p "Nombre del usuario a borrar: `echo $'\n> '`" nombre
        read -p "Borrar carpeta home [s/n]: `echo $'\n> '`" borrarhome
        if [ "$borrarhome" == "s" ]
	then
		userdel -r $nombre 2>/dev/null
		printf "Home de ${bo}$nombre${no} borrada\n"
	else
		userdel $nombre 2> /dev/null
		printf "La home de ${bo}$nombre${no} no se borrará\n"
	fi
	if [ $? -eq 6 ]
	then
		echo "El usuario no está registrado en el sistema\n"
	else
        	printf "Usuario borrado\n"
        fi
	read -p "pulsa una tecla para continuar .." parar
	;;
    3)  echo "Creación de usuario:"
        read -p "Nombre del usuario a crear: `echo $'\n> '`" nombre
        if id "$nombre" > /dev/null 2>&1; then
		echo "el usuario ${bo}$nombre${no} ya existe"
	else
		read -p "Rol del usuario (A o P): `echo $'\n> '`" rol
        	if [ "$rol" == "A" ]
        	then
                	tipouser="alumnos"
        	elif [ "$rol" == "P" ]
        	then
                	tipouser="profesores"
        	else
                	exit
        	fi
		home_grupo="/home/$tipouser/"

		#Creamos carpeta de grupo di no existia en home
		if [ ! -d "$home_grupo" ]
		then
			mkdir $home_grupo; 
		fi
        	useradd -m -d /home/$tipouser/$nombre $nombre -s /bin/bash
        	passwd $nombre
        	echo Usuario: $nombre
        	echo Home: /home/$tipouser/$nombre
        	echo Grupos:
        	grep $nombre /etc/group | cut -f 1 -d :
	fi
	read parada
	;;
     4) lastlog | grep -v **Never
        read parada
        ;;
     q)  exit
esac
echo ""
done
