FROM nginx:1.15-alpine

RUN apk add --no-cache                           \
           bash                                  \
           certbot                               \
           openssl openssl-dev ca-certificates   \
 && ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log  \
 && mkdir -p /etc/nginx/vhosts                   \
 && mkdir -p /etc/letsencrypt/san

COPY ./rootfs/etc/nginx/nginx.conf      /etc/nginx/nginx.conf
COPY ./rootfs/opt/server-nginx-certbot/ /opt/server-nginx-certbot
COPY ./rootfs/templates/                /templates

ENTRYPOINT [ "/bin/bash", "/opt/server-nginx-certbot/entrypoint.sh" ]