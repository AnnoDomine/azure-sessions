#!/usr/bin/env bash
# ==============================================================================
# 10. RESSOURCENGRUPPE BEREINIGEN (CLEANUP)
# ==============================================================================
# Löscht die gesamte Resource Group inklusive der VM, Public IP, NSG, Disk
# und den auf Resource-Group-Ebene gebundenen RBAC-Rollenzuweisungen.
# Parameter:
#   -n / --name $RG : Name der zu löschenden Resource Group (cloud6-rbac-rg)

az group delete \
  -n $RG
