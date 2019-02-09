#!/bin/bash

carpetawww=/var/www/html
# Instalacion de apache

read -p "instalación de apache" parada

sudo apt purge apache2 -y
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

read -p "instalación de mysql" parada
# Instalacion de mysql

sudo apt purge mysql-client mysql-server -y
sudo apt install mysql-client mysql-server -y

read -p "instalación de php" parada
# Instalación de php 
sudo apt-get install php7.2 php7.2-mysql libapache2-mod-php7.2 php7.2-cli php7.2-cgi php7.2-gd  -y

read "descarga de wordpress" parada
# Descarga archivos de wordpress

wget -c http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz

if [[ ! -d $carpetawww ]]; then
    mkdir $carpetawww
fi

chown -R www-data:www-data $carpetawww
chmod 755 $carpetawww
sudo rsync -av wordpress/* $carpetawww
sudo mv $carpetawww/wp-config-sample.php $carpetawww/wp-config.php


# Cambiar permisos

sudo chown -R www-data:www-data $carpetawww
sudo chmod -R 755 $carpetawww

read -p "creación de base de datos" parada
# Crear BD

dbuser="root"
password=""
hostname="localhost"

mysql -u$dbuser -p$password -h$hostname -v -e "CREATE DATABASE wp_myblog\G"
mysql -u$dbuser -p$password -h$hostname -v -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'Passw0rd1'\G"
mysql -u$dbuser -p$password -h$hostname -v -e "GRANT ALL ON wp_myblog.* TO 'wpuser'@'localhost'\G"
mysql -u$dbuser -p$password -h$hostname -v -e "FLUSH PRIVILEGES\G"

sed -i -e "s/database_name_here/wp_myblog/g" $carpetawww/wp-config.php
sed -i -e "s/username_here/wpuser/g" $carpetawww/wp-config.php
sed -i -e "s/password_here/Passw0rd1/g" $carpetawww/wp-config.php


# Reiniciar servicios
read -p "reinicio de servicios" parada
sudo systemctl restart apache2.service
sudo systemctl restart mysql.service
