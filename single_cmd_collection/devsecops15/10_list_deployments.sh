#!/usr/bin/env bash
# ==============================================================================
# 10. DEPLOYMENTS AUFLISTEN & VERIFIZIEREN
# ==============================================================================
# Listet alle aktiven Modell-Deployments (z. B. gpt-5-mini und
# text-embedding-3-small) im Azure AI Foundry Account tabellarisch auf.
#
# Erklärung der Parameter:
# -n / --name : Name des AI Foundry Accounts ($FOUNDRY)
# -g          : Name der Resource Group ($RG)
# -o table    : Kompakte tabellarische Ausgabe

az cognitiveservices account deployment list \
  -n "$FOUNDRY" \
  -g "$RG" \
  -o table
