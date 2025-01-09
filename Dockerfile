FROM alpine:latest

RUN apk add --no-cache \
    curl \
    tar \
    ca-certificates

RUN wget https://github.com/caddyserver/caddy/releases/download/v2.9.1/caddy_2.9.1_linux_amd64.tar.gz && \
    tar -xvf caddy_2.9.1_linux_amd64.tar.gz && \
    mv caddy /usr/bin && \
    chmod a+x /usr/bin/caddy && \
    rm -f *

RUN mkdir -p /etc/caddy && mkdir -p /opt/src

RUN chmod -R 755 /opt/src

COPY Caddyfile /etc/caddy

EXPOSE 80 443

CMD [ "caddy", "run", "--config", "/etc/caddy/Caddyfile" ]