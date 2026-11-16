#!/usr/bin/env bash
# ==============================================================================
# 9. KEY VAULT LAB: MANAGED IDENTITY AKTIVIEREN & RBAC ZUWEISEN
# ==============================================================================
# Aktiviert die System-Assigned Managed Identity für die Function App und
# gewährt ihr über die Rolle "Key Vault Secrets User" ausschließlich Lesezugriff
# auf die Secrets im Key Vault (Least-Privilege-Prinzip).
#
# Erklärung der Parameter:
# az functionapp identity assign : Erstellt eine System-Assigned Managed Identity
# --query principalId -o tsv     : Extrahiert die ServicePrincipal Object-ID
# --assignee-principal-type      : Typ des Principals (ServicePrincipal)
# --role "Key Vault Secrets User": Erlaubt ausschließlich das Lesen von Secret-Werten

export PRINCIPAL_ID=$(az functionapp identity assign -g "$RG_KV" -n "$FUNCAPP_KV" --query principalId -o tsv)
export SUB_ID="${SUB_ID:-$(az account show --query id -o tsv)}"

az role assignment create \
  --assignee-object-id "$PRINCIPAL_ID" \
  --assignee-principal-type ServicePrincipal \
  --role "Key Vault Secrets User" \
  --scope "/subscriptions/${SUB_ID}/resourceGroups/${RG_KV}/providers/Microsoft.KeyVault/vaults/${KV}"
