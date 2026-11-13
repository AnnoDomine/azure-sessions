#!/usr/bin/env bash
# ==============================================================================
# 2. PORT-MAPPING AM BEISPIEL NGINX
# ==============================================================================
# Startet einen Nginx-Container, der intern auf Port 80 lauscht, und macht
# ihn auf dem Ubuntu-Host über Port 8080 erreichbar.

docker run -d \
  --name "$NGINX_CONTAINER" \
  -p 8080:80 \
  "$NGINX_IMAGE"
