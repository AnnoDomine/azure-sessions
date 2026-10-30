#!/usr/bin/env bash
# ==============================================================================
# 18. RESSOURCENGRUPPE BEREINIGEN (CLEANUP)
# ==============================================================================
# Löscht die gesamte Resource Group inklusive des Key Vaults, der VM, der NIC,
# der Public IP und allen zugehörigen Ressourcen.
# Parameter:
#   -n / --name $RG : Name der zu löschenden Resource Group (key-vault-lab-rg)

az group delete \
  -n $RG
