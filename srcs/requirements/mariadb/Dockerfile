FROM debian:buster

RUN apt update && apt install -y mariadb-server; \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3306

RUN sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf && \
    sed -i "s/#port/port/"      /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/   /usr/bin/

RUN chmod +x /usr/bin/createdb.sql && \ 
    service mysql start && \
    mysql < /usr/bin/createdb.sql && \
    rm -f /usr/bin/createdb.sql && \
    service mysql stop

CMD [ "mysqld_safe" ]