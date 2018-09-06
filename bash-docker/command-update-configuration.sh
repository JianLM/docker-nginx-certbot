#!/bin/bash

set -eo pipefail

source ./util-functions.sh

PrepareDockerComposeEnvironment ${@}

docker exec -t server-nginx-certbot /bin/bash /opt/server-nginx-certbot/command-update-configuration.sh ${2}