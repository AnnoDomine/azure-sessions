#!/usr/bin/env bash
# ==============================================================================
# 4. BLOB CONTAINER ERSTELLEN
# ==============================================================================
# Erstellt einen privaten Blob-Container namens 'private-data'
# Parameter:
#   --name private-data    : Eindeutiger Name des Containers innerhalb des Accounts
#   --account-name $ACCT   : Name des Azure Storage Accounts
#   --account-key $KEY     : Autorisierung über den Storage Account Key

az storage container create \
  --name private-data \
  --account-name $ACCT \
  --account-key $KEY
