#!/usr/bin/env bash
# ==============================================================================
# 10. REPOSITORIES IN DER ACR AUFLISTEN
# ==============================================================================
# Prüft, welche Repositories und Images in der Registry vorhanden sind.
# Parameter:
#   --name $ACR : Name der Azure Container Registry
#   -o table    : Ausgabe als übersichtliche Tabelle

az acr repository list --name $ACR -o table
