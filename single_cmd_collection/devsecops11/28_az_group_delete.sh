#!/usr/bin/env bash
# ==============================================================================
# 28. RESOURCE GROUP & ACR VOLLSTÄNDIG LÖSCHEN
# ==============================================================================
# Löscht die gesamte Azure Resource Group ($RG) inklusive der darin erstellten
# Azure Container Registry (ACR) und eventueller verbliebener Disks/Netzwerkressourcen.
# Parameter:
#   --name / -n $RG : Name der Resource Group (rg-dev-aks)
#   --yes           : Bestätigt die Löschabfrage automatisch ohne interaktiven Prompt
#   --no-wait       : Startet die Löschung asynchron im Azure-Hintergrund

az group delete \
  --name "$RG" \
  --yes \
  --no-wait
