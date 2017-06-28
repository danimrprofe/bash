contenido='cat /etc/passwd'
cut -f 1 /etc/passwd -d
echo $($contenido)
IFS=":"

echo "Los directorios en el path son:"
for i in $PATH
do
	echo $i
done
