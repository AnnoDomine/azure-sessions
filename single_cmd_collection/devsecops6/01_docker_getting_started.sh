#!/usr/bin/env bash
# ==============================================================================
# 1. DOCKER GETTING-STARTED CONTAINER STARTEN
# ==============================================================================
# Startet das Tutorial-Image benannt (--name) im Hintergrund (-d) und leitet
# Host-Port 80 auf Container-Port 80 weiter (http://localhost/tutorial).

docker run -d \
  --name "$TUTORIAL_CONTAINER" \
  -p 80:80 \
  "$TUTORIAL_IMAGE"
