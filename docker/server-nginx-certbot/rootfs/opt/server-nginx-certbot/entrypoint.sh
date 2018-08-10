#!/bin/bash

set -euo pipefail

echo -e "Starting nginx ..."

/usr/sbin/nginx -g "daemon off;" & \
VAR_PID_NGINX=${!}

echo -e "Starting nginx ... \033[0;32mdone\033[0m"

trap 'set -euo pipefail;                                                                         \
      /bin/bash /opt/server-nginx-certbot/re-echo.sh "";                                         \
      /bin/bash /opt/server-nginx-certbot/re-echo.sh "Stopping nginx ...";                                            \
      kill -TERM ${VAR_PID_NGINX};                                                               \
      /bin/bash /opt/server-nginx-certbot/re-echo.sh "Stopping nginx ... \033[0;32mdone\033[0m"; \
      exit 0;'                                                                                   \
      SIGTERM

wait ${VAR_PID_NGINX}