#!/usr/bin/env bash
# ==============================================================================
# 6. ACCESS TIER AUF 'HOT' ZURÜCKSETZEN
# ==============================================================================
# Setzt die Speicherzugriffsebene zurück auf 'Hot' (häufiger Zugriff)
# Parameter:
#   --account-name $ACCT          : Name des Storage Accounts
#   --account-key $KEY            : Autorisierungs-Schlüssel
#   --container-name private-data : Quell-Container
#   --name secret.txt             : Name des Blobs
#   --tier Hot                    : Ziel-Zugriffsebene

az storage blob set-tier \
  --account-name $ACCT \
  --account-key $KEY \
  --container-name private-data \
  --name secret.txt \
  --tier Hot
