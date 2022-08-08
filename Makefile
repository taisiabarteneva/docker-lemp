all :
# @mkdir -p /home/wurrigon/data/mariadb
# @mkdir -p /home/wurrigon/data/wordpress
	@mkdir -p /Users/sexysushi/data/mariadb
	@mkdir -p /Users/sexysushi/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up -d

down :
	@docker-compose -f ./srcs/docker-compose.yml down

re :
	@docker-compose -f ./srcs/docker-compose.yml up --build 

logs:
	@docker logs nginx
	@docker logs mariadb
	@docker logs wordpress
	@docker logs redis
	@docker logs adminer
	
fclean : down
	@docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\

# sudo rm -rf /home/wurrigon/data/mariadb
# sudo rm -rf /home/wurrigon/data/wordpress 
	
# docker builder prune -a --force
	
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