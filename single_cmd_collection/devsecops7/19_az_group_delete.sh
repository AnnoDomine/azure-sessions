#!/usr/bin/env bash
# ==============================================================================
# 17. RESSOURCENGRUPPE BEREINIGEN (CLEANUP)
# ==============================================================================
# Löscht die gesamte Resource Group inklusive der Azure Container Registry (ACR)
# und aller darin gespeicherten Repositories/Images.
# Parameter:
#   -n $RG : Name der zu löschenden Resource Group (devsecops7-lab-rg)

az group delete \
  -n $RG
