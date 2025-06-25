DOCKER_COMPOSE = srcs/docker-compose.yml
MY_VOLUMES_DIRS = ./srcs/data/mdb ./srcs/data/wp
VOLUMES_DIRS = /home/plashkar/data/mariadb /home/plashkar/data/wordpress


all: up

up:
	mkdir -p $(VOLUMES_DIRS)
	docker compose -f $(DOCKER_COMPOSE) up -d --build


clean:
	docker compose -f $(DOCKER_COMPOSE) down --rmi all

ResetAll: 
	docker compose -f $(DOCKER_COMPOSE) down --rmi all -v
	rm -rf $(VOLUMES_DIRS)

re: clean up

stop:
	docker compose -f $(DOCKER_COMPOSE) stop

start:
	docker compose -f $(DOCKER_COMPOSE) start

status:
	docker ps

logs:
	docker compose -f $(DOCKER_COMPOSE) logs

migrate_data:
	@echo "📦 Copying Wordpress files..."
	cp -a ./srcs/data/wp/html/. /home/plashkar/data/wordpress/
	chown -R www-data:www-data /home/plashkar/data/wordpress
	@echo "🗄 Importing MariaDB dump into container..."
	@sh -c '\
		DB_PASS=$$(grep DB_ROOT_PASSWORD ./srcs/.env | cut -d "=" -f2); \
		DB_NAME=$$(grep MYSQL_DATABASE ./srcs/.env | cut -d "=" -f2); \
		cat ./srcs/data/wordpress.sql | docker exec -i mariadb mariadb -u root -p$$DB_PASS $$DB_NAME \
	'


	


.phony: logs status start stop re ResetAll clean up all
