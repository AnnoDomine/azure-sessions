#!/usr/bin/env bash
# ==============================================================================
# 2. HELLO WORLD: AZURE-RESSOURCEN ERSTELLEN
# ==============================================================================
# Erstellt die Resource Group, den benötigten Storage Account sowie die
# Linux-basierte Azure Function App (Python 3.11, Functions Runtime v4)
# im Consumption-Plan (Serverless).
#
# Erklärung der Parameter:
# -n / --name                : Name der jeweiligen Azure-Ressource
# -g / --resource-group      : Ziel-Resource-Group
# -l / --location            : Azure-Region (z. B. westeurope)
# --sku Standard_LRS         : Locally Redundant Storage (kostengünstig für Demos)
# --consumption-plan-location: Region für den serverlosen Consumption-Plan
# --runtime python           : Sprach-Laufzeitumgebung (Python)
# --runtime-version 3.11     : Python-Version 3.11
# --functions-version 4      : Azure Functions Runtime v4
# --storage-account          : Verknüpfter Storage Account für Function-State/Logs
# --os-type Linux            : Betriebssystem des Function-Hosts

az group create -n "$RG_HELLO" -l "$LOC"

az storage account create \
  -n "$STORAGE_HELLO" \
  -g "$RG_HELLO" \
  -l "$LOC" \
  --sku Standard_LRS

az functionapp create \
  -g "$RG_HELLO" \
  --consumption-plan-location "$LOC" \
  --runtime python \
  --runtime-version 3.11 \
  --functions-version 4 \
  --name "$FUNCAPP_HELLO" \
  --storage-account "$STORAGE_HELLO" \
  --os-type Linux
