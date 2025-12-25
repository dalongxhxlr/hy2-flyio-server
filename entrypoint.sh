#!/bin/bash
set -e

export TZ=Asia/Shanghai
export PORT=${PORT:-8080}

echo "Fly.io PORT is $PORT"
echo "Starting sing-box..."

exec /usr/local/bin/sing-box run -c /etc/sing-box/config.json
