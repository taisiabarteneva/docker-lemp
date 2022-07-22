FROM debian:buster

RUN set -ex; \
    apt update; \
    apt -y install nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/default             /etc/nginx/sites-available/default
COPY ./tools/nginx-setup.sh     /var/www/

EXPOSE 443

RUN chmod +x /var/www/nginx-setup.sh

ENTRYPOINT [ "/var/www/nginx-setup.sh" ]

CMD ["nginx", "-g", "daemon off;"]