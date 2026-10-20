#!/usr/bin/env bash
# ==============================================================================
# 4. AZURE POLICY TESTEN (DENY BEI UNZULÄSSIGER REGION)
# ==============================================================================
# Versucht einen Storage Account in der nicht erlaubten Region 'westus' zu erstellen.
# Erwartetes Verhalten: Die Bereitstellung wird durch die zugewiesene Policy
# 'allowed-locs' mit 'RequestDisallowedByPolicy' abgewiesen.
# Parameter:
#   --name cloud7deny$RANDOM : Zufälliger, global eindeutiger Name für den Storage Account
#   --resource-group $RG     : Ziel-Resource-Group (cloud7-gov-rg)
#   --location westus        : Nicht zulässige Zielregion zum Testen der Policy
#   --sku Standard_LRS       : Lokal redundanter Standard-Speicher

az storage account create \
  --name cloud7deny$RANDOM \
  --resource-group $RG \
  --location westus \
  --sku Standard_LRS
