#!/usr/bin/env bash
# ==============================================================================
# 5. AI FOUNDRY PROJECT ENDPOINT AUSLESEN
# ==============================================================================
# Fragt den projektspezifischen "AI Foundry API"-Endpoint ab und exportiert
# ihn als Umgebungsvariable $PROJECT_ENDPOINT für die nachfolgenden Python-Skripte.
#
# Erklärung der Parameter:
# -n / --name      : Name des AI Foundry Accounts ($FOUNDRY)
# -g               : Name der Resource Group ($RG)
# --project-name   : Name des AI Foundry Projekts ($PROJECT)
# --query          : Extrahiert das Attribut properties.endpoints."AI Foundry API"
# -o tsv           : Ausgabe als reiner String ohne Anführungszeichen

export PROJECT_ENDPOINT=$(az cognitiveservices account project show \
  -n "$FOUNDRY" \
  -g "$RG" \
  --project-name "$PROJECT" \
  --query 'properties.endpoints."AI Foundry API"' \
  -o tsv)

export MODEL

echo "PROJECT_ENDPOINT: $PROJECT_ENDPOINT"
echo "MODEL:            $MODEL"
