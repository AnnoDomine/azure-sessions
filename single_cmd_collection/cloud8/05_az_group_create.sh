#!/usr/bin/env bash
# ==============================================================================
# 2. RESOURCE GROUP ERSTELLEN
# ==============================================================================
# Erstellt die Resource Group für die FinOps- und Cost-Management-Ressourcen.
# Parameter:
#   --name $RG         : Name der Resource Group (cloud8-lab-rg)
#   --location $REGION : Azure-Region (germanywestcentral)

az group create \
  --name $RG \
  --location $REGION
