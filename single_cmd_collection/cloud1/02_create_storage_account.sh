#!/usr/bin/env bash
# ==============================================================================
# 2. SPEICHERKONTO ERSTELLEN
# ==============================================================================
# Erstellt ein Azure Storage Account mit lokal redundantem Speicher (Standard_LRS)
# innerhalb der zuvor angelegten Resource Group.

az storage account create \
  --name "$STORAGE" \
  --resource-group "$RG" \
  --location "$LOCATION" \
  --sku Standard_LRS
