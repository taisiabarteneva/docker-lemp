#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = wordpress:9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
chown -R www-data:www-data /var/www/*;
chmod -R 755 /var/www/*;
# create the folder to enable php start
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    mkdir -p /var/www/html
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    cd /var/www/html/
    wp core download --allow-root
    mv /var/www/wp-config.php /var/www/html/
    # wp core config --path=/var/www/wordpress --dbhost=mariadb --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --allow-root
    wp core install --url=${WP_WEBSITE_URL} --title=${WP_WEBSITE_TITLE} --admin_user==${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root
    wp user create --allow-root wurrigon42 wurrigon42@42.fr --role=author --user_pass=pseudoroot
fi

/usr/sbin/php-fpm7.3 --nodaemonize