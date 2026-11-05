#!/usr/bin/env bash
# ==============================================================================
# 3. TERRAFORM AZURERM-AUTHENTIFIZIERUNG EXPORTIEREN
# ==============================================================================
# Extrahiert Client-ID, Client-Secret und Tenant-ID aus der SP-Ausgabe und
# exportiert sie als Standard-Umgebungsvariablen für Terraform (ARM_*).

export ARM_CLIENT_ID=$(echo "$SP_JSON" | jq -r .appId)
export ARM_CLIENT_SECRET=$(echo "$SP_JSON" | jq -r .password)
export ARM_TENANT_ID=$(echo "$SP_JSON" | jq -r .tenant)

echo "ARM_CLIENT_ID: $ARM_CLIENT_ID"
echo "ARM_TENANT_ID: $ARM_TENANT_ID"
