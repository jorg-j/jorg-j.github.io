---
title: RDL
layout: default
nav_order: 3
---

# RDL Build

First clone the repo. Note must be local

`git clone http://192.168.1.122:8080/git/root/rdl.git`


## User Saver


`usersaver.py`

Accesses each and 'saves' the posts

Best run through docker by running the following commands

`docker build -t rdldownload .`
or
`make build`

Create a docker compose file with
```
version: '3'

services:
  rdl-saver:
    container_name: rdl-saver
    image: rdldownload
    entrypoint: ["python", "usersaver.py"]

    volumes:
      - /home/pi/Downloads/rdl/data:/code/rdl/data
      - /home/pi/Downloads/rdl/storage:/code/rdl/storage/Saved
      - /home/pi/Downloads/rdl/config:/code/rdl/config
```
and run `docker compose -f $file up`

Note the database stored in /code/rdl/data will need to contain users.
This is done with `sqlit3 saved_downloader.db "INSERT INTO userDL(user)VALUES('USERNAMEHERE');"`


## Downloader

Best run through docker by running the following commands

`docker build -t rdldownload .`
or
`make build`

Create a docker compose file with
```
version: '3'

services:
  rdl-download:
    container_name: rdl-download
    image: rdldownload
    entrypoint: ["python", "downloadSaved.py"]

    volumes:
      - /home/pi/Downloads/rdl/data:/code/rdl/data
      - /home/pi/Downloads/rdl/storage:/code/rdl/storage/Saved
      - /home/pi/Downloads/rdl/config:/code/rdl/config
```
and run `docker compose -f $file up`
