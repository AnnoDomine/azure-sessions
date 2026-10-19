#!/usr/bin/env bash
# ==============================================================================
# 5. BLOB LÖSCHEN (memo.txt)
# ==============================================================================
# Löscht den Blob 'memo.txt' wieder aus dem Container
# Parameter:
#   --account-name $ACCT          : Name des Storage Accounts
#   --account-key $KEY            : Autorisierungs-Schlüssel
#   --container-name private-data : Quell-Container
#   --name memo.txt               : Zu löschender Blob

az storage blob delete \
  --account-name $ACCT \
  --account-key $KEY \
  --container-name private-data \
  --name memo.txt
