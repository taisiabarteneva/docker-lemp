all :
	@mkdir -p /home/wurrigon/data/mariadb
	@mkdir -p /home/wurrigon/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up -d

down :
	@docker-compose -f ./srcs/docker-compose.yml down

re :
	@docker-compose -f ./srcs/docker-compose.yml up --build 

fclean : down
	@docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker builder prune -a --force
	sudo rm -rf /home/wurrigon/data/mariadb
	sudo rm -rf /home/wurrigon/data/wordpress 

.PHONY: all re down fclean 

# ---------------------------------------- links
# https://wurrigon.42.fr/
# https://wurrigon.42.fr/wp-login
# https://wurrigon.42.fr/wp-admin

# ---------------------------------------- clean
# [docker system prune -a] removes
# - all stopped containers
# - all networks not used by at least one container
# - all images without at least one container associated to them
# - all build cache