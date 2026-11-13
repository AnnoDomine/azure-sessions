#!/usr/bin/env bash
# ==============================================================================
# 0. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Zentrale Variablen für Cloud 1 (Azure CLI Basis-Workflow).
# Hinweis: Storage-Account-Namen müssen weltweit eindeutig sein (3–24 Zeichen,
# ausschließlich Kleinbuchstaben und Ziffern).

export RG="demo-rg"
export LOCATION="westeurope"
export STORAGE="demostorage$RANDOM"
