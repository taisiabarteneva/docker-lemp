## Setting up LEMP stack with docker-compose

The goal of the project was to build a basic infrastructure using **docker-compose** on top of **Docker** environment.
I had to build my own Docker images (pulling ready-made images from DockerHub was forbidden).
For more detailed info see `subject.pdf` in the root of repository

### Containers
- nginx + TLSv1.3
- WP and php-fpm
- MariaDB
- Adminer
- Redis Cache

### How to use
:rocket: Build images and start containers
```
  $ make
```
:rocket: Retrieve containers logs
```
  $ make logs
```
:rocket: Stop and remove existing containers, volumes and clear docker layer cache
```
  $ make fclean
```

![containers](https://www.techtarget.com/visuals/German/article/container-in-air-adobe.jpg)
