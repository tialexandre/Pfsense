#!/bin/sh

cd /var/etc/
if [ -f /var/etc/nginx-wpad.conf ]; then
  echo "nginx-wpad.conf -> ok"
else
 curl  http://datacenter.timr.com.br/pfsense/nginx-wpad.conf > /var/etc/nginx-wpad.conf 
chmod +x /var/etc/nginx-wpad.conf
fi

if [ -f /var/etc/wpad-mime.types ]; then
  echo "wpad-mime.types -> ok"
else
 curl  http://datacenter.timr.com.br/pfsense/wpad-mime.types > /var/etc/wpad-mime.types
chmod +x /var/etc/wpad-mime.types
fi

return=`/bin/ps ax | grep /var/etc/nginx-wpad.conf | /usr/bin/grep -v grep | wc -l | tr -d " "`
if [ $return -gt 0 ];then
    /bin/echo ok
else
    /usr/local/sbin/nginx -c /var/etc/nginx-wpad.conf
fi
