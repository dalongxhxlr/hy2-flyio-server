FROM alpine:latest

RUN apk add --no-cache curl bash tar

# 下载并解压 sing-box v1.12.13
RUN curl -L -o /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.12.13/sing-box-1.12.13-linux-amd64.tar.gz && \
    tar -xzf /tmp/sing-box.tar.gz -C /tmp && \
    mv /tmp/sing-box-1.12.13-linux-amd64/sing-box /usr/local/bin/sing-box && \
    chmod +x /usr/local/bin/sing-box

COPY config.json /etc/sing-box/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

