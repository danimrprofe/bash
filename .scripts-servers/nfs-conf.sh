#!/bin/bash


# Localizaciones

carpeta_nfs="/srv/nfs/share"
smb_conf="/etc/samba/smb.conf"

# Instalacion de NFS

apt-get install nfs-kernel-server nfs-common -y

# Backup del archivo de configuración

if [ ! -f /etc/exports.bak ]; then
    cp /etc/exports /etc/exports.bak
fi

# Crear la carpeta de recursos compartidos

if [[ ! -d $carpeta_nfs ]]; then
    mkdir $carpeta_nfs
    chmod 777 $carpeta_nfs
fi

echo "###### NFS SERVER CONFIGURATION ######" > /etc/exports
echo " " >> /etc/exports
echo "$carpeta_nfs  10.1.0.0/16(rw,sync,no_subtree_check,root_squash)" >> /etc/exports

# Exportar tabla de exportaciones
exportfs -av

# Reiniciar
/etc/init.d/nfs-kernel-server restart
