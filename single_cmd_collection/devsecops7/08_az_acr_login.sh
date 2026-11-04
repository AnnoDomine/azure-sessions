#!/usr/bin/env bash
# ==============================================================================
# 6. ANMELDUNG AN DER AZURE CONTAINER REGISTRY (DOCKER LOGIN)
# ==============================================================================
# Authentifiziert den lokalen Docker-Daemon nahtlos an der Azure Container Registry
# unter Wiederverwendung der aktiven Azure-CLI-Sitzung.
# Parameter:
#   --name $ACR : Name der Ziel-Registry

az acr login --name $ACR
