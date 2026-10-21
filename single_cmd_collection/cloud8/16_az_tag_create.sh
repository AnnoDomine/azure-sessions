#!/usr/bin/env bash
# ==============================================================================
# 10. RESSOURCEN-TAGS AUF RESOURCE GROUP ERSTELLEN (COST ALLOCATION)
# ==============================================================================
# Weist der Resource Group die Tags 'project=Banane' und 'team=Klasse0426' zur
# kaufmännischen Kostenzuordnung (Cost Allocation) im Rahmen von FinOps zu.
# Parameter:
#   --resource-id $RG_ID              : Vollständige Resource-ID der Zielressource
#   --tags project=Banane team=...    : Schlüssel-Wert-Paare der zu setzenden Tags
#   >/dev/null                        : Unterdrückt die Standardausgabe (JSON-Antwort)

az tag create \
  --resource-id $RG_ID \
  --tags project=Banane team=Klasse0426 >/dev/null
