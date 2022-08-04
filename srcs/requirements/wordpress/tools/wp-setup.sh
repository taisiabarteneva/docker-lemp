#!/bin/bash

chmod -R 755 /var/www/html/wordpress;
chown -R www-data:www-data /var/www/html/wordpress;
# create the folder to enable php start
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    cd /var/www/html/wordpress
    wp core download --allow-root
    mv /var/www/wp-config.php /var/www/html/wordpress
    chmod 777 /var/www/html/wordpress/wp-config.php
    wp core install --allow-root --url=${WP_WEBSITE_URL} --title=${WP_WEBSITE_TITLE} --admin_user==${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root
    wp user create --allow-root wurrigon42 wurrigon42@42.fr --role=author --user_pass=pseudoroot
fi

chmod +x /var/www/html/wordpress/*.php

/usr/sbin/php-fpm7.3 --nodaemonize