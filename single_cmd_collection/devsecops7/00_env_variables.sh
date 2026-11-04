#!/usr/bin/env bash
# ==============================================================================
# 1. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Alle Basis-Umgebungsvariablen für DevSecOps 7 (Container Security & Delivery mit Azure Container Registry):

export RG="devsecops7-lab-rg"
export REGION="germanywestcentral"
export ACR="devsecops7acr$(openssl rand -hex 4)"
export CONTAINER="dev-sec-ops-7"
export CONTAINER_LINK="$ACR.azurecr.io/${CONTAINER}:latest"
