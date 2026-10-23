#!/usr/bin/env bash
# ==============================================================================
# 9. AKTIVE SUBSCRIPTION-ID AUSLESEN & EXPORTIEREN
# ==============================================================================
# Ermittelt die ID der aktuell aktiven Azure-Subscription und speichert sie
# in der Umgebungsvariablen 'SUBSCRIPTION_ID' für die weitere Verwendung in Skripten.
# Parameter:
#   --query id     : Extrahiert gezielt die Subscription-ID per JMESPath
#   -o / --output tsv : Rohwert-Ausgabe ohne Anführungszeichen oder JSON-Formatierung

export SUBSCRIPTION_ID="$(az account show --query id -o tsv)"
echo "SUBSCRIPTION_ID: $SUBSCRIPTION_ID"
