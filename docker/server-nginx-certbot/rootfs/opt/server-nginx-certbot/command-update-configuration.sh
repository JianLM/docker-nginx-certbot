#!/bin/bash

set -euo pipefail

function ExportEnvironmentFile() {
  local VAR_PATH_FILE_ENV="${1}"
  if [ -f "${VAR_PATH_FILE_ENV}" ]; then
    while IFS='' read -r VAR_LINE || [[ -n "${VAR_LINE}" ]]; do
      if [ "${VAR_LINE}" = "" ]; then
        continue;
      fi
      if [[ ${VAR_LINE} != \#* ]]; then
        export "${VAR_LINE}"
      fi
    done < "${VAR_PATH_FILE_ENV}"
  else
    echo "Environment file '${VAR_PATH_FILE_ENV}' not found."
    exit 1
  fi
}

ExportEnvironmentFile "/etc/nginx/env/${1}.env"

for VAR_VHOST_NAME in ${ENV_SERVICES_SERVER_NGINX_CERTBOT_VHOSTS}
do
  echo "${VAR_VHOST_NAME}"
done
