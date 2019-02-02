#!bin/bash
if [ -z $1 ]
then
	echo "Uso del comando:"
	echo "---------------"
	echo "crearUsuarioMasivo.sh <nombreRaiz> <contraseña> <numerousuarios>"
	echo "Ejemplo:"
	echo "sh crearUsuarioMasivo.sh alumno fpbasica 10"
else
	RAIZ=$1
	PASSWORD=$2
	CANT_USUARIOS=$3

	IND=1
	while [ $IND -le $CANT_USUARIOS ]
	do
		useradd -m $RAIZ$IND -p $PASSWORD >/dev/null  2>&1
		if [ $? -ne 0 ]
		then
			echo $RAIZ$IND no ha podido ser creado
			touch log.txt
			echo $RAIZ$IND no ha podido ser creado > log.txt
		else		
			echo "$RAIZ$IND ha sido CREADO!"
		fi
		IND=$(($IND+1))
	done
fi
