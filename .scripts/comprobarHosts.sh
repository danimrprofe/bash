# !bin/bash
# Este script pretende comprobar la conectividad de un rango de IP
# Ejemplo de uso: sh comprobarHosts.sh 1 255

if [ $# -eq 2 ]
then
	if [ $1 -ge $2 ]
	then
		echo El primer número debe ser menor que el segundo
	else
		lim_inf=$1
		lim_sup=$2

		sufijo=$lim_inf
		while [ $sufijo -le $lim_sup ]
		do
			IP=192.168.1.$sufijo
			ping -c 1 $IP >/dev/null	#1
			if [ $? -ne 0 ]		#2
			then
				echo "Host $IP : No contesta"
			else
				echo "Host $IP : OK"
			fi

			sufijo=$((sufijo+1))
		done
	fi
else
	echo No se han especificado dos parámetros
	exit 1
fi

#1 con >/dev/null hacemos que no aparezca nada por antalla
#2 nos devolverá el codigo 0 si todo ha ido ok, por lo tanto el host existe y responde

