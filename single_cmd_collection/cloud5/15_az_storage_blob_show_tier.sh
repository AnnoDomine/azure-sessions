#!/usr/bin/env bash
# ==============================================================================
# 6. ACCESS TIER ABFRAGEN
# ==============================================================================
# Fragt die aktuell konfigurierte Speicherzugriffsebene des Blobs ab
# Parameter:
#   --account-name $ACCT                   : Name des Storage Accounts
#   --account-key $KEY                     : Autorisierungs-Schlüssel
#   --container-name private-data          : Quell-Container
#   --name secret.txt                      : Name des Blobs
#   --query "properties.blobTier" -o tsv   : Extrahiert die Eigenschaft blobTier

az storage blob show \
  --account-name $ACCT \
  --account-key $KEY \
  --container-name private-data \
  --name secret.txt \
  --query "properties.blobTier" \
  -o tsv
