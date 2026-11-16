#!/usr/bin/env bash
# ==============================================================================
# 3. HELLO WORLD: APP SETTINGS KONFIGURIEREN
# ==============================================================================
# Aktiviert das Python v2 Programming Model (Worker Indexing) sowie den
# Remote-Build auf Azure während des Zip-Deployments.
#
# Erklärung der Parameter:
# -g / --resource-group : Ziel-Resource-Group
# -n / --name           : Name der Function App
# --settings            : Key=Value-Paare für Umgebungsvariablen der App:
#   AzureWebJobsFeatureFlags=EnableWorkerIndexing : Aktiviert Python v2 Decorator-Indexing
#   SCM_DO_BUILD_DURING_DEPLOYMENT=true           : Führt pip install beim Deployment in Azure aus

az functionapp config appsettings set \
  -g "$RG_HELLO" \
  -n "$FUNCAPP_HELLO" \
  --settings \
  AzureWebJobsFeatureFlags=EnableWorkerIndexing \
  SCM_DO_BUILD_DURING_DEPLOYMENT=true
