FROM php:8.1-fpm

RUN apt-get update -y && \
    docker-php-ext-install pdo pdo_mysql

RUN addgroup --gid 1000 --system phpuser && \
    adduser --system --ingroup phpuser --shell /bin/sh --uid 1000 --disabled-password phpuser && \
    chown -R phpuser:phpuser /var/www/html

COPY ./src /var/www/html

USER phpuser

EXPOSE 9000
