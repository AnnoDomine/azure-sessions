#!/usr/bin/env bash
# ==============================================================================
# 2. RESOURCE GROUP ERSTELLEN
# ==============================================================================
# Erstellt die Resource Group für die Governance- und Monitoring-Ressourcen.
# Parameter:
#   --name $RG         : Name der Resource Group (cloud7-gov-rg)
#   --location $REGION : Azure-Region (germanywestcentral)

az group create \
  --name $RG \
  --location $REGION
