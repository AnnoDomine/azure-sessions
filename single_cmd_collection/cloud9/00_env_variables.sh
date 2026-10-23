#!/usr/bin/env bash
# ==============================================================================
# 1. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Alle Basis-Umgebungsvariablen für Cloud 9 (Defender for Cloud & Prowler Audit):

# Liest die ID der aktuell aktiven Azure Subscription aus und speichert sie in SUBSCRIPTION_ID
export SUBSCRIPTION_ID="$(az account show --query id --output tsv)"

echo "SUBSCRIPTION_ID: $SUBSCRIPTION_ID"
