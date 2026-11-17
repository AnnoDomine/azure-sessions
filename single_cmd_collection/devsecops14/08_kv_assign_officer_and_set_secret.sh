#!/usr/bin/env bash
# ==============================================================================
# 8. KEY VAULT LAB: SECRETS OFFICER ZUWEISEN & DEMO-SECRET ANLEGEN
# ==============================================================================
# Ermittelt die eigene Entra ID Object-ID und Subscription-ID, weist dem
# angemeldeten Benutzer die Rolle "Key Vault Secrets Officer" auf dem Vault zu,
# wartet 30 Sekunden auf die RBAC-Propagation und speichert das Demo-Secret.
#
# Erklärung der Parameter:
# --assignee-object-id     : Entra ID Object-ID des Benutzers
# --assignee-principal-type: Typ des Principals (User)
# --role                   : Built-in Rolle zum Lesen/Schreiben von Secrets
# --scope                  : Eindeutige Resource-ID des Key Vaults
# sleep 30                 : Wartet auf weltweite RBAC-Replikation in Azure

export MY_OID=$(az ad signed-in-user show --query id -o tsv)
export SUB_ID=$(az account show --query id -o tsv)

az role assignment create \
  --assignee-object-id "$MY_OID" \
  --assignee-principal-type User \
  --role "Key Vault Secrets Officer" \
  --scope "/subscriptions/${SUB_ID}/resourceGroups/${RG_KV}/providers/Microsoft.KeyVault/vaults/${KV}"

sleep 30

az keyvault secret set \
  --vault-name "$KV" \
  -n "$DB_SECRET_NAME" \
  --value "DEMO-FAKE-DB-PW-not-a-real-secret-4f9a2c"
