#!/bin/sh

if [ -d "/var/lib/mysql/$MYSQL_DATABASE_NAME" ]
then
    echo "Database ${MYSQL_DATABASE_NAME} already exists"
else 

mkdir /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# With permission of 777, any user can change my.cnf, which poses a big security risk
cp /usr/local/bin/my.cnf /etc/my.cnf && chmod 644 /etc/my.cnf

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# mysql_install_db initializes the MariaDB data directory and creates the system 
# tables in the mysql database, if they do not exist. MariaDB uses these tables to 
# manage privileges, roles, and plugins. It also uses them to provide the data for 
# the help command in the mysql client.

# is equivalent to service mysql start
/etc/init.d/mysql start

/usr/bin/mysql_secure_installation << EOF

y
superroot
superroot
y
n
y
y
EOF

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -uroot
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME" | mysql -uroot 
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO '$MYSQL_USER'@'%'" | mysql -uroot
echo "FLUSH PRIVILEGES " | mysql -uroot
mysqladmin --defaults-file=/etc/my.cnf -u root password $MYSQL_ROOT_PASSWORD

fi

/etc/init.d/mysql stop

exec "$@"

# To start mysqld at boot time you have to copy
# support-files/mysql.server to the right place for your system

# You can start the MariaDB daemon with:
# cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'

# You can test the MariaDB daemon with mysql-test-run.pl
# cd '/usr/mysql-test' ; perl mysql-test-run.pl

# error: 'Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock'
# Check that mysqld is running and that the socket: '/var/run/mysqld/mysqld.sock' exists!