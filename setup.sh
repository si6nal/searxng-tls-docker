#!/usr/bin/env bash

CADDY_FILE="./caddy/Caddyfile"
COMPOSE_FILE="./compose.yml"

HOSTNAME_REPLACE="(REPLACE_WITH_HOSTNAME)"
HOSTNAME=$(hostname)

# check if the hostname was returned
if [[ -z "$HOSTNAME" ]]; then
    echo "failed to get hostname."
    exit 1
fi

# add hostname to caddy & compose files
sed -i "s|$HOSTNAME_REPLACE|$HOSTNAME|g" "$CADDY_FILE"
sed -i "s|$HOSTNAME_REPLACE|$HOSTNAME|g" "$COMPOSE_FILE"