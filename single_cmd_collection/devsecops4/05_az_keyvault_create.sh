#!/usr/bin/env bash
# ==============================================================================
# 3. AZURE KEY VAULT MIT RBAC-AUTHORISIERUNG ERSTELLEN
# ==============================================================================
# Erstellt einen neuen Azure Key Vault mit moderner RBAC-Berechtigungssteuerung
# anstelle klassischer Vault Access Policies.
# Parameter:
#   --name $KV_NAME                  : Weltweit eindeutiger Name des Key Vaults
#   --resource-group "$RG"           : Zugehörige Resource Group (key-vault-lab-rg)
#   --location $REGION               : Azure-Region (germanywestcentral)
#   --enable-rbac-authorization true : Aktiviert Microsoft Entra ID RBAC für Data-Plane-Zugriffe

az keyvault create \
  --name $KV_NAME \
  --resource-group "$RG" \
  --location $REGION \
  --enable-rbac-authorization true
