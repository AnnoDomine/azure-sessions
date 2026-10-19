#!/usr/bin/env bash
# ==============================================================================
# 8. CONTAINER-ZUGRIFF WIEDER DEAKTIVIEREN (PRIVAT)
# ==============================================================================
# Entzieht die öffentliche Freigabe für den Container 'private-data'
# Parameter:
#   --name private-data  : Name des Containers
#   --account-name $ACCT : Name des Storage Accounts
#   --account-key $KEY   : Autorisierungs-Schlüssel
#   --public-access off  : Sperrt jeglichen anonymen öffentlichen Zugriff

az storage container set-permission \
  --name private-data \
  --account-name "$ACCT" \
  --account-key "$KEY" \
  --public-access off
