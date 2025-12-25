FROM alpine:latest

RUN apk add --no-cache curl bash tar

# 下载并解压 sing-box
RUN VERSION=$(curl -s https://api.github.com/repos/SagerNet/sing-box/releases/latest | grep tag_name | cut -d '"' -f 4) && \
    curl -L -o /tmp/singbox.tar.gz https://github.com/SagerNet/sing-box/releases/download/${VERSION}/sing-box-${VERSION}-linux-amd64.tar.gz && \
    tar -xzf /tmp/singbox.tar.gz -C /tmp && \
    mv /tmp/sing-box-${VERSION}-linux-amd64/sing-box /usr/local/bin/sing-box && \
    chmod +x /usr/local/bin/sing-box

COPY config.json /etc/sing-box/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
