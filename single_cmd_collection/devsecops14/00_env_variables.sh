#!/usr/bin/env bash
# ==============================================================================
# 0. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Alle Basis-Umgebungsvariablen für DevSecOps 14 (Modern Application Deployments):
# Enthält Variablen für Teil 1 (Hello World Function) und Teil 2 (Key Vault Leak Lab).
# Die Zufallszahl ($RANDOM) verhindert Namenskonflikte bei global eindeutigen
# Azure-Ressourcen (Storage Account, Function App, Key Vault).

# Gemeinsame Azure-Region
export LOC="westeurope"

# Teil 1: Azure Functions Hello World Demo
export RG_HELLO="rg-func-helloworld-demo"
export STORAGE_HELLO="sthellofuncdemo$RANDOM"
export FUNCAPP_HELLO="func-helloworld-demo-$RANDOM"

# Teil 2: Key Vault Secret Leak Lab
export RG_KV="rg-func-kv-leak-lab"
export STORAGE_KV="stfunckvleak$RANDOM"
export FUNCAPP_KV="func-kv-leak-lab-$RANDOM"
export KV="kv-leak-lab-$RANDOM"
export DB_SECRET_NAME="db-password"

# Platzhalter für das im Angriff exfiltrierte Access Token (Schritt 14 -> 15)
export TOKEN=""
