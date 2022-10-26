#!/bin/bash

docker create \
  --name=transmission \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Australia/Melbourne \
  -e TRANSMISSION_WEB_HOME=/combustion-release/ `#optional` \
  -e USER=transmission `#optional` \
  -e PASS=transmission `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /home/jack/transmission/config:/config \
  -v /home/jack/transmission/downloads:/downloads \
  -v /home/jack/transmission/watch:/watch \
  --restart unless-stopped \
  linuxserver/transmission
