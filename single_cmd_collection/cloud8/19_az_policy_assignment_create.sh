#!/usr/bin/env bash
# ==============================================================================
# 11. AZURE POLICY ASSIGNMENT FÜR PFLICHT-TAG ERSTELLEN
# ==============================================================================
# Weist die Policy 'Require a tag on resources' der Resource Group zu, sodass
# neue Ressourcen ohne das Tag 'owner' abgewiesen werden (FinOps Tag-Governance).
# Parameter:
#   --name "require-tag-$TAG_NAME"  : Name der Policy-Zuweisung (require-tag-owner)
#   --display-name "..."            : Lesbarer Anzeigename im Azure Portal
#   --policy $POLICY_ID             : ID der Built-in Policy ('Require a tag on resources')
#   --resource-group "$RG"          : Ziel-Resource-Group als Scope (cloud8-lab-rg)
#   --params "{...}"                : Übergibt den geforderten Tag-Namen ($TAG_NAME) als JSON-Parameter

az policy assignment create \
  --name "require-tag-$TAG_NAME" \
  --display-name "Require $TAG_NAME tag on resources" \
  --policy $POLICY_ID \
  --resource-group "$RG" \
  --params "{\"tagName\": {\"value\": \"$TAG_NAME\"}}"
