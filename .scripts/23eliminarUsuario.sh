#!/bin/bash clear
echo "Introducir nombre de usuario" read USU
userdel $USU $> /dev/null
if [ $? -eq 6 ]
then
    echo El usuario no está registrado en el sistema. Pulse una tecla para continuar ...
    read pausa
fi
