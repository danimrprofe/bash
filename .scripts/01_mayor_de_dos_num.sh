
#!bin/bash
echo Se han introducido $# parámetros
if [ $# -ne 2 ]
then
	echo Falta algun paraémtro
elif [ $1 -eq $2 ]
then
	echo Son iguales
elif [ $1 -lt $2 ]
then
	echo  $1 es menor
else
	echo $2 es menor
fi
 
