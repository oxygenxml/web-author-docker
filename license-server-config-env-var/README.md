# License server configration using environment variables

This image extends the base image by adding support to specify the License Server connection details using environement variables.

The environment variables are

 - `LICENSE_SERVER_URL` - the URL of the License Server deployment
 - `LICENSE_SERVER_USER`
 - `LICENSE_SERVER_PASSWORD`


Under the hood, this image installs a custom entry point that generats the configuration file of the License Server based on the given environment variables.

## Building the image

Before building the current image, make sure to have the one in the `base/` folder built with the tag `web-author`.

To build the image from this folder run:

```sh
sudo docker build . -t web-author-license-server-config-env-var
```
