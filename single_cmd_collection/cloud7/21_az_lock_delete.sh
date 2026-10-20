#!/usr/bin/env bash
# ==============================================================================
# 10. RESOURCE LOCK ENTFERNEN (VORBEREITUNG FÜR CLEANUP)
# ==============================================================================
# Löscht den 'CanNotDelete'-Lock von der Resource Group, damit diese im nächsten
# Schritt wieder regulär gelöscht werden kann.
# Parameter:
#   --name no-delete     : Name des zu entfernenden Locks
#   --resource-group $RG : Ziel-Resource-Group (cloud7-gov-rg)

az lock delete \
  --name no-delete \
  --resource-group $RG
