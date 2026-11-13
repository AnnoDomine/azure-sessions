#!/usr/bin/env bash
# ==============================================================================
# 0. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Zentrale Variablen für DevSecOps 9 (IaC Security & gehärtetes Azure State Backend).

export TF_STATE_RG="rg-tfstate-prod"
export LOCATION="westeurope"
export TF_STATE_STORAGE="tfstatesec$RANDOM"
export TF_STATE_CONTAINER="tfstate"
