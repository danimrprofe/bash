#!/bin/bash

echo "Instruccions"
echo "user-create2.sh nom tipus"
echo "nom = nom de l' usuari"
echo "tipus = A per alumne o P per professor"

case $2 in
A)
	$grup="alumnes"
	$casa="/home/alumnes/$1"
;;
P)
	$grup="professors"
	$casa="/home/professors/$1"
;;


useradd -G $grup -d $casa -m $1
