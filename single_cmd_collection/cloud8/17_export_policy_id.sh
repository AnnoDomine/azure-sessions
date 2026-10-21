#!/usr/bin/env bash
# ==============================================================================
# 11. AZURE POLICY DEFINITION ID FÜR PFLICHT-TAG ERMITTELN
# ==============================================================================
# Sucht die Built-in Policy Definition 'Require a tag on resources' und speichert
# deren internen Namen (GUID) in der Variable POLICY_ID.
# Parameter:
#   --query "[?displayName=='Require a tag on resources'].name | [0]" : Filtert nach dem Anzeigenamen und wählt das erste Element
#   --output tsv                                                      : Gibt nur den reinen Wert ohne JSON-Formatierung aus

export POLICY_ID=$(az policy definition list \
  --query "[?displayName=='Require a tag on resources'].name | [0]" \
  --output tsv)
echo "POLICY_ID: $POLICY_ID"
