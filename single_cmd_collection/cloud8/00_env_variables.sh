#!/usr/bin/env bash
# ==============================================================================
# 1. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Alle Basis-Umgebungsvariablen für Cloud 8 (FinOps & Cost Management) gesammelt:

export RG="cloud8-lab-rg"
export REGION="germanywestcentral"
export SUB="$(az account show --query id --output tsv)"
export VM="cloud8-vm"
export TAG_NAME="owner"
