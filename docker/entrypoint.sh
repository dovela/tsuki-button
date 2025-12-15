#!/bin/sh
set -e

DEFAULT_CONF="/etc/nginx/conf.d/default.conf"
OVERRIDE_CONF="/etc/nginx/button_conf/nginx.conf"

# 如果宿主机挂载了自定义配置，则覆盖默认配置
if [ -f "$OVERRIDE_CONF" ]; then
    cp "$OVERRIDE_CONF" "$DEFAULT_CONF"
fi

exec nginx -g "daemon off;"
