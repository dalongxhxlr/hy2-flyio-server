#!/bin/sh

echo "Fly.io PORT is $PORT"

sed -i "s/PORT_PLACEHOLDER/$PORT/g" /etc/hysteria/config.yaml

exec hysteria server -c /etc/hysteria/config.yaml
