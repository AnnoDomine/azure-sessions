#!/usr/bin/env bash
# ==============================================================================
# 2. RESOURCE GROUP ERSTELLEN
# ==============================================================================
# Erstellt eine neue Azure Resource Group als logischen Container für alle Ressourcen
# Parameter:
#   --name $RG         : Name der zu erstellenden Resource Group
#   --location $REGION : Azure-Region (z. B. germanywestcentral)

az group create \
  --name $RG \
  --location $REGION
