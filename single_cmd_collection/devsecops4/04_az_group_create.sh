#!/usr/bin/env bash
# ==============================================================================
# 2. RESOURCE GROUP ERSTELLEN
# ==============================================================================
# Erstellt eine dedizierte Azure Resource Group für das Key Vault Lab.
# Parameter:
#   --name $RG         : Name der Resource Group (key-vault-lab-rg)
#   --location $REGION : Azure-Region (germanywestcentral)

az group create \
  --name $RG \
  --location $REGION
