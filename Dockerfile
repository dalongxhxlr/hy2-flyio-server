FROM alpine:latest

RUN apk add --no-cache curl bash tar

# 下载并安装 sing-box v1.10.0（强制 UA，确保下载到真实二进制）
RUN curl -L -H "User-Agent: Mozilla/5.0" \
    -o /tmp/sing-box.tar.gz \
    https://github.com/SagerNet/sing-box/releases/download/v1.10.0/sing-box-1.10.0-linux-amd64.tar.gz \
    && mkdir -p /tmp/singbox \
    && tar -xzf /tmp/sing-box.tar.gz -C /tmp/singbox \
    && mv /tmp/singbox/sing-box-1.10.0-linux-amd64/sing-box /usr/local/bin/sing-box \
    && chmod +x /usr/local/bin/sing-box \
    && rm -rf /tmp/singbox /tmp/sing-box.tar.gz

COPY config.json /etc/sing-box/config.json
COPY cert.pem /etc/sing-box/cert.pem
COPY key.pem /etc/sing-box/key.pem
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

