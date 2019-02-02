#!/bin/bash
OP=0
clear
echo Menu
echo "[1] Show users with /home"
echo "[2] Baja usuario"
echo "[3] Buscar un fichero"
echo "[4] Listar sólo directorios"
echo "Elegir opcion"
read OP
case $OP in
    1)	clear
        cut -f 1,6 /etc/passwd -d : | grep home | sort
        ;;
#    2)	clear
#        # Si tiene permiso de ejecución 
#        bajausu
#        ;;
#    3)	clear
#        sh buscar 
#    4)	clear
#        ls -l | grep "^d"
#        ;;
#    5)	clear
#        ;;
esac

