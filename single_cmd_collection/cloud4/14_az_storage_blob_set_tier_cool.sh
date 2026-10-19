#!/usr/bin/env bash
# ==============================================================================
# 6. ACCESS TIER AUF 'COOL' SETZEN
# ==============================================================================
# Ändert die Speicherzugriffsebene (Access Tier) des Blobs auf 'Cool' (selten abgerufene Daten)
# Parameter:
#   --account-name $ACCT          : Name des Storage Accounts
#   --account-key $KEY            : Autorisierungs-Schlüssel
#   --container-name private-data : Quell-Container
#   --name secret.txt             : Name des Blobs
#   --tier Cool                   : Ziel-Zugriffsebene (Hot, Cool, Archive, Cold)

az storage blob set-tier \
  --account-name $ACCT \
  --account-key $KEY \
  --container-name private-data \
  --name secret.txt \
  --tier Cool
