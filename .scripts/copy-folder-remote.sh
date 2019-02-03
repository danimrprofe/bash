#!bin/bash

#Script de copia total de una carpeta
#Se da permisos de ejecucion con: chmod u+x copiatotal.sh
#Se ejecuta en terminal con: sh copiatotal.sh

carpeta_origen="/home/juan/carpeta" #carpeta a copiar
carpeta_destino="/home/juan/copia" #variable con el directorio donde se guarda la copia
fecha=`date +"%y%b%d"` #fecha de la copia con formato año mes dia

#El comando tar empaqueta los archivos de directorios contenidos en $directorio
#Con 2> redirigimos los mensajes de error al fichero errores_$fecha.txt
tar -vcf $carpeta_destino/copiatotal_$fecha.tar $carpeta_origen 2> $backup/errores_$fecha.txt
#escribo en el fichero logscopias.txt las fechas de las copias totales hechas
echo Copia total realizada_$fecha >> $backup/logscopias.txt

#ahora se realiza una copia del backup en otro sitio remoto con scp
scp $backup/copiatotal_$fecha.tar usuario@IP:/home/usuario

