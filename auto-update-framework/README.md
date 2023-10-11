Example with frameworks synchronized with a Git repository
==========================================================

This Docker image pulls the frameworks from a Git repository specified by the environment variable `GIT_REPOSITORY_URL`. 

Every two minutes, it pulls a new version of the framework files. If only CSS or Schematron files were changed, the changes are picked up automatically. If other configuration files are changed, the server is restarted. 

How to use it
-------------

This image extends the `web-author-base` image, so make sure to build it by following the instructions in the `../base/` folder of this repository.

1. Set the environment variable `GIT_REPOSITORY_URL` to the URL of the repository that contains your frameworks in a `frameworks/` folder. If the repository is not public, you can include the username and access token in the URL like this: `https://user:token@github.com/...`
2. Run the docker container with `--restart=always`

For example:

```
docker build . -t web-author-auto-update-framework
docker run -d -p 8080:8080 -e GIT_REPOSITORY_URL=https://github.com/oxygenxml/legalDocML --restart=always web-author-auto-update-framework
```

You might consider creating volumes separate to each configuration folders instead 
of the entire data dir `/usr/local/tomcat/work/Catalina/localhost/oxygenxml-web-author`. 
This will make upgrades simpler since the builtin frameworks will live in the container file 
system, not in a volume together with all other settings and will be changed when you update 
the Docker base image.

Example of creating a set of volumes:

```
docker pull web-author-auto-update-framework:latest

docker volume create wiki-webauthor-log
docker volume create wiki-webauthor-user-frameworks
docker volume create wiki-webauthor-user-plugins
docker volume create wiki-webauthor-options
docker volume create wiki-webauthor-java-prefs

docker stop wiki-webauthor-container
docker rm -f wiki-webauthor-container

docker run -d\
        -p 8080:8080\
        --restart always\
        --mount source=wiki-webauthor-log,target=/usr/local/tomcat/logs/\
        --mount source=wiki-webauthor-user-frameworks,target=/usr/local/tomcat/work/Catalina/localhost/oxygenxml-web-author/user-frameworks/\
        --mount source=wiki-webauthor-user-plugins,target=/usr/local/tomcat/work/Catalina/localhost/oxygenxml-web-author/user-plugins/\
        --mount source=wiki-webauthor-options,target=/usr/local/tomcat/work/Catalina/localhost/oxygenxml-web-author/options/\
        --mount source=wiki-webauthor-java-prefs,target=/usr/local/tomcat/work/Catalina/localhost/oxygenxml-web-author/.java\
        --mount type=bind,source=SOME_PATH_IN_HOST/shiro-users.ini,target=/usr/local/tomcat/work/Catalina/localhost/oxygenxml-web-author/shiro-users.ini\
        --name wiki-webauthor-container\
        web-author-auto-update-framework:latest

docker ps
```

For updated information about the contents of the data directory, see the [documentation](https://www.oxygenxml.com/doc/ug-webauthor/topics/wa-oxygen-data-dir.html).
