
```
echo -e "Retagging Original Image"
docker tag reddit-dl:latest reddit-dl:previous && echo -e "Image tagged\n\n"
echo -e "Removing Original Image"
docker rmi reddit-dl:latest && echo -e "Image removed\n\n"
echo -e "Creating new image"
docker build -t reddit-dl .
echo -e "Created\n\n"
echo -e "Stopping container"
docker stop reddit-downloader
echo -e "Removing container\n\n"
docker rm reddit-downloader
echo -e "Creating new container"
sh start_container.sh
```
