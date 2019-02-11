
#!bin/basj
if [ -z $1 ]
then
	echo "Uso del comando:"
	echo "---------------"
	echo "user-massive-delete.sh <nombreRaiz> <contraseña> <numerousuarios>"
	echo "Ejemplo:"
	echo "sh user-massive-delete.sh alumno fpbasica 10"
else
	RAIZ=$1
	PRIMER_USER=$2
	ULTIMO_USER=$3

	IND=$PRIMER_USER
	while [ $IND -le $ULTIMO_USER ]
	do
		userdel -r $RAIZ$IND >/dev/null  2>&1
		if [ $? -ne 0 ]
		then
			echo $RAIZ$IND no ha podido ser borrado
			touch log.txt
			echo $RAIZ$IND no ha podido ser borrado > log.txt
		else		
			echo "$RAIZ$IND ha sido BORRADO!"
		fi
		IND=$(($IND+1))
	done
	cat /etc/passwd | grep -i $RAIZ
fi
