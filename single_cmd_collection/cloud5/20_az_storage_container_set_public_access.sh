#!/usr/bin/env bash
# ==============================================================================
# 8. CONTAINER-ZUGRIFFSSTUFE AUF 'CONTAINER' (ÖFFENTLICH) SETZEN
# ==============================================================================
# Gibt den Container und alle darin enthaltenen Blobs anonym lesbar frei
# Parameter:
#   --name private-data        : Name des Containers
#   --account-name $ACCT       : Name des Storage Accounts
#   --account-key $KEY         : Autorisierungs-Schlüssel
#   --public-access container  : Öffentlicher Lesezugriff auf Container und Blobs

az storage container set-permission \
  --name private-data \
  --account-name $ACCT \
  --account-key $KEY \
  --public-access container
