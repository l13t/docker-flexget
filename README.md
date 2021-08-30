# docker-flexget

Docker Image which runs [https://flexget.com/](FlexGet) inside.

## Run

Before starting the container, you need to prepare your configuration files in a separate folder, which will be mounted into your container.

More detailed information on how to configure Flexget you could find at the following [https://flexget.com/Configuration](link).

Flexget runs with UID=900 and GID=900. The folder with files should have write permissions for this user.
