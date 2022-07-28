FROM debian:buster

RUN apt update && apt -y install nginx openssl; \
    rm -rf /var/lib/apt/lists/*


COPY ./conf/nginx.conf      /etc/nginx/sites-available/default
COPY ./tools/key-gen.sh     /usr/bin

EXPOSE 443

VOLUME [ "/var/www/" ]

RUN chmod +x /usr/bin/key-gen.sh

ENTRYPOINT [ "/usr/bin/key-gen.sh" ]

# RUN chmod 777 /etc/ssl/*
# RUN chown -R www-data /var/www/

CMD ["nginx", "-g", "daemon off;"]