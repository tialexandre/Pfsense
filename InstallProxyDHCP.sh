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

# Pergunta qual é a rede LAN e armazena na variável LAN
echo "Digite a rede LAN (Exemplo: 192.168.1.0): "
read LAN

# Pergunta qual é o Proxy e armazena na variável PROXY
echo "Digite o endereço do Proxy (Exemplo: 192.168.1.1:3128): "
read PROXY

# Substitui o texto 10.4.1.0 pela variável LAN
sed -i "" "s/10.4.1.0/$LAN/g" /usr/local/www/wpad.dat

# Substitui o texto 10.4.1.254 pela variável PROXY
sed -i "" "s/10.4.1.254/$PROXY/g" /usr/local/www/wpad.dat

