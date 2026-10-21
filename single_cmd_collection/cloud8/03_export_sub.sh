#!/usr/bin/env bash
# ==============================================================================
# 1. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Liest die ID der aktuell aktiven Azure Subscription aus und speichert sie in SUB.
# Parameter:
#   --query id     : JMESPath-Abfrage auf das Feld 'id' (Subscription-ID)
#   --output tsv   : Ausgabe als reiner Textwert ohne JSON-Anführungszeichen

export SUB="$(az account show --query id --output tsv)"
echo "SUB: $SUB"
