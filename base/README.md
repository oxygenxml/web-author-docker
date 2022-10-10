# Base Docker image

This is the simplest Docker image that uses Web Author

To build the Docker image, use:
```sh
docker build -t web-author-base .
```
If behind a proxy, make sure you configure Docker https://docs.docker.com/network/proxy/

Before starting a container from this image, make sure you create a volume for the data directory where configuration files will be stored:
```sh
docker volume create web-author-data
```

Then, start it with this command:
```sh
docker run -p 8080:8080 --mount source=web-author-data,target=/usr/local/tomcat/work/Catalina/localhost/oxygen-xml-web-author web-author-base
```

Oxygen XML Web Author will be available at the following address: `http://<docker-host>:8080/oxygen-xml-web-author/`.
