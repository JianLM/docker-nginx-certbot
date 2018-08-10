#!/bin/bash

set -eo pipefail

source ./util-functions.sh

PrepareDockerComposeEnvironment ${@}

docker-compose --file ${ENV_PATH_FILE_DOCKER_COMPOSE} exec server-nginx-certbot /bin/bash /opt/server-nginx-certbot/command-update-configuration.sh