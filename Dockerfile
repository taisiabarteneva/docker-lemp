FROM debian:buster

# --------- rm -rf /var/lib/apt/lists/* ---------
# When you run sudo apt-get update (or use the Refresh button in a package manager), 
# a list of packages will get downloaded from the Ubuntu servers. 
# These files are then stored in /var/lib/apt/lists/.
# You can safely remove the contents of that directory as it is recreated 
# when you refresh the package lists. If you remove the files, but do not 
# run apt-get update to fetch the lists, commands like apt-cache will fail 
# to provide information (since the cache is empty).

# --------- chmod 777 /var/run/mysqld ---------
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
RUN set -ex; \
    apt update; \
    apt install -y mariadb-server mariadb-client

# создаём папку, в которой должен лежать файл сокета
# создаём сам сокет командой mkfifo (хотя сокет — это тоже файл, создавать его можно только специальной программой — mkfifo)
# устанавливаем владельцем папки /var/run/mysqld пользователя mysql

#
ENV MYSQL_DATABASE_NAME wordpress
ENV MYSQL_USER mysql
ENV MYSQL_ROOT_PASSWORD superroot
ENV MYSQL_PASSWORD pseudoroot
#

VOLUME /var/lib/mysql

WORKDIR /usr/local/bin/

COPY ./tools/build.sh .
COPY ./conf/my.cnf .

RUN chmod +x /usr/local/bin/build.sh

# default port for MariaDB
EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/build.sh"]

# Command to launch mariadb and enable the database to listen globally
# CMD ["mysqld", "--bind-address=0.0.0.0"]
# Start MariaDB daemon
CMD ["mysqld_safe", "--user=mysql"]