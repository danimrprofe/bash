#!/bin/bash

# Instalacion de apache

READ "instalación de apache" parada

sudo apt install apache2 -y
sudo systemctl enable apache2 -y
sudo systemctl start apache2 -y

READ "instalación de mysql" parada
# Instalacion de mysql

sudo apt-get installmysql-client mysql-server -y

READ "instalación de php" parada
# Instalación de php 
sudo apt-get install php7.2 php7.2-mysql libapache2-mod-php7.2 php7.2-cli php7.2-cgi php7.2-gd  -y

READ "descarga de wordpress" parada
# Descarga archivos de wordpress

wget -c http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz

if [[ ! -d /var/www/html/ ]]; then
    mkdir /var/www/html/
fi

chown -R www-data:www-data /var/www/html/
chmod 755 /var/www/html/
sudo rsync -av wordpress/* /var/www/html/

# Cambiar permisos

sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

READ "creación de base de datos" parada
# Crear BD
mysql -udbuser -ppassword -hhostname -v -e 'CREATE DATABASE wp_myblog\G'
mysql -udbuser -ppassword -hhostname -v -e 'CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'Pa$$w0rd1'\G'
mysql -udbuser -ppassword -hhostname -v -e 'GRANT ALL ON wp_myblog.* TO 'wpuser'@'localhost'\G'
mysql -udbuser -ppassword -hhostname -v -e 'FLUSH PRIVILEGES\G'

# Reiniciar servicios
READ "reinicio de servicios" parada
sudo systemctl restart apache2.service 
sudo systemctl restart mysql.service

sqlp
