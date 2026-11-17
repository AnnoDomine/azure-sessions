#!/usr/bin/env bash
# ==============================================================================
# 3. MODELLVERFÜGBARKEIT PRÜFEN & LLM-DEPLOYMENT ERSTELLEN
# ==============================================================================
# Fragt zunächst verfügbare Modellversionen und SKUs für das gewünschte Modell
# (gpt-5-mini) in der Zielregion ab und erstellt anschließend das Deployment
# im AI Foundry Account.
#
# Erklärung der Parameter (model list):
# --location : Azure-Region, in der die Modellverfügbarkeit geprüft wird
# --query    : JMESPath-Filter auf Modellname, Versionen und unterstützte SKUs
# -o json    : Ausgabe im JSON-Format
#
# Erklärung der Parameter (deployment create):
# --name            : Name des AI Foundry Accounts ($FOUNDRY)
# --resource-group  : Ziel-Resource-Group ($RG)
# --deployment-name : Logischer Name des Deployments für API-Aufrufe ($MODEL)
# --model-name      : Name des Basismodells ($MODEL)
# --model-version   : Konkrete Modellversion ("2025-08-07")
# --model-format    : Modellformat ("OpenAI")
# --sku-name        : Deployment-SKU ("DataZoneStandard" für EU/DataZone-Compliance)
# --sku-capacity    : Zugewiesene Kapazität (z. B. 10 = 10k TPM)

az cognitiveservices model list \
  --location "$LOC" \
  --query "[?model.name=='gpt-5-mini'].{Version:model.version,SKU:model.skus[].name}" \
  -o json

az cognitiveservices account deployment create \
  --name "$FOUNDRY" \
  --resource-group "$RG" \
  --deployment-name "$MODEL" \
  --model-name "$MODEL" \
  --model-version "2025-08-07" \
  --model-format OpenAI \
  --sku-name DataZoneStandard \
  --sku-capacity 10
