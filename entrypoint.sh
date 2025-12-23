#!/bin/sh

echo "Fly.io PORT is $PORT"

# 替换 config.yaml 中的端口
sed -i "s/PORT_PLACEHOLDER/$PORT/g" /etc/hysteria/config.yaml

exec hysteria server -c /etc/hysteria/config.yaml
