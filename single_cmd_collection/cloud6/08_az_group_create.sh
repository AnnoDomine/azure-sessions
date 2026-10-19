#!/usr/bin/env bash
# ==============================================================================
# 4. RESOURCE GROUP ERSTELLEN
# ==============================================================================
# Erstellt eine neue Azure Resource Group für das RBAC- und Managed-Identity-Lab.
# Parameter:
#   --name $RG         : Name der Resource Group (cloud6-rbac-rg)
#   --location $REGION : Azure-Region (germanywestcentral)

az group create \
  --name $RG \
  --location $REGION
