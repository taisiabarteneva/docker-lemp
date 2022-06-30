# list available commands
help :
	@echo ''
	@echo 'Usage: make [TARGET] [EXTRA_ARGUMENTS]'
	@echo 'Targets:'
	@echo '	ps		list all containers IDs'
	@echo '	images		list all images IDs'
	@echo '	volumes		list all volumes'
	@echo '	network		list all networks'
	@echo '	start    	build and run containers'
	@echo '	down     	stop running containers'
	@echo '	re  		rebuild containers'
	@echo '	clean    	stop and remove running containers, images, volumes'
	@echo ''

# show info
show : ps images volumes network
ps :
	@printf "\033[0;31m\n" && docker ps -qa && printf "\033[1;37m\n"

images :
	@printf "\033[0;31m\n" && docker images -qa && printf "\033[1;37m\n"

volumes :
	@printf "\033[0;31m\n" && docker volume ls -q && printf "\033[1;37m\n"

network :
	@printf "\033[0;31m\n" && docker network ls -q && printf "\033[1;37m\n"

# docker tasks
start :
	@docker-compose -f ./srcs/docker-compose.yaml up

down :
	@docker-compose -f ./srcs/docker-compose.yaml down

re :
	@docker-compose -f ./srcs/docker-compose.yaml up --build

clean :
	@echo "Cleaning before evaluation"
	@docker stop $(docker ps -qa); docker rm $(docker ps -qa);\
	docker rmi -f $(docker images -qa);\
	docker volume rm $(docker volume ls -q);\
	docker network rm $(docker network ls -q)
	@echo "Ready to start"

.PHONY : help show ps images volumes network start down re clean