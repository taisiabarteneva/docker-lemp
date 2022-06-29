SERVICES = $(docker ps -qa) 	# ps - list all containers
IMAGES = $(docker images - qa) 	# rmi -f - force removal of images
VOLUMES = $(docker volume ls -q)
NETWORK = $(docker network ls -q)

# list available commands
help :
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# show info
show : ps images volumes network
ps :
	@printf "\033[0;31m\n" && $(SERVICES) && printf "\033[1;37m\n"

images :
	@printf "\033[0;31m\n" && $(IMAGES) && printf "\033[1;37m\n"

volumes :
	@printf "\033[0;31m\n" && $(VOLUMES) && printf "\033[1;37m\n"

network :
	@printf "\033[0;31m\n" && $(NETWORK) && printf "\033[1;37m\n"

# docker tasks
# run containers
up :
	@docker-compose -f ./srcs/docker-compose.yml up

# stop containers
down :
	@docker-compose -f ./srcs/docker-compose.yml down

# restart 
re :
	@docker-compose -f ./srcs/docker-compose.yml re

# stop and remove running containers, images, volumes and networks
clean :
	@docker stop $(SERVICES); docker rm $(SERVICES); \
	docker rmi -f $(IMAGES); \
	docker volume rm $(VOLUMES); \
	docker network rm $(NETWORK) 2> /dev/null

.PHONY : help show ps images volumes network up down re clean