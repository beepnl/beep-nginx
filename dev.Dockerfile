FROM nginx:1.17-alpine AS nginx-dev

RUN rm -f /etc/nginx/conf.d/default.conf
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/conf.d/dev.conf /etc/nginx/conf.d/dev.conf
