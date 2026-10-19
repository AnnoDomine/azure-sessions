#!/usr/bin/env bash
# ==============================================================================
# 13. RESSOURCENGRUPPE BEREINIGEN (CLEANUP)
# ==============================================================================
# Löscht die gesamte Resource Group samt aller darin enthaltenen Ressourcen (Storage, DB etc.)
# Parameter:
#   --name $RG  : Name der Resource Group
#   --yes       : Bestätigt die Sicherheitsabfrage automatisch
#   --no-wait   : Führt die Löschung asynchron im Hintergrund in Azure aus

az group delete \
  --name $RG \
  --yes \
  --no-wait
