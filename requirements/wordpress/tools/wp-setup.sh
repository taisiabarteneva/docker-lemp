#!/bin/bash

# -R рекурсивное изменение прав доступа для каталогов и их содержимого
# chmod -R 775    /var/www/*;
# # Следующий пример изменит владельца всех файлов и 
# # подкаталогов в /var/www/html/wordpress каталоге на нового владельца и группу с именем www-data :
# chown -R www-data:www-data /var/www/*;
# mkdir -p /run/php/;
# touch /run/php/php7.3-fpm.pid;

# if [ ! -f var/www/html/wp-config.php ]; then
#     mkdir -p /var/www/html
#     # После проверки требований загрузите файл wp-cli.phar , используя wget или curl:
#     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
#     chmod +x wp-cli.phar;
#     mv wp-cli.phar /usr/local/bin/wp;
#     cd /var/www/html;
#     wp core download --allow-root;
#     mv /var/www/wp-config.php   /var/www/html/;
#     # echo "Wordpress: creating users..."
#     # Creates the WordPress tables in the database using the URL, title, and default admin user details provided
#     # --url=<url-address>
#     # --title=<site-title>
#     # --admin_user=<name>
#     # [--admin_password=<passwrd>] by default, randomly-generated string
#     # --admin_email=<email>
#     wp core install --allow-root
#                     --url=${WP_URL}
#                     --title=${WP_WEBSITE_TITLE}
#                     --admin_user=${WP_ADMIN_USER}
#                     --admin_password=${WP_ADMIN_PASSWRD}
#                     --skip_email
#                     # --admin_email=${WP_ADMIN_EMAIL}
#     wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWRD}
# fi

# exec "$@"

sleep infinity
