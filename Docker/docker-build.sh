#!/bin/bash

# tag of the docker image 
source /home/ubuntu/pdf-parser/version.txt

echo "image_tag=$TAG"

echo "--------------------------------------------------------------"

# Building the new image (change the tag only)
docker build -t  registry.gitlab.com/sty_projects/cred-mitra/cred-mitra-bd-backend:$TAG . --no-cache 

echo " Image is Successfully builded"

echo "--------------------------------------------------------------"


# Replace the version tag of image 
sed -E -i'' "s/(.*cred-mitra-bd-backend:).*/\1$TAG/" 'docker-compose.yaml' 

echo " Successfully Replaced the image Tag"

echo "--------------------------------------------------------------"

# Checking the size of image 
docker images 

# Deploy the container 
docker-compose up -d 

echo " Deployed Successfully"

echo "--------------------------------------------------------------"

# Check if the containers running 
docker ps -a 

echo "--------------------------------------------------------------"
