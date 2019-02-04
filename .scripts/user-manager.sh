#!/bin/bash
OP=0

# Run as root, of course.
if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "Must be root to run this script."
	exit 
fi

echo Menu
echo "[1] Show users with /home"
echo "[2] Baja usuario"
echo "[3] Alta usuario"
echo "Elegir opcion"
read OP
case $OP in
    1)	clear
        cut -f 1,6 /etc/passwd -d : | grep home | sort
        ;;
    2)	printf "Indica el nombre del usuario a borrar"
	read -p "Nombre del usuario a borrar: `echo $'\n> '`" nombre
	userdel $nombre
	echo Usuario borrado
        ;;
    3)	echo Indica el nombre del usuario a crear
        read nombre
	useradd -m -d /home/alumnos/$nombre $nombre -s /bin/bash 
	echo Usuario: $nombre 
	echo Home: /home/alumnos/$nombre
	echo Grupos:
	grep $nombre /etc/group | cut -f 1 -d :
#    4)	clear
#        ls -l | grep "^d"
#        ;;
#    5)	clear
#        ;;
esac

