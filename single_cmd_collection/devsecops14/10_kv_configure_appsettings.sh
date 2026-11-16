#!/usr/bin/env bash
# ==============================================================================
# 10. KEY VAULT LAB: APP SETTINGS KONFIGURIEREN
# ==============================================================================
# Setzt die Umgebungsvariablen der Function App für das Python v2 Modell,
# Remote-Build sowie die Ziel-URL des Key Vaults und den Secret-Namen.
#
# Erklärung der Parameter:
# AzureWebJobsFeatureFlags=EnableWorkerIndexing : Aktiviert Python v2 Worker Indexing
# SCM_DO_BUILD_DURING_DEPLOYMENT=true           : Aktiviert Remote-Build bei Zip-Deploy
# KEY_VAULT_URL                                 : Basis-URI des Azure Key Vaults
# DB_SECRET_NAME                                : Name des abzurufenden Secrets

az functionapp config appsettings set \
  -g "$RG_KV" \
  -n "$FUNCAPP_KV" \
  --settings \
  AzureWebJobsFeatureFlags=EnableWorkerIndexing \
  SCM_DO_BUILD_DURING_DEPLOYMENT=true \
  KEY_VAULT_URL="https://${KV}.vault.azure.net/" \
  DB_SECRET_NAME="$DB_SECRET_NAME"
