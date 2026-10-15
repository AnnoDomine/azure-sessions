#!/usr/bin/env bash
# ==============================================================================
# 5. BLOB HERUNTERLADEN (secret-downloaded.txt)
# ==============================================================================
# Lädt den Blob secret.txt aus dem Container als secret-downloaded.txt herunter
# Parameter:
#   --account-name $ACCT          : Name des Storage Accounts
#   --account-key $KEY            : Autorisierungs-Schlüssel
#   --container-name private-data : Quell-Container
#   --name secret.txt             : Name des Blobs in Azure
#   --file secret-downloaded.txt  : Lokaler Zieldateiname

az storage blob download \
  --account-name $ACCT \
  --account-key $KEY \
  --container-name private-data \
  --name secret.txt \
  --file secret-downloaded.txt
