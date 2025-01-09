FROM php:8.3.15-fpm-alpine3.21

RUN apk add --no-cache \
    curl \
    tar \
    ca-certificates

RUN mkdir -p /etc/caddyprepare

WORKDIR /etc/caddyprepare

RUN wget https://github.com/caddyserver/caddy/releases/download/v2.9.1/caddy_2.9.1_linux_amd64.tar.gz && \
    tar -xvf caddy_2.9.1_linux_amd64.tar.gz && \
    mv caddy /usr/bin && \
    chmod a+x /usr/bin/caddy

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions install-php-extensions

RUN chmod +x install-php-extensions
    
RUN ./install-php-extensions \
    mysqli \
    pdo \
    pdo_mysql \
    gd \
    zip \
    intl \
    xml \
    curl \
    dom \
    fileinfo \
    iconv \
    json \
    libxml \
    mbstring \
    openssl \
    pcre \
    phar \
    simplexml \
    zlib

WORKDIR /

RUN mkdir -p /etc/caddy && mkdir -p /opt/src

RUN chmod -R 755 /opt/src

RUN rm -rf /etc/caddyprepare

COPY Caddyfile /etc/caddy

EXPOSE 80 443

CMD [ "caddy", "run", "--config", "/etc/caddy/Caddyfile" ]