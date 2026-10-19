#!/usr/bin/env bash
# ==============================================================================
# 5. WEITEREN BLOB HOCHLADEN (memo.txt)
# ==============================================================================
# Lädt die Datei secret.txt unter dem Blob-Namen 'memo.txt' in den Container hoch
# Parameter:
#   --account-name $ACCT          : Name des Storage Accounts
#   --account-key $KEY            : Autorisierungs-Schlüssel
#   --container-name private-data : Ziel-Container
#   --name memo.txt               : Name des Blobs in Azure
#   --file secret.txt             : Lokale Quelldatei

az storage blob upload \
  --account-name $ACCT \
  --account-key $KEY \
  --container-name private-data \
  --name memo.txt \
  --file secret.txt
