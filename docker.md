## Docker

### Dockerfile

```
FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /code/files
WORKDIR /code
RUN pip install praw && pip install wget && pip install python-telegram-bot
COPY prebuild/* /code/
CMD [ "python", "/code/main.py" ]
```


### Full Build
```
IMAGE=
CONTAINER=

## Tag original container
docker tag $CONTAINER:latest $CONTAINER:previous

## Remove old container
docker rmi $CONTAINER:latest

## Create New Image
docker build -t $IMAGE .

## Stop old container
docker stop reddit-downloader
docker rm reddit-downloader

```

### Deploy
```
IMAGE=
CONTAINER=
HOSTVOL=/home/jack/rdl_storage
CONTAINERVOL=/code/files
docker create --name=$CONTAINER -it -v $HOSTVOL:$CONTAINERVOL $IMAGE
```

### Compose Version
```
version: '2'

services:
  stackname:
    container_name: discord-paper
    image: discordpaper
    environment:
      - GUILD=ProjectBot
      - GUID_ID=
      - TOKEN=
    volumes:
      - /home/jack/Pictures/paper_backups:/code/files

```





## Docker Resources

[NextCloud](resources/NextCloud.sh)

[MiniDLNA](resources/minidlnabuild.sh)

[Transmission](resources/transmission.sh)
