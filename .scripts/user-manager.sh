#!/bin/bash 
OP=0
do
clear echo Menu
echo "[1] Alta usuario"
echo "[2] Baja usuario"
echo "[3] Buscar un fichero"
echo "[4] Listar sólo directorios"
echo "Elegir opcion"
read OP
case $OP in
    1)	clear
        sh altausu
        ;;
    2)	clear
        # Si tiene permiso de ejecución 
        bajausu
        ;;
    3)	clear
        sh buscar 
    4)	clear
        ls -l | grep "^d"
        ;;
    5)	clear
        ;;
esac
done
