#!/usr/bin/env bash
# ==============================================================================
# 2. RESOURCE GROUP ERSTELLEN
# ==============================================================================
# Erstellt eine logische Verwaltungseinheit für alle Cloud 5 Ressourcen
# Parameter:
#   --name $RG         : Name der Resource Group aus der Variable $RG
#   --location $REGION : Geografische Azure-Region

az group create \
  --name $RG \
  --location $REGION
