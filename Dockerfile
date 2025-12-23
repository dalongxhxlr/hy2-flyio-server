FROM alpine:latest

RUN apk add --no-cache curl bash

# 下载 Hysteria2 最新版本
RUN HY2_VERSION=$(curl -s https://api.github.com/repos/apernet/hysteria/releases/latest | grep tag_name | cut -d '"' -f 4) && \
    curl -L -o /usr/local/bin/hysteria https://github.com/apernet/hysteria/releases/download/${HY2_VERSION}/hysteria-linux-amd64 && \
    chmod +x /usr/local/bin/hysteria

COPY entrypoint.sh /entrypoint.sh
COPY config.yaml /etc/hysteria/config.yaml

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

COPY cert.pem /etc/hysteria/cert.pem
COPY key.pem /etc/hysteria/key.pem
