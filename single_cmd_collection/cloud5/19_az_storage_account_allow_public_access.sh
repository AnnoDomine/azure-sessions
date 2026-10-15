#!/usr/bin/env bash
# ==============================================================================
# 8. ANONYMEN ÖFFENTLICHEN ZUGRIFF AUF ACCOUNT-EBENE AKTIVIEREN
# ==============================================================================
# Erlaubt prinzipiell anonymen Zugriff auf Blobs für diesen Storage Account
# Parameter:
#   --name $ACCT                   : Name des Storage Accounts
#   --resource-group $RG           : Resource Group
#   --allow-blob-public-access true: Aktiviert den Schalter für öffentlichen Zugriff

az storage account update \
  --name $ACCT \
  --resource-group $RG \
  --allow-blob-public-access true
