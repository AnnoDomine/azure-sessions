#!/usr/bin/env bash
# ==============================================================================
# 0. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Zentrale Basis-Umgebungsvariablen für DevSecOps 15 (AI in Azure / AI Foundry).
# Die Zufallszahl ($RANDOM) stellt sicher, dass der Name des Azure AI Foundry
# Accounts (und dessen Custom Domain) global eindeutig ist.
#
# Hinweise zur Nutzung:
# - Mit `source 00_env_variables.sh` in die aktuelle Shell laden, damit die
#   Variablen für alle nachfolgenden Schritte erhalten bleiben.

# Ziel-Resource-Group und Azure-Region
export RG="rg-foundry-demo"
export LOC="germanywestcentral"

# Global eindeutiger Name für den Azure AI Foundry Account (AIServices)
export FOUNDRY="foundry-demo-$RANDOM"

# Name des AI Foundry Projekts und des primären LLM-Deployments
export PROJECT="devops-15-ai"
export MODEL="gpt-5-mini"

# Platzhalter für später dynamisch ermittelte IDs und Endpoints (Schritte 04 & 05)
export FOUNDRY_ID=""
export PROJECT_ID=""
export USER_ID=""
export PROJECT_MI=""
export PROJECT_ENDPOINT=""
