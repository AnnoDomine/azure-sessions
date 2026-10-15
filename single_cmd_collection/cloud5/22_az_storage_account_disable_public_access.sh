#!/usr/bin/env bash
# ==============================================================================
# 8. ÖFFENTLICHEN ZUGRIFF AUF ACCOUNT-EBENE DEAKTIVIEREN
# ==============================================================================
# Verbietet jeglichen anonymen Blob-Zugriff auf Account-Ebene
# Parameter:
#   --name $ACCT                    : Name des Storage Accounts
#   --resource-group $RG            : Resource Group
#   --allow-blob-public-access false: Sperrt anonymen Zugriff auf den gesamten Account

az storage account update \
  --name "$ACCT" \
  --resource-group "$RG" \
  --allow-blob-public-access false
