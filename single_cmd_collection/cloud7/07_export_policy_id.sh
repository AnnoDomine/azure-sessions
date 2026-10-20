#!/usr/bin/env bash
# ==============================================================================
# 4. AZURE POLICY DEFINITION ID ERMITTELN
# ==============================================================================
# Sucht die Built-in Policy Definition mit dem Anzeigenamen 'Allowed locations'
# und speichert deren internen Namen (GUID) in der Variable POLICY_ID.
# Parameter:
#   --query "[?displayName=='Allowed locations'].name | [0]" : Filtert nach dem Anzeigenamen und wählt das erste Element
#   -o tsv                                                   : Gibt nur den reinen Wert ohne JSON-Formatierung aus

export POLICY_ID=$(az policy definition list --query "[?displayName=='Allowed locations'].name | [0]" -o tsv)
echo $POLICY_ID
