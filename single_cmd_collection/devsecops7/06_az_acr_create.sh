#!/usr/bin/env bash
# ==============================================================================
# 4. AZURE CONTAINER REGISTRY (ACR) ERSTELLEN
# ==============================================================================
# Erstellt eine private Azure Container Registry zum Speichern und Verwalten von Docker-Images.
# Parameter:
#   --resource-group $RG : Zugehörige Resource Group (devsecops7-lab-rg)
#   --name $ACR          : Weltweit eindeutiger Name der ACR (<devsecops7acrXXXX>)
#   --sku Basic          : Kostengünstiger Basistarif (ausreichend für Entwicklung & Testing)
#   --location $REGION   : Azure-Region (germanywestcentral)

az acr create \
  --resource-group $RG \
  --name $ACR \
  --sku Basic \
  --location $REGION
