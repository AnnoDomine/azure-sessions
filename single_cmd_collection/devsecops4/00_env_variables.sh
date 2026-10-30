#!/usr/bin/env bash
# ==============================================================================
# 1. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Alle Basis-Umgebungsvariablen für DevSecOps 4 (Secrets Management mit Azure Key Vault):

export RG="key-vault-lab-rg"
export REGION="germanywestcentral"
export KV_NAME="kv-$(openssl rand -hex 6)"
export VM="key-vault-vm"
