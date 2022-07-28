#!/bin/sh

openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes \
-out    /etc/ssl/wurrigon.42.fr.cert \
-keyout /etc/ssl/wurrigon.42.fr.key \
-subj "/C=RU/ST=Moscow/L=Moscow /O=21 School/OU=wurrigon/CN=wurrigon.42.fr/emailAddress=unknown"

exec "$@"