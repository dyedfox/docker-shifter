# docker-shifter-tool

## Getting started

To make it easy for you to get started with docker-shifter, here's a list of recommended next steps.

## Install tool 

*be sure that you are in the user with sudo permissions*
```bash
cd docker-shifter-tool
bash install.sh
```

## Copy and edit the file to match your project’s setup:

```bash 
cp docker-shifter.conf /my-project/docker-shifter.conf
nano docker-shifter.conf
```
### Example of `docker-shifter.conf` file

```
SERVICES["web1"]="my_image1"
SERVICES["web2"]="my_image2"
ENV_VARS["web1"]="ROLL_IMAGE1"
ENV_VARS["web2"]="ROLL_IMAGE2"
DOCKERFILES["web1"]="Dockerfile"
DOCKERFILES["web2"]="Dockerfile.dev"
```
Where:

   `DOCKER_COMPOSE_FILE`                : path to your actual docker-compose configuration file

   `SERVICES["service"]="image_name"`   : service name (as in the docker-compose file) and the image name that should be built

   `ENV_VARS["service"]="ROLL_IMAGE1"`  : service name and the variable name that matches the service (see example below)

   `DOCKERFILES["service"]="Dockerfile"`:  service name and the path to the Dockerfile that matches the service
   
Example:

```yaml
    ...
      web1:
    image: ${ROLL_IMAGE1}
    ...
```
Also refer to the `docker-compose.yaml`, and the mock-up `Dockerfile` and `Dockerfile.dev` files (examples directory).

## Commands and options

```bash
docker-shifter <action> [service]
```

Actions:

    build                  - Build a Docker image

    up                     - Build (if necessary) and start containers

    rollout                - Update a service with the new image

    rollout --non-custom   - Rollout/rollback a non-custom service

    (Info: Rollback for custom image is essentially the same as rollout. Please refer to the documentation)

    rollback               - Rollback a service to the previous image

    down                   - Stop and remove containers, networks, and volumes