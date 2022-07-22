FROM debian:buster

RUN set -ex; \
    apt update; \
    apt -y install php7.3 php-mysqli php-fpm wget sendmail; \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf    /etc/php/7.3/fpm/pool.d
COPY ./tools            /var/www/

RUN chmod +x /var/www/wp-setup.sh

EXPOSE 9000

ENTRYPOINT [ "/var/www/wp-setup.sh" ]

# CMD ["/usr/sbin/php-fpm7.3", "-F"]