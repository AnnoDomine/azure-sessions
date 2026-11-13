#!/usr/bin/env bash
# ==============================================================================
# 3. GESCHÜTZTES AZURE REMOTE STATE BACKEND PER AZ CLI ANLEGEN
# ==============================================================================
# Erstellt ein zentralisiertes, gehärtetes Azure Storage Account als Remote
# Backend für `terraform.tfstate`, damit keine Klartext-Secrets (Passwörter,
# Connection Strings, Keys) lokal auf dem Rechner oder in Git landen.
# - --allow-blob-public-access false: Verhindert jeglichen öffentlichen Blob-Zugriff
# - --min-tls-version TLS1_2: Erzwingt TLS 1.2+ für State-Übertragungen
# - Blob Versioning: Ermöglicht Rollbacks bei korrupten State-Dateien

az group create \
  --name "$TF_STATE_RG" \
  --location "$LOCATION"

az storage account create \
  --name "$TF_STATE_STORAGE" \
  --resource-group "$TF_STATE_RG" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --encryption-services blob \
  --min-tls-version TLS1_2 \
  --allow-blob-public-access false

az storage account blob-service-properties update \
  --account-name "$TF_STATE_STORAGE" \
  --resource-group "$TF_STATE_RG" \
  --enable-versioning true

az storage container create \
  --name "$TF_STATE_CONTAINER" \
  --account-name "$TF_STATE_STORAGE" \
  --auth-mode login
