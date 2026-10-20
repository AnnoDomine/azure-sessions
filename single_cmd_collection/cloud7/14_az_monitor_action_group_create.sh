#!/usr/bin/env bash
# ==============================================================================
# 7. AZURE MONITOR ACTION GROUP ERSTELLEN
# ==============================================================================
# Erstellt eine Action Group zur Benachrichtigung per E-Mail, sobald ein
# zugeordneter Azure Monitor Alert ausgelöst wird.
# Parameter:
#   --name cloud7-ag               : Name der Action Group
#   --resource-group $RG           : Ziel-Resource-Group (cloud7-gov-rg)
#   --short-name cloud7            : Kurzname (max. 12 Zeichen, wird u. a. bei SMS/E-Mail genutzt)
#   --action email oncall $EMAIL   : Definiert eine E-Mail-Aktion namens 'oncall' an $EMAIL

az monitor action-group create \
  --name cloud7-ag \
  --resource-group $RG \
  --short-name cloud7 \
  --action email oncall $EMAIL
