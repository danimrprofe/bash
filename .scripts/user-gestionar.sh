#!/bin/bash
OP=0

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
    2)  printf "Indica el nombre del usuario a borrar"
        read -p "Nombre del usuario a borrar: `echo $'\n> '`" nombre
        userdel $nombre > /dev/null
	if [ $? -eq 6 ]
	then
		echo El usuario no está registrado en el sistema
	else
        	echo Usuario borrado
        fi
	read parar
	;;
    3)  echo "Creación de usuario:"
        read -p "Nombre del usuario a crear: `echo $'\n> '`" nombre
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
        if [ -d "$DIRECTORY" ]; then mkdir /home/$tipouser; fi
        useradd -m -d /home/$tipouser/$nombre $nombre -s /bin/bash
        passwd $nombre
        echo Usuario: $nombre
        echo Home: /home/$tipouser/$nombre
        echo Grupos:
        grep $nombre /etc/group | cut -f 1 -d :
        ;;
     4) lastlog | grep -v **Never
        read parada
        ;;
     q)  exit
esac
echo ""
done
