echo $PATH
IFS=":"

echo "Los directorios en el path son:"
for i in $PATH
do
	echo $i
done
