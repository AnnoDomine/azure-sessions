#!/usr/bin/env bash
# ==============================================================================
# 4. ALLE RESSOURCEN IN DER RESSOURCENGRUPPE AUFLISTEN
# ==============================================================================
# Listet sämtliche Ressourcen innerhalb der Resource Group tabellarisch auf.

az resource list \
  --resource-group "$RG" \
  --output table
