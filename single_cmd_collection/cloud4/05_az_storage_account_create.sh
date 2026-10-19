#!/usr/bin/env bash
# ==============================================================================
# 3. AZURE STORAGE ACCOUNT ERSTELLEN
# ==============================================================================
# Erstellt einen universellen Azure Storage Account (V2)
# Parameter:
#   --name $ACCT           : Eindeutiger Name des Storage Accounts
#   --resource-group $RG   : Ziel-Resource-Group
#   --location $REGION     : Azure-Region
#   --sku Standard_LRS     : Replikationstyp: Standard Locally Redundant Storage

az storage account create \
  --name $ACCT \
  --resource-group $RG \
  --location $REGION \
  --sku Standard_LRS
