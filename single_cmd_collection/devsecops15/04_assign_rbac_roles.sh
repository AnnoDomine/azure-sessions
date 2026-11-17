#!/usr/bin/env bash
# ==============================================================================
# 4. IDS ERMITTELN & RBAC-ROLLEN ("FOUNDRY USER") ZUWEISEN
# ==============================================================================
# Liest die Resource-IDs von Account und Projekt sowie die Entra-ID-Object-IDs
# des aktuell angemeldeten Benutzers und der Managed Identity des Projekts aus.
# Weist anschließend beiden Principals die Rolle "Foundry User" auf Account-Ebene
# zu, um schlüssellosen API-Zugriff via Entra ID (ohne statische API-Keys) zu
# ermöglichen.
#
# Erklärung der Parameter:
# --query / -o tsv          : Extrahiert exakt die gewünschte ID als Klartext
# --assignee-object-id      : Entra-ID-Object-ID des Ziel-Principals
# --assignee-principal-type : Principal-Typ ("User" bzw. "ServicePrincipal")
# --role "Foundry User"     : Built-in RBAC-Rolle für Inference/Projekt-Nutzung
# --scope                   : Resource-ID des AI Foundry Accounts ($FOUNDRY_ID)

export FOUNDRY_ID=$(az cognitiveservices account show \
  -n "$FOUNDRY" \
  -g "$RG" \
  --query id -o tsv)

export PROJECT_ID=$(az cognitiveservices account project show \
  -n "$FOUNDRY" \
  -g "$RG" \
  --project-name "$PROJECT" \
  --query id -o tsv)

export USER_ID=$(az ad signed-in-user show \
  --query id -o tsv)

export PROJECT_MI=$(az cognitiveservices account project show \
  -n "$FOUNDRY" \
  -g "$RG" \
  --project-name "$PROJECT" \
  --query identity.principalId -o tsv)

echo "FOUNDRY_ID: $FOUNDRY_ID"
echo "PROJECT_ID: $PROJECT_ID"
echo "USER_ID:    $USER_ID"
echo "PROJECT_MI: $PROJECT_MI"

az role assignment create \
  --assignee-object-id "$USER_ID" \
  --assignee-principal-type User \
  --role "Foundry User" \
  --scope "$FOUNDRY_ID"

az role assignment create \
  --assignee-object-id "$PROJECT_MI" \
  --assignee-principal-type ServicePrincipal \
  --role "Foundry User" \
  --scope "$FOUNDRY_ID"
