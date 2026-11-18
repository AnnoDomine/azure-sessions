#!/usr/bin/env bash
# ==============================================================================
# 2. DEMO 2: RBAC-ROLLEN FÜR FOUNDRY AGENT & FILE SEARCH ZUWEISEN
# ==============================================================================
# Ermittelt die Entra-ID-Object-ID des angemeldeten Benutzers sowie die
# Resource-IDs des AIServices-Accounts ($SCOPE) und der Resource Group
# ($RG_SCOPE). Weist anschließend die für den Foundry Agent (inkl. Vector Store
# und File Search) erforderlichen RBAC-Rollen zu und aktualisiert das lokale
# Azure-CLI-Access-Token.
#
# Erklärung der Parameter:
# --query id -o tsv         : Extrahiert exakt die Resource-/Object-ID als Klartext
# --assignee-object-id      : Entra-ID-Object-ID des Ziel-Benutzers ($ASSIGNEE_ID)
# --assignee-principal-type : Principal-Typ ("User")
# --role                    : Zuzuweisende Built-in RBAC-Rolle:
#                             - "Azure AI Developer" (Account-Ebene)
#                             - "Cognitive Services OpenAI Contributor" (RG-Ebene)
#                             - "Foundry User" (RG-Ebene)
# --scope                   : Ziel-Scope der Rollenzuweisung ($SCOPE oder $RG_SCOPE)
#
# Hinweis:
# Nach der Rollenzuweisung kann die Azure-RBAC-Propagierung ca. 3–5 Minuten
# dauern, bevor das neu abgerufene Access Token die Berechtigungen widerspiegelt.

export ASSIGNEE_ID=$(az ad signed-in-user show \
  --query id -o tsv)

export SCOPE=$(az cognitiveservices account show \
  -g "$RG" \
  -n "$AIACCT" \
  --query id -o tsv)

export RG_SCOPE=$(az group show \
  -n "$RG" \
  --query id -o tsv)

az role assignment create \
  --assignee-object-id "$ASSIGNEE_ID" \
  --assignee-principal-type "User" \
  --role "Azure AI Developer" \
  --scope "$SCOPE"

az role assignment create \
  --assignee-object-id "$ASSIGNEE_ID" \
  --role "Cognitive Services OpenAI Contributor" \
  --scope "$RG_SCOPE"

az role assignment create \
  --assignee-object-id "$ASSIGNEE_ID" \
  --assignee-principal-type "User" \
  --role "Foundry User" \
  --scope "$RG_SCOPE"

# Zugewiesene Rollen zur Kontrolle tabellarisch auflisten
az role assignment list \
  --assignee "$ASSIGNEE_ID" \
  --all \
  -o table

# Nach 3–5 Minuten Wartezeit das Access Token der aktiven az-Session erneuern
az account get-access-token > /dev/null
