#!/usr/bin/env bash
# ==============================================================================
# 3. AZURE STORAGE ACCOUNT KEY ABRUFEN
# ==============================================================================
# Fragt den primären Zugriffsschlüssel (key1) des Storage Accounts ab
# und speichert ihn in der Umgebungsvariable $KEY.
# Parameter:
#   -g / --resource-group $RG : Resource Group des Storage Accounts
#   -n / --account-name $ACCT : Name des Storage Accounts
#   --query "[0].value"       : Extrahiert den reinen Schlüsselwert des ersten Keys
#   -o tsv                    : Tab-separated Output (ohne JSON-Formatierung)

export KEY=$(az storage account keys list -g $RG -n $ACCT --query "[0].value" -o tsv)
