#!/bin/bash

# Localizaciones

carpeta_samba="/srv/samba"
smb_conf="/etc/samba/smb.conf"

# Instalación de samba

apt-get install libcups2 samba samba-common cups -y

# si ya existía un archivo de configuración, guardamos una copia

if [ ! -f $smb_conf.bak ]; then
    cp $smb_conf $smb_conf.bak
fi

mkdir -p $carpeta_samba/users/
chown -R root:users $carpeta_samba/users/
chmod -R 775 $carpeta_samba/users/

# Configuración global para todos los recursos compartidos
# Para saber el grupo de trabajo (en CMD): net config workstation

echo "[global]" > smb_conf
echo "workgroup = WORKGROUP" >> smb_conf
echo "server string = Samba Server %v" >> smb_conf
echo "netbios name = debian" >> smb_conf
echo "security = user" >> smb_conf
echo "map to guest = bad user" >> smb_conf
echo "dns proxy = no" >> smb_conf

# Accesible y permiso de escritura para miembros del grupo "users"

#echo " " >> smb_conf
#echo "[users]" >> smb_conf
#echo "comment = All Users" >> smb_conf
#echo "path = $carpeta_samba/users" >> smb_conf
#echo "valid users = @users" >> smb_conf
#echo "force group = users" >> smb_conf
#echo "create mask = 0660" >> smb_conf
#echo "directory mask = 0771" >> smb_conf
#echo "writable = yes" >> smb_conf
#echo " " >> smb_conf

# Carpeta accesible a todos los usuarios: \\server\public

echo "[public]" >> smb_conf
echo "comment= Carpeta publica acceso anónimo" >> smb_conf
echo "path=/srv/samba/" >> smb_conf
echo "browsable=yes" >> smb_conf
echo "create mask=0660" >> smb_conf
echo "directory mask=0771" >> smb_conf
echo "writable=yes" >> smb_conf
echo "guest ok=yes" >> smb_conf

# Permitir que los usuarios puedan leer y escribir en sus homes

echo "[homes]" >> smb_conf
echo "comment = Home Directories" >> smb_conf
echo "browseable = no" >> smb_conf
echo "valid users = %S" >> smb_conf
echo "writable = yes" >> smb_conf
echo "create mask = 0700" >> smb_conf
echo "directory mask = 0700" >> smb_conf

# Reiniciar samba
systemctl restart smbd.service
