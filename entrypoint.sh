#!/bin/bash
set -e

export TZ=Asia/Shanghai
export PORT=${PORT:-8080}

echo "Fly.io PORT is $PORT"
echo "server mode"

/usr/local/bin/hysteria server \
  --config /etc/hysteria/config.yaml
