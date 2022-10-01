#!/bin/bash

# start the docker services
systemctl enable docker

systemctl start docker

systemctl status docker

echo "##################################"

# Docker Version
docker -v

echo "################################"

# Docker Commands
docker ps -a
 
docker-compose ps
