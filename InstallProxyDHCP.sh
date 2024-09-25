#!/bin/sh

#Baixa os pacotes base do github
curl  https://raw.githubusercontent.com/tialexandre/Pfsense/refs/heads/main/check_proxy_wpad.sh > /root/check_proxy_wpad.sh
curl  https://raw.githubusercontent.com/tialexandre/Pfsense/refs/heads/main/nginx-wpad.conf> /var/etc/nginx-wpad.conf 
curl  https://raw.githubusercontent.com/tialexandre/Pfsense/refs/heads/main/wpad-mime.types > /var/etc/wpad-mime.types
curl  https://raw.githubusercontent.com/tialexandre/Pfsense/refs/heads/main/wpad.dat > /usr/local/www/wpad.dat

#Da as devidas permissões nos arquivos
chmod +x /root/check_proxy_wpad.sh
chmod +x /var/etc/nginx-wpad.conf 
chmod +x /var/etc/wpad-mime.types
chmod +x /usr/local/www/wpad.dat

#instala dependencia para editar aqruivo
echo y | pgk install nano 

#abre arquivo Wpad para edição 
nano /usr/local/www/wpad.dat
