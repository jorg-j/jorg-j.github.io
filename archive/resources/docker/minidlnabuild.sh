#!/bin/bash

## Run minidlna host pointing to /media/mediadrive
docker run -d --name minidlnahost \
    --net=host \
    -p 8200:8200 \
    -p 1900:1900/udp \
    -v /media/mediadrive:/opt/Music \
    -v /media/mediadrive:/opt/Videos \
    -v /media/mediadrive:/opt/Pictures \
    geekduck/minidlna
