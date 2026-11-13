#!/usr/bin/env bash
# ==============================================================================
# 3. SPEICHERKONTO ANZEIGEN
# ==============================================================================
# Zeigt die Eigenschaften und Konfiguration des erstellten Storage Accounts
# übersichtlich im Tabellenformat an.

az storage account show \
  --name "$STORAGE" \
  --resource-group "$RG" \
  --output table
