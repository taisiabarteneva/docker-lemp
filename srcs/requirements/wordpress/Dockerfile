FROM debian:buster

RUN apt update && apt -y install php7.3 php-mysql php-fpm wget sendmail; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir -p /var/www/static-page

EXPOSE 9000

COPY ./conf/www.conf        /etc/php/7.3/fpm/pool.d
COPY ./tools/               /var/www/
COPY ./static-website/      /var/www/static-page/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/wordpress

RUN chmod +x /var/www/wp-setup.sh

ENTRYPOINT [ "bash", "/var/www/wp-setup.sh" ]