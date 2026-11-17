#!/usr/bin/env bash
# ==============================================================================
# 7. KEY VAULT LAB: AZURE-RESSOURCEN ERSTELLEN
# ==============================================================================
# Wechselt in das Verzeichnis "keyvault-secret-leak-demo" und erstellt die
# benötigten Ressourcen: Resource Group, Storage Account, Key Vault (mit
# Entra ID RBAC-Autorisierung) sowie die Linux Function App (Python 3.11).
#
# Erklärung der Parameter:
# az provider register         : Registriert den Resource Provider Microsoft.KeyVault
# --enable-rbac-authorization  : Aktiviert Azure RBAC statt klassischer Access Policies
# --sku Standard_LRS           : Locally Redundant Storage für die Function App

cd ../keyvault-secret-leak-demo || exit 1

az group create -n "$RG_KV" -l "$LOC"

az storage account create \
  -n "$STORAGE_KV" \
  -g "$RG_KV" \
  -l "$LOC" \
  --sku Standard_LRS

az provider register --namespace Microsoft.KeyVault

az keyvault create \
  -n "$KV" \
  -g "$RG_KV" \
  -l "$LOC" \
  --enable-rbac-authorization true

az functionapp create \
  -g "$RG_KV" \
  --consumption-plan-location "$LOC" \
  --runtime python \
  --runtime-version 3.11 \
  --functions-version 4 \
  --name "$FUNCAPP_KV" \
  --storage-account "$STORAGE_KV" \
  --os-type Linux
