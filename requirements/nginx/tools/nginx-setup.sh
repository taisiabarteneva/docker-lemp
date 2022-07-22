#!/bin/sh

# openssl – activates the OpenSSL software
# req – indicates that we want a CSR
# –newkey – generate a new key
# rsa:2048 – generate a 2048-bit RSA mathematical key

if [ ! -f /etc/nginx/ssl/wurrigon.crt ] ; then 
    echo "setting up SSL";
    mkdir /etc/nginx/ssl
    chown -R root:root  /etc/nginx/ssl
    chmod -R 600        /etc/nginx/ssl
    openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -keyout /etc/nginx/ssl/wurrigon.key -out /etc/nginx/ssl/wurrigon.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow /O=21 School/OU=wurrigon/CN=wurrigon.42.fr/emailAddress=unknown"
fi

exec "$@"