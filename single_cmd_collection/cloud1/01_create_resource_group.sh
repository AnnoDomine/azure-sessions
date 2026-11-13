#!/usr/bin/env bash
# ==============================================================================
# 1. RESSOURCENGRUPPE ERSTELLEN
# ==============================================================================
# Erstellt eine neue Azure Resource Group als logischen Container für alle
# nachfolgenden Ressourcen der Demo.

az group create \
  --name "$RG" \
  --location "$LOCATION"
