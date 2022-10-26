#!/bin/bash

docker stop cloud
docker rm cloud

docker run -d \
-v nextcloud:/var/www/html \
-v /media/mediadrive/Cloud:/media/storage \
-v /home/jack/docker/programs/google_image/data:/media/priv \
-v /home/jack/rdl_storage:/media/rdl \
-e NEXTCLOUD_TRUSTED_DOMAINS=jorgensen1.ddns.net \
-p 1111:80 \
--name cloud \
nextcloud
