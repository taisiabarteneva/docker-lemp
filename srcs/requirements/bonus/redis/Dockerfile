FROM debian:buster

RUN apt update && apt install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 6379

COPY ./conf/redis.conf  /etc/redis/

RUN chmod +x /etc/redis/redis.conf

CMD [ "redis-server", "--protected-mode", "no" ]