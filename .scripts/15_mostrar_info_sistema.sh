
#!bin/bash
clear
echo Script información de sistema
echo Pulsar intro para continuar
read pausa
clear

while :

do

clear
echo "Elige que es lo que quieres hacer:"
echo ""
echo "[1] Mostrar particiones"
echo "[2] Ocupación de las particiones"
echo "[3] Memoria fisica libre"
echo "[4] Espacio ocupado por los directorios"
echo "[5] Version del sistema operativo utilizado"
echo "[6] Salir"
read OP
clear
case $OP in

1) 	df;;
2)	df -a;;
3)	free;;
4)	du;;
5)	uname -a;;
6)	exit 1

esac

echo ""
echo "Pulsa intro para finalizar"
read pausa

done
