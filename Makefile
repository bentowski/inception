DC_FILE = ./srcs/docker-compose.yml

DOCKER_COMPOSE = docker-compose -p inception --file $(DC_FILE)

all: volumes
	$(DOCKER_COMPOSE) up -d --build

volumes:
	mkdir -p ~/data
	mkdir -p ~/data/wp_inception
	mkdir -p ~/data/db_inception

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

clear_volume: down
	docker volume rm inception_db_volume
	docker volume rm inception_wp_volume

clear: clear_volume
	docker system prune -a
	sudo rm -rf ~/data/

re: clear all
