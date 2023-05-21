FROM debian:buster

ARG PHP_VERSION=8.0 \
    DB_NAME \
    DB_USER \
    DB_PASS

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php-redis \
    wget \
    unzip && \
    sed -i "s|listen = /run/php/php8.0-fpm.sock|listen = 9000|g" \
      /etc/php/8.0/fpm/pool.d/www.conf && \
    sed -i "s|;listen.owner = www-data|listen.owner = www-data|g" \
      /etc/php/8.0/fpm/pool.d/www.conf && \
    sed -i "s|;listen.group = www-data|listen.group = www-data|g" \
      /etc/php/8.0/fpm/pool.d/www.conf

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

COPY ./requirements/wordpress/conf/wp-config-create.sh .

RUN bash wp-config-create.sh && rm wp-config-create.sh && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 wp-content/

CMD ["/usr/sbin/php-fpm8.0", "-F"]
