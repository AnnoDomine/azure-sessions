#!/usr/bin/env bash
# ==============================================================================
# 1. RESSOURCENGRUPPE FÜR DIE VM ERSTELLEN
# ==============================================================================
# Legt die dedizierte Resource Group für die virtuelle Maschine und alle
# zugehörigen Netzwerk-/Speicherressourcen an.

az group create \
  --name "$RG" \
  --location "$LOCATION"
