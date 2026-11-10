#!/usr/bin/env bash
# ==============================================================================
# 13. DOCKER IMAGE BAUEN & IN DIE ACR HOCHLADEN (PUSH)
# ==============================================================================
# Baut das Container-Image lokal mit zwei Tags (lokal und vollqualifiziert für ACR)
# und lädt das Image anschließend in das private Azure-Repository hoch.
# Variablen:
#   $CONTAINER_LINK : Vollständiger ACR-Image-Pfad (<acr>.azurecr.io/<container>:latest)
#   $CONTAINER      : Lokaler Image-Tag (<container>:latest)

docker build -t "$CONTAINER_LINK" -t "${CONTAINER}:latest" .
docker push "$CONTAINER_LINK"
