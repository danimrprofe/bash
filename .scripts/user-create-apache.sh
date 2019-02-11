#!/bin/bash

#Es necesario permitir acceso al bloque directory / en el archivo apache2.conf para qué funcione
if [ -z $1 ]
then
	echo "Uso del comando:"
	echo "---------------"
	echo "user-create-apache.sh <nombreusuario>"
	echo "Ejemplo:"
    echo "sh manolo o ./manolo"
else

username="$1"
site_user="/etc/apache2/sites-enabled/$username.lan.conf"

# Creamos un site para el usuario

printf "Creando site: $site_user\n"

    echo "<VirtualHost *:80>" > "$site_user"
    echo -e "\tServerAdmin $username@$username.lan" >> "$site_user"
    echo -e "\tServerName $username.lan" >> "$site_user"
    echo -e "\tServerAlias www.$username.lan" >> "$site_user"
    echo -e "\tDocumentRoot /srv/www/$username/www" >> "$site_user"
    echo -e "\tErrorLog /srv/www/$username.lan/logs/error.log" >> "$site_user"
    echo -e "\tCustomLog /srv/www/$username.lan/logs/access.log combined" >> "$site_user"
    echo "</VirtualHost>" >> "$site_user"

    echo "" >> "$site_user"
    echo "Alias /$username '/srv/www/$username/www'" >> "$site_user"
    echo -e "<Directory '/srv/www/$username/www'>" >> "$site_user"
    echo -e "\tOptions Indexes FollowSymLinks MultiViews" >> "$site_user"
    echo -e "\tAllowOverride All" >> "$site_user"
    echo -e "\tOrder deny,allow" >> "$site_user"
    echo -e "\tAllow from all" >> "$site_user"
echo "</Directory>" >> "$site_user"

# Crear estructura de carpetas para el contenido web

printf "Creando carpetas web\n"

mkdir -p "/srv/www/$username/www"
mkdir -p "/srv/www/$username.lan/logs/"
chmod 755 "/srv/www/$username/www"

# Crear archivo index.html por defecto

echo "<!DOCTYPE html>" > "/srv/www/$username/www/index.html"
echo "<html>" >> "/srv/www/$username/www/index.html"
echo -e "\t<head>" >> "/srv/www/$username/www/index.html"
echo -e "\t\t<meta charset=\"utf-8\">" >> "/srv/www/$username/www/index.html"
echo -e "\t\t<title>Server page</title>" >> "/srv/www/$username/www/index.html"
echo -e "\t</head>" >> "/srv/www/$username/www/index.html"
echo -e "\t<body>" >> "/srv/www/$username/www/index.html"
echo -e "\t\t<div id=\"greetings\" style=\"width: 70%; margin: 0 auto; margin-top: 30vh; text-align: center;\">" >> "/srv/www/$username/www/index.html"
echo -e "\t\t\t<h1>Welcome $username!</h1>" >> "/srv/www/$username/www/index.html"
echo -e "\t\t\t<h2>This is your own server page.</h2>" >> "/srv/www/$username/www/index.html"
echo -e "\t\t</div>" >> "/srv/www/$username/www/index.html"
echo -e "\t</body>" >> "/srv/www/$username/www/index.html"
echo "</html>" >> "/srv/www/$username/www/index.html"
fi
