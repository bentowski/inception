# !/bin/bash

docker-compose down
docker volume rm inception_db_volume
docker volume rm inception_wp_volume
docker system prune -a
sudo rm -rf ~/data/wp_inception/*
sudo rm -rf ~/data/db_inception/*
