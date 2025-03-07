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

When you run the Docker image for the first time, you’ll need to:
1. Configure an administrator account by choosing a username and password. (in the logs there is also an initial password)
2. Configure your license server.

Upgrading Web Author
====================

When upgrading Web Author you need to delete some data from the old version run:

```
docker run -it -v web-author-data:/data/ ubuntu rm -rf \
  /data/frameworks/ \
  /data/plugins/ \
  /data/options/autocorrect/ \
  /data/dicts/ \
  /data/git-repos-location
```

Setting JVM arguments
=====================

You can use the `CATALINA_OPTS` environment variable to set environment variables used by Web Author. It is recommended to explicitly set the `-Xmx` argument to the amount of memory allocated to Web Author.
