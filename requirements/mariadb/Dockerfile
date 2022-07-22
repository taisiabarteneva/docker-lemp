# From what image we are building 
FROM debian:buster

RUN set -ex; \
    apt update; \
    apt install -y mariadb-server; \
    rm -rf /var/lib/apt/lists/*

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

COPY ./tools/mariadb-setup.sh   /usr/bin/

RUN chmod +x /usr/bin/mariadb-setup.sh

ENTRYPOINT [ "/usr/bin/mariadb-setup.sh" ]

CMD [ "mysqld_safe" ]