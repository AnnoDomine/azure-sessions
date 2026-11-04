#!/usr/bin/env bash
# ==============================================================================
# 8. DOCKER IMAGE BAUEN
# ==============================================================================
# Baut das Docker-Image basierend auf dem lokalen Dockerfile im aktuellen Verzeichnis
# und vergibt sowohl den lokalen Tag als auch den Registry-spezifischen Tag.
# Parameter:
#   -t "$CONTAINER_LINK"   : Taggt das Image mit dem vollqualifizierten ACR-Präfix
#   -t "$CONTAINER:latest" : Taggt das Image mit dem lokalen Bezeichner
#   .                      : Build-Context (aktuelles Verzeichnis)

docker build -t "$CONTAINER_LINK" -t "$CONTAINER:latest" .
