FROM alpine:3.17

ARG PHP_VERSION=8 \
    WP_DB_NAME \
    WP_DB_USER \
    WP_DB_PASSWORD

RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.16/community' >> /etc/apk/repositories
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.16/main' >> /etc/apk/repositories

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-phar \
    wget \
    mysql-client \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*
WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
COPY ./wordpress/conf/wp-config-create.sh .
RUN chmod +x wp-config-create.sh
CMD ["/bin/sh", "-c", "/var/www/wp-config-create.sh && /usr/sbin/php-fpm8 -F"]