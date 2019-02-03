#!bin/bash
#Script de copia total
#variable con los directorios que se copian
directorio="/home/juan/carpeta"
#variable con el directorio donde se guarda la fecha del ultimo backup
fechacopia="/home/juan/copia"
#variable con el directorio donde se guarda la copia
backup="/home/juan/copia"
fecha=`date +"%y%b%d"` #fecha de la copia con formato año mes dia
#El comando tar empaqueta los archivos de directorios contenidos en $directorio
#Con 2> redirigimos los mensajes de error al fichero errores_$fecha.txt
tar -vcf $backup/copiatotal_$fecha.tar $directorio 2> $backup/errores_$fecha.txt
#escribo en el fichero logscopias.txt las fechas de las copias totales hechas
echo Copia total realizada_$fecha >> $backup/logscopias.txt
#Se da permisos de ejecucion con: chmod u+x copiatotal.sh
#
#Se ejecuta en terminal con: sh copiatotal.sh
#
#Si en errores sale Removin leading '/' from member names indica que al
#descomprimir quita la primera / de tal manera que se descomprime a partir de
#donde este el fichero copia
#ahora se realiza una copia del backup en otro sitio remoto con scp
scp $backup/copiatotal_$fecha.tar usuario@IP:/home/usuario
#donde usuario es el nombre asignado y IP la direccion IP del servidor
