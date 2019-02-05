#!/bin/bash

username="$1"
site_user="/etc/apache2/sites-enabled/$username.lan.conf"

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

printf "Creando carpetas web\n"

mkdir -p "/srv/www/$username/www"
mkdir -p "/srv/www/$username.lan/logs/"
chmod 755 "/srv/www/$username/www"
