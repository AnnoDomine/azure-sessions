#!/usr/bin/env bash
# ==============================================================================
# 5. BLOB HOCHLADEN (secret.txt)
# ==============================================================================
# Lädt die Datei secret.txt in den Blob-Container 'private-data' hoch
# Parameter:
#   --account-name $ACCT          : Name des Storage Accounts
#   --account-key $KEY            : Autorisierungs-Schlüssel
#   --container-name private-data : Ziel-Container
#   --name secret.txt             : Name des Ziel-Blobs in Azure
#   --file secret.txt             : Pfad zur lokalen Quelldatei

az storage blob upload \
  --account-name $ACCT \
  --account-key $KEY \
  --container-name private-data \
  --name secret.txt \
  --file secret.txt
