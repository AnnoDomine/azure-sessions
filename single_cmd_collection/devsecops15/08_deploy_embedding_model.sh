#!/usr/bin/env bash
# ==============================================================================
# 8. EMBEDDING-MODELL DEPLOYEN (text-embedding-3-small)
# ==============================================================================
# Stellt zusätzlich zum Chat-/Reasoning-Modell ein Embedding-Modell im selben
# Azure AI Foundry Account bereit, um Texte für semantische Suche / RAG
# (Retrieval-Augmented Generation) in Vektoren umzuwandeln.
#
# Erklärung der Parameter:
# --name            : Name des AI Foundry Accounts ($FOUNDRY)
# --resource-group  : Ziel-Resource-Group ($RG)
# --deployment-name : Deployment-Name ("text-embedding-3-small")
# --model-name      : Modellname ("text-embedding-3-small")
# --model-version   : Modellversion ("1")
# --model-format    : Modellformat ("OpenAI")
# --sku-name        : SKU ("GlobalStandard")
# --sku-capacity    : Kapazität (10)

az cognitiveservices account deployment create \
  --name "$FOUNDRY" \
  --resource-group "$RG" \
  --deployment-name text-embedding-3-small \
  --model-name text-embedding-3-small \
  --model-version "1" \
  --model-format OpenAI \
  --sku-name GlobalStandard \
  --sku-capacity 10
