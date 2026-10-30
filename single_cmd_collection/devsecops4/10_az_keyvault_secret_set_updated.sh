#!/usr/bin/env bash
# ==============================================================================
# 8. SECRET AKTUALISIEREN (NEUE VERSION ERZEUGEN)
# ==============================================================================
# Überschreibt den aktuellen Wert des Secrets 'db-password' mit 'test123'.
# In Azure Key Vault wird hierbei eine neue Version des Secrets angelegt,
# während vorherige Versionen weiterhin versioniert abrufbar bleiben.
# Parameter:
#   --vault-name "$KV_NAME" : Name des Key Vaults
#   --name "db-password"    : Name des Secrets
#   --value "test123"       : Neuer Secret-Wert

az keyvault secret set \
  --vault-name "$KV_NAME" \
  --name "db-password" \
  --value "test123"
