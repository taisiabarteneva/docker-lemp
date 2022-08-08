FROM debian:buster 

RUN apt update && apt install -y wget; \
    mkdir -p /var/www/html/wordpress/adminer; \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8080 

WORKDIR /var/www/html/wordpress/adminer

RUN wget https://github.com/vrana/adminer/releases/download/v4.7.3/adminer-4.7.3-mysql.php && \
    mv ./adminer-4.7.3-mysql.php /var/www/html/wordpress/adminer/index.php && \
    wget https://raw.githubusercontent.com/vrana/adminer/master/designs/mancave/adminer.css && \
    chmod 777 /var/www/html/wordpress/adminer/ && \
    chown -R www-data:www-data /var/www/html/wordpress/adminer/ 