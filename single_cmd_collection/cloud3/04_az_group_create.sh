#!/usr/bin/env bash
# ==============================================================================
# 2. RESOURCE GROUP ERSTELLEN
# ==============================================================================
# Erstellt eine logische Verwaltungseinheit (Resource Group) für alle Ressourcen
# Parameter:
#   --name $RG         : Name der Resource Group aus der Variable $RG
#   --location $REGION : Geografischer Standort/Region für die Metadaten der RG

az group create \
  --name $RG \
  --location $REGION
