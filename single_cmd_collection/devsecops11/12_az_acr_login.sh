#!/usr/bin/env bash
# ==============================================================================
# 12. AN DER AZURE CONTAINER REGISTRY ANMELDEN (DOCKER LOGIN)
# ==============================================================================
# Meldet den lokalen Docker-Daemon über das Azure CLI Token an der privaten
# Azure Container Registry an, sodass Images ohne statische Passwörter
# hoch- oder heruntergeladen werden können.
# Parameter:
#   --name $ACR : Name der Azure Container Registry

az acr login --name "$ACR"
