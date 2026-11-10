#!/usr/bin/env bash
# ==============================================================================
# 11. AZURE CONTAINER REGISTRY (ACR) ERSTELLEN
# ==============================================================================
# Erstellt eine private Azure Container Registry zum Speichern eigener Docker-Images.
# Parameter:
#   --resource-group $RG : Zugehörige Resource Group (rg-dev-aks)
#   --name $ACR          : Global eindeutiger Name der Registry
#   --sku Basic          : Kostengünstiger Einstiegstarif für Entwicklung und Demos
#   --location $REGION   : Azure-Region (z. B. westeurope)

az acr create \
  --resource-group "$RG" \
  --name "$ACR" \
  --sku Basic \
  --location "$REGION"
