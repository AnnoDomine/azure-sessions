#!/usr/bin/env bash
# ==============================================================================
# 5. BLOBS IM CONTAINER AUFLISTEN
# ==============================================================================
# Listet alle Blobs im Container 'private-data' namentlich auf
# Parameter:
#   --account-name $ACCT          : Name des Storage Accounts
#   --account-key $KEY            : Autorisierungs-Schlüssel
#   --container-name private-data : Quell-Container
#   --query "[].name"             : Filtert rein die Namen der Blobs
#   -o tsv                        : Tab-separated Output

az storage blob list \
  --account-name $ACCT \
  --account-key $KEY \
  --container-name private-data \
  --query "[].name" \
  -o tsv
