#!/usr/bin/env bash
# ==============================================================================
# 4. AZURE POLICY ASSIGNMENT ERSTELLEN
# ==============================================================================
# Weist die Policy 'Allowed locations' dem Scope der Resource Group zu und schränkt
# erlaubte Bereitstellungsregionen auf 'germanywestcentral' ein.
# Parameter:
#   --name allowed-locs : Name der Policy-Zuweisung (Assignment)
#   --scope $RG_ID      : Geltungsbereich (Resource-ID der Resource Group)
#   --policy $POLICY_ID : ID der Policy-Definition ('Allowed locations')
#   --params '...'      : JSON-Parameterobjekt mit der Liste zulässiger Regionen

az policy assignment create \
  --name allowed-locs \
  --scope $RG_ID \
  --policy $POLICY_ID \
  --params '{"listOfAllowedLocations":{"value":["germanywestcentral"]}}'
