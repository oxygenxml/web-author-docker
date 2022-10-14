Multiple Web Author instances with a Load Balancer
==================================================

This example contains a `docker-compose.yml` file that starts two Web Author servers behind an Nginx load balancer.

To start the deployment:

1. Fill the license server details in `license.properties`.
2. Run

```
docker-compose up -d
```

How it works
------------

When an user connects the first time, it is allocated to one of the Web Author servers using a round-robin strategy. 

The **Backend ID Plugin** (implemented at `web-author-with-config/backend-id-cookie-plugin/`) sets a cookie that identifies the backend server. Based on this cookie, subsequent requests made by the user are allocated to the same backend server.

Web Author has its configuration stored in the Docker image, to modify it edit the build files in the `web-author-with-config` folder. The Administration Page is disabled.
