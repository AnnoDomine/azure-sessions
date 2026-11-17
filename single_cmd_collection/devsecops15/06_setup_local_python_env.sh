#!/usr/bin/env bash
# ==============================================================================
# 6. LOKALE PYTHON-UMGEBUNG EINRICHTEN & AI-SDK INSTALLIEREN
# ==============================================================================
# Legt ein lokales Arbeitsverzeichnis an, erstellt eine isolierte Python
# Virtual Environment (venv), aktiviert sie und installiert die offiziellen
# Azure-Pakete für AI Foundry Projekte und Entra-ID-Authentifizierung.
#
# Erklärung der Pakete:
# - azure-ai-projects : Azure AI Foundry Project Client & OpenAI-Bridge
# - azure-identity    : Entra-ID-Authentifizierung (DefaultAzureCredential,
#                       AzureCliCredential, Token Provider)

mkdir -p ai_foundary_demo_devsecops_15
cd ai_foundary_demo_devsecops_15 || exit 1

python3 -m venv venv
# shellcheck disable=SC1091
source venv/bin/activate

pip install azure-ai-projects azure-identity
