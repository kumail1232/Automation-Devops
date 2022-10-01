#!/bin/bash

# Kill all running containers.
docker kill $(docker ps -q)

# Delete all stopped containers.
printf "\n&gt;&gt;&gt; Deleting stopped containers\n\n" &amp;&amp; docker rm $(docker ps -a -q)

# Delete all untagged images.
printf "\n&gt;&gt;&gt; Deleting untagged images\n\n" &amp;&amp; docker rmi $(docker images -q -f dangling=true)

# Delete all images.
printf "\n&gt;&gt;&gt; Deleting untagged images\n\n" &amp;&amp; docker rmi $(docker images -q)

# Delete all volumes.
printf "\n&gt;&gt;&gt; Deleting volumes\n\n" &amp;&amp; docker volume rm $(docker volume ls -q)

# Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes.
printf "\n&gt;&gt;&gt; Deleting unused containers, networks, images and volumes\n\n" &amp;&amp; docker system prune -a --volumes
