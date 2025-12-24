#!/bin/bash

# Fly.io 会自动注入 $PORT 环境变量
export PORT=${PORT:-8080}

echo "Fly.io PORT is $PORT"
echo "server mode"

exec /usr/local/bin/hysteria server \
  --config /etc/hysteria/config.yaml
