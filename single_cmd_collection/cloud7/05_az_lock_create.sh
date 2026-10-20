#!/usr/bin/env bash
# ==============================================================================
# 3. RESOURCE LOCK ERSTELLEN (CANNOTDELETE)
# ==============================================================================
# Richtet einen Management Lock auf der Resource Group ein, der das Löschen der
# Gruppe und aller darin enthaltenen Ressourcen verhindert (Änderungen bleiben erlaubt).
# Parameter:
#   --name no-delete         : Name des Locks
#   --lock-type CanNotDelete : Lock-Typ (verhindert Löschoperationen, erlaubt Lesen & Schreiben)
#   --resource-group $RG     : Ziel-Resource-Group (cloud7-gov-rg)

az lock create \
  --name no-delete \
  --lock-type CanNotDelete \
  --resource-group $RG
