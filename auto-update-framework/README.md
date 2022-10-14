Example with frameworks synchronized with a Git repository
==========================================================

This Docker image pulls the frameworks from a Git repository specified by the environment variable `GIT_REPOSITORY_URL`. 

Every two minutes, it pulls a new version of the framework files. If only CSS or Schematron files were changed, the changes are picked up automatically. If other configuration files are changed, the server is restarted. 

How to use it
-------------

This image extends the `web-author-base` image, so make sure to build it by following the instructions in the `base/` folder.

1. Set the environment variable `GIT_REPOSITORY_URL` to the URL of the repository that contains your frameworks in a `frameworks/` folder. If the repository is not public, you can include the username and access token in the URL like this: `https://user:token@github.com/...`
2. Run the docker container with `--restart=always`

For example:

```
docker build . -t web-author-auto-update-framework
docker run -d -p 8080:8080 -e GIT_REPOSITORY_URL=https://github.com/oxygenxml/legalDocML --restart=always web-author-auto-update-framework
```

