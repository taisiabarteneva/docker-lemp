# Docker builds images automatically by reading the instructions from a Dockerfile -- 
# a text file that contains all commands, in order, needed to build a given image
FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server

EXPOSE 3306

# COPY [--chown=<user>:<group>] <src>... <dest>
# The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www

RUN service mysql start && mysql < /var/www/init.sql && rm -f /var/www/init.sql

# CMD specifies what command to run within the container
CMD ["mysqld"] 