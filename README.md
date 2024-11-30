# docker-shifter

Bash script that simplifies the rollback of the docker compose services to their previous versions.

Imagine a situation where you have a custom-built Docker image, and after deployment, you need to roll back to the previous version with zero downtime. This script does exactly that! It can handle several custom images - each corresponding to a different service.

You can build specific images, start and stop the Docker Compose stack, and roll out or roll back your services with no downtime.

## Requirements
Docker rollout plugin installed: https://github.com/Wowu/docker-rollout

## Getting started
To make it easy for you to get started with docker-shifter, here's a list of recommended next steps.

## Installation
*be sure that you have sudo permissions*
```bash
# Install docker rollout
# Create directory for Docker cli plugins
mkdir -p ~/.docker/cli-plugins

# Download docker-rollout script to Docker cli plugins directory
curl https://raw.githubusercontent.com/wowu/docker-rollout/master/docker-rollout -o ~/.docker/cli-plugins/docker-rollout
# Make the script executable
chmod +x ~/.docker/cli-plugins/docker-rollout

# Install docker shifter Docker cli plugins directory
curl https://raw.githubusercontent.com/dyedfox/docker-shifter/main/plugin/docker-shifter -o ~/.docker/cli-plugins/docker-shifter
# Make the script executable
chmod +x ~/.docker/cli-plugins/docker-shifter
```

## Copy docker-shifter.conf to your project's root and edit it to match your setup:

```bash 
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