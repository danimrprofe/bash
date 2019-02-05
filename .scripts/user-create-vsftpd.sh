#!/bin/bash

# Este script permite crear un servidor FTP para subir archivos a la carpeta web
# apache del usuario
# La carpeta del site es: /srv/www/$username/www
# 
# IMPORTANTE: para que cuando el usuario conecta por FTP vaya a parar a su carpeta web
# he tenido que cambiar la home del usuario a /srv/www/usuario/www.
# >>>> usermod --home /srv/www/sansa/www sansa

username="$1"
usr_conf_dir="/etc/vsftpd/users"
usr_conf_file="/etc/vsftpd/users/$username"
vsftpd_conf="/etc/vsftpd/vsftpd.conf"

# Creamos un site para el usuario

printf "Creando archivo de configuración: $vsftpd_conf\n"

#CONEXIONES

echo "listen=NO" > "$vsftpd_conf"
echo -e "listen_ipv6=YES" >> "$vsftpd_conf"
echo -e "connect_from_port_20=YES" >> "$vsftpd_conf"

#>> MISCELANEA (Muestra ocultos y no muestra info propietarios)
echo -e "force_dot_files=YES" >> "$vsftpd_conf"
echo -e "hide_ids=YES" >> "$vsftpd_conf"
echo -e "utf8_filesystem=YES" >> "$vsftpd_conf"
echo -e "use_localtime=YES" >> "$vsftpd_conf"

#>> USUARIOS ANONIMOS (Permite anónimos, pueden subir contenido pero no crear carpetas)
echo -e "anonymous_enable=YES" >> "$vsftpd_conf"
echo -e "anon_upload_enable=YES" >> "$vsftpd_conf"
echo -e "anon_mkdir_write_enable=NO" >> "$vsftpd_conf"

#>> USUARIOS LOCALES (Permite usuarios locales, pueden escribir, se enjaulan en sus homes)
echo -e "local_enable=YES" >> "$vsftpd_conf"
echo -e "write_enable=YES" >> "$vsftpd_conf"
echo -e "user_config_dir=$usr_conf_dir" >> "$vsftpd_conf"


#>> OPCIONES DE ENJAULADO
echo -e "chroot_local_user=YES" >> "$vsftpd_conf"

#>> LOGGING
echo -e "xferlog_enable=YES" >> "$vsftpd_conf"
echo -e "xferlog_file=/var/log/vsftpd.log" >> "$vsftpd_conf"
echo -e "xferlog_std_format=YES" >> "$vsftpd_conf"

echo -e "#chown_uploads=YES" >> "$vsftpd_conf"
echo -e "#chown_username=whoever" >> "$vsftpd_conf"

echo -e "#TIMEOUTS" >> "$vsftpd_conf"
echo -e "#idle_session_timeout=600" >> "$vsftpd_conf"
echo -e "#data_connection_timeout=120" >> "$vsftpd_conf"

printf "Creando archivo de configuración de usuario en $usr_conf_file\n"

mkdir -p $usr_conf_dir
echo -e "local_root=/srv/www/$username/www" > "$usr_conf_file"
echo -e "dirlist_enable=YES" >> "$usr_conf_file"
echo -e "download_enable=YES" >> "$usr_conf_file"
echo -e "write_enable=YES" >> "$usr_conf_file"
