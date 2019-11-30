FROM nginx:1.17-alpine AS nginx-prod

RUN rm -f /etc/nginx/conf.d/default.conf
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/conf.d/prod.conf /etc/nginx/conf.d/prod.conf
