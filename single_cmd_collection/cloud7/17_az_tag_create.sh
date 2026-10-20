#!/usr/bin/env bash
# ==============================================================================
# 8. RESSOURCEN-TAGS ERSTELLEN (COST MANAGEMENT & GOVERNANCE)
# ==============================================================================
# Weist der Resource Group das Tag 'CostCenter=000' zur Kostenstelle-Zuordnung zu.
# Parameter:
#   --resource-id $RG_ID : Vollständige Resource-ID der Zielressource (Resource Group)
#   --tags CostCenter=000: Schlüssel-Wert-Paar des zu setzenden Tags
#   >/dev/null           : Unterdrückt die Standardausgabe (JSON-Antwort)

az tag create \
  --resource-id $RG_ID \
  --tags CostCenter=000 >/dev/null
