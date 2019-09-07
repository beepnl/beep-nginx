ARG API_IMAGE_URI=038855593698.dkr.ecr.eu-west-1.amazonaws.com/beep-api-prod:latest

FROM nginx:1.17-alpine AS nginx-dev

RUN rm -f /etc/nginx/conf.d/default.conf
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/conf.d/dev.conf /etc/nginx/conf.d/dev.conf

FROM $API_IMAGE_URI as beep-api-prod

FROM nginx:1.17-alpine as nginx-prod

RUN rm -f /etc/nginx/conf.d/default.conf
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/conf.d/prod.conf /etc/nginx/conf.d/prod.conf
COPY --from=beep-api-prod /srv/api/public /srv/api/public/
