#!/bin/sh

#Baixa os pacotes base
curl  http://datacenter.timr.com.br/pfsense/check_proxy_wpad.sh > /root/check_proxy_wpad.sh
curl  http://datacenter.timr.com.br/pfsense/nginx-wpad.conf > /var/etc/nginx-wpad.conf 
curl  http://datacenter.timr.com.br/pfsense/wpad-mime.types > /var/etc/wpad-mime.types
curl  http://datacenter.timr.com.br/pfsense/wpad.dat > /usr/local/www/wpad.dat
