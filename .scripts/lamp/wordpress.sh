#!/bin/bash
if [ -z $1 ]
then
	echo "Uso del comando:"
	echo "---------------"
	echo "wordpress.sh <nombredelsite>"
	echo "Ejemplos:"
    echo "sh wordpress iesrocadragon"
    echo "./wordpress.sh iesrocadragon"
else
    silent="-qq"
    silent_wget="-q"
    subdominio="wp_$1"
    carpetawww=/var/www/html/$subdominio
    # Instalacion de apache

    read -p "instalación de apache" parada

    #sudo apt purge apache2 -y
    sudo apt $silent install apache2 -y
    sudo systemctl enable apache2
    sudo systemctl start apache2

    read -p "instalación de mysql" parada
    # Instalacion de mysql

    #sudo apt purge mysql-client mysql-server -y
    sudo apt $silent install mysql-client mysql-server -y 

    read -p "instalación de php" parada
    # Instalación de php 
    sudo apt $silent install php7.2 php7.2-mysql libapache2-mod-php7.2 php7.2-cli php7.2-cgi php7.2-gd -yqq $silent

    read -p "descarga de wordpress" parada
    # Descarga archivos de wordpress

    wget $silent_wget -c http://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz

    if [[ ! -d $carpetawww ]]; then
        mkdir $carpetawww
    else
        rm -rf $carpetawww/*
    fi

    chown -R www-data:www-data $carpetawww
    chmod 755 $carpetawww
    #sudo rsync -av wordpress/* $carpetawww
    cp -R wordpress/* $carpetawww
    sudo mv $carpetawww/wp-config-sample.php $carpetawww/wp-config.php


    # Cambiar permisos

    sudo chown -R www-data:www-data $carpetawww
    sudo chmod -R 755 $carpetawww

    read -p "creación de base de datos" parada
    # Crear BD

    dbuser="root"
    password=""
    hostname="localhost"

    mysql -u$dbuser -p$password -h$hostname -e "SOURCE wp.sql"

    #mysql -u$dbuser -p$password -h$hostname -v -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'Passw0rd1'\G"
    #mysql -u$dbuser -p$password -h$hostname -v -e "GRANT ALL ON wp_myblog.* TO 'wpuser'@'localhost'\G"
    #mysql -u$dbuser -p$password -h$hostname -v -e "FLUSH PRIVILEGES\G"

    sed -i -e "s/database_name_here/wp_myblog/g" $carpetawww/wp-config.php
    sed -i -e "s/username_here/wpuser/g" $carpetawww/wp-config.php
    sed -i -e "s/password_here/Passw0rd1/g" $carpetawww/wp-config.php

    # Reiniciar servicios
    read -p "reinicio de servicios" parada
    sudo systemctl restart apache2.service
    sudo systemctl restart mysql.service
fi
