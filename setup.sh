#!/usr/bin/env bash

# configuration files
CADDY_FILE="./caddy/Caddyfile"
COMPOSE_FILE="./compose.yml"
SEARXNG_FILE="./searxng/settings.yml"

# get hostname
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

# generate random secret key

SECRET_KEY_REPLACE="(REPLACE_WITH_SECRET_KEY)"
SECRET_KEY=$(openssl rand -hex 32)

# add secret key to searxng settings file
sed -i "s|$SECRET_KEY_REPLACE|$SECRET_KEY|g" "$SEARXNG_FILE"