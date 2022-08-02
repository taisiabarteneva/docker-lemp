#!/bin/bash

mkdir /run/php/
touch /run/php/php7.3-fpm.pid

if [ ! -f /var/www/wordpress/wp-config.php ]; then 
    mkdir /var/www/wordpress
    # cp -R /usr/src/wordpress /var/www
    wp core config --path=/var/www/wordpress --dbhost=mariadb --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --allow-root
    wp core install --path=/var/www/wordpress --url=${WP_WEBSITE_URL} --title=${WP_WEBSITE_TITLE} --admin_user==${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root
    wp user create --path=/var/www/wordpress --allow-root wurrigon42 wurrigon42@42.fr --role=author --user_pass=pseudoroot
fi

/usr/sbin/php-fpm7.3 --nodaemonize