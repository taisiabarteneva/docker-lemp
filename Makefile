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

ps :
	@docker ps -a

images :
	@docker images -a

volumes :
	@docker volume ls

network :
	@docker network ls

# docker tasks
start :
	@docker-compose -f ./srcs/docker-compose.yml up

down :
	@docker-compose -f ./srcs/docker-compose.yml down

re :
	@docker-compose -f ./srcs/docker-compose.yml up --build

clean :
	@echo "Cleaning before evaluation..."
	@docker stop $$(docker ps -qa); docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q)
	@echo "Ready to start"

.PHONY : help show ps images volumes network start down re clean
