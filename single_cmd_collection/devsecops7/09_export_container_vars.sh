#!/usr/bin/env bash
# ==============================================================================
# 7. CONTAINER-VARIABLEN DEFINIEREN
# ==============================================================================
# Definiert den Image-Namen und den vollqualifizierten ACR-Tag für das Container-Image:
# CONTAINER      : Lokaler Image-/Container-Name (dev-sec-ops-7)
# CONTAINER_LINK : Vollständiger Pfad inkl. Registry-FQDN und Tag (<acr>.azurecr.io/dev-sec-ops-7:latest)

export CONTAINER="dev-sec-ops-7"
export CONTAINER_LINK="$ACR.azurecr.io/${CONTAINER}:latest"
