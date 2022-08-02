#!/bin/sh

sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/\#port/port/"      /etc/mysql/mariadb.conf.d/50-server.cnf

chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ] ; then

mysql_install_db --user=mysql --datadir=/var/lib/mysql

/usr/bin/mysql_secure_installation << EOF

y
superroot
superroot
y
n
y
y
EOF

service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root password $MYSQL_ROOT_PASSWORD
service mysql stop

else 

mkdir -p /var/run/mysqld
touch /var/run/mysqld/mysqld.pid
mkfifo /var/run/mysqld/mysqld.sock
chmod 644 /var/run/mysqld/mysqld.sock

fi

chown -R mysql:mysql /var/run/mysqld

exec "$@"