#!/usr/bin/env bash
# ==============================================================================
# 2. AZURE AI FOUNDRY ACCOUNT & PROJECT ERSTELLEN
# ==============================================================================
# Erstellt einen Azure AI Foundry Account (Kind: AIServices) mit System-Assigned
# Managed Identity sowie aktiviertem Project Management und legt darin ein
# zugehöriges AI-Foundry-Projekt an.
#
# Erklärung der Parameter (Account):
# --name                    : Eindeutiger Name des AI Foundry Accounts ($FOUNDRY)
# --resource-group          : Ziel-Resource-Group ($RG)
# --kind AIServices         : Einheitlicher Multi-Service-Typ für Azure AI Foundry
# --sku S0                  : Standard-Tarif (Pay-as-you-go)
# --location                : Azure-Region ($LOC)
# --custom-domain           : Erzeugt einen benutzerdefinierten Endpoint-Hostnamen
#                             (erforderlich für Entra-ID-/RBAC-Authentifizierung)
# --assign-identity         : Aktiviert eine System-Assigned Managed Identity
# --allow-project-management: Aktiviert die Projektverwaltung innerhalb des Accounts
#
# Erklärung der Parameter (Project):
# --name                    : Name des übergeordneten AI Foundry Accounts
# --project-name            : Name des neuen Projekts ($PROJECT)

az cognitiveservices account create \
  --name "$FOUNDRY" \
  --resource-group "$RG" \
  --kind AIServices \
  --sku S0 \
  --location "$LOC" \
  --custom-domain "$FOUNDRY" \
  --assign-identity \
  --allow-project-management true

az cognitiveservices account project create \
  --name "$FOUNDRY" \
  --resource-group "$RG" \
  --project-name "$PROJECT" \
  --location "$LOC"
