FROM alpine:latest

RUN apk add --no-cache curl bash

# 下载 sing-box 最新版本
RUN curl -L -o /usr/local/bin/sing-box \
  https://github.com/SagerNet/sing-box/releases/latest/download/sing-box-linux-amd64 && \
  chmod +x /usr/local/bin/sing-box

COPY config.json /etc/sing-box/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]