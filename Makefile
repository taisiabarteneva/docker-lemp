all :
	@echo "building containers..."
	@docker-compose -f ./srcs/docker-compose.yml up
	@echo "done!"

down :
	@echo "stopping containers..."
	@docker-compose -f ./srcs/docker-compose.yml down
	@echo "done!"

re :
	@echo "rebuilding containers..."
	@docker-compose -f ./srcs/docker-compose.yml up --build 
	@echo "done!"

clean :
	@echo "stopping containers..."
	@docker stop $$(docker ps -qa)
	@echo "deleting containers..."
	docker rm $$(docker ps -qa)
	@echo "deleting images..."
	docker rmi -f $$(docker images -qa)
	@echo "cleaning volumes..."
	docker volume rm $$(docker volume ls -q)
	@echo "removing network..."
	docker network rm $$(docker network ls -q)
	@echo "done, all clean"

.PHONY: all re down clean 

# ---------------------------------------- links
# https://wurrigon.42.fr/
# https://wurrigon.42.fr/wp-login
# https://wurrigon.42.fr/wp-admin