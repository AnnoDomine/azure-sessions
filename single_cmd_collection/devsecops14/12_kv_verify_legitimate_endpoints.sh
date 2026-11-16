#!/usr/bin/env bash
# ==============================================================================
# 12. KEY VAULT LAB: LEGITIME ENDPUNKTE VERIFIZIEREN
# ==============================================================================
# Testet zunächst das reguläre Verhalten der beiden Endpunkte:
# 1. /api/db-status : Nutzt das Key-Vault-Secret intern, ohne es preiszugeben.
# 2. /api/lookup    : Führt ein reguläres DNS-/Host-Lookup für example.com aus.

curl "https://${FUNCAPP_KV}.azurewebsites.net/api/db-status"
echo ""
curl "https://${FUNCAPP_KV}.azurewebsites.net/api/lookup?host=example.com"
