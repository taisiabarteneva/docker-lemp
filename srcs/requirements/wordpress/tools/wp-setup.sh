#!/bin/bash

chmod -R 755 /var/www/html/wordpress;
chown -R www-data:www-data /var/www/html/wordpress;
mkdir -p /run/php/ # create the folder to enable php start
touch /run/php/php7.3-fpm.pid

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    wp core download --path=/var/www/html/wordpress --allow-root
    mv /var/www/wp-config.php /var/www/html/wordpress
    chmod 777 /var/www/html/wordpress/wp-config.php

    mv /var/www/static-page/ /var/www/html/wordpress/
    chown -R www-data:www-data /var/www/html/wordpress/static-page

    wp core install --path=/var/www/html/wordpress --allow-root --url=${WP_WEBSITE_URL} --title=${WP_WEBSITE_TITLE} --admin_user==${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root
    wp user create --path=/var/www/html/wordpress --allow-root wurrigon42 wurrigon42@42.fr --role=author --user_pass=pseudoroot

    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
fi

wp redis enable --allow-root

/usr/sbin/php-fpm7.3 --nodaemonize