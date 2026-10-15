#!/usr/bin/env bash
# ==============================================================================
# 7. SAS-TOKEN (SHARED ACCESS SIGNATURE) GENERIEREN
# ==============================================================================
# Erstellt eine zeitlich begrenzte, signierte Zugriffs-URL für secret.txt
# Parameter generate-sas:
#   --account-name $ACCT          : Name des Storage Accounts
#   --account-key $KEY            : Autorisierungs-Schlüssel
#   --container-name private-data : Quell-Container
#   --name secret.txt             : Name des Blobs
#   --permissions r               : Berechtigung: Nur Lesen ('r' = read)
#   --expiry $EXPIRY              : Ablaufzeitpunkt (hier: +15 Minuten in UTC)
#   --https-only                  : Erzwingt verschlüsselte HTTPS-Verbindung
#   --output tsv                  : Reiner Token-String

export URL="https://$ACCT.blob.core.windows.net/private-data/secret.txt"
export EXPIRY=$(date -u -d "15 minutes" '+%Y-%m-%dT%H:%MZ')

export SAS=$(az storage blob generate-sas \
  --account-name $ACCT \
  --account-key $KEY \
  --container-name private-data \
  --name secret.txt \
  --permissions r \
  --expiry $EXPIRY \
  --https-only \
  --output tsv)
