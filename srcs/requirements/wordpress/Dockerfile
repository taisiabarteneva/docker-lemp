FROM debian:buster

RUN apt update && apt -y install php7.3 php-mysql php-fpm wget; \
    rm -rf /var/lib/apt/lists/*

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/ /var/www/

RUN chmod +x /var/www/wp-setup.sh

ENTRYPOINT [ "bash", "/var/www/wp-setup.sh" ]