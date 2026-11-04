#!/usr/bin/env bash
# ==============================================================================
# 11. LOKALES IMAGE LÖSCHEN
# ==============================================================================
# Entfernt den vollqualifizierten Image-Tag lokal vom Docker-Host,
# um anschließend einen sauberen Pull aus der ACR testen zu können.
# Parameter:
#   "$CONTAINER_LINK" : Zu löschender lokaler Image-Tag (<acr>.azurecr.io/dev-sec-ops-7:latest)

docker rmi "$CONTAINER_LINK"
