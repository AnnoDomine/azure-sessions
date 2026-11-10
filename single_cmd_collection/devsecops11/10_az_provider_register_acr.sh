#!/usr/bin/env bash
# ==============================================================================
# 10. RESOURCE PROVIDER FÜR CONTAINER REGISTRY REGISTRIEREN
# ==============================================================================
# Registriert den Ressourcenanbieter 'Microsoft.ContainerRegistry' für die
# Azure-Subscription, um Azure Container Registries (ACR) erstellen zu können.
# Parameter:
#   --namespace Microsoft.ContainerRegistry : Name des Ressourcenanbieters
#   --wait                                 : Blockiert, bis die Registrierung abgeschlossen ist

az provider register \
  --namespace Microsoft.ContainerRegistry \
  --wait
