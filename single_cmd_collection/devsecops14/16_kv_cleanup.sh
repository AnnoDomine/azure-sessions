#!/usr/bin/env bash
# ==============================================================================
# 16. KEY VAULT LAB: CLEANUP DER RESSOURCEN
# ==============================================================================
# Löscht die Resource Group des Key-Vault-Secret-Leak-Labs inklusive Key Vault,
# Storage Account, Managed Identity und Function App.
#
# Erklärung der Parameter:
# -n / --name : Name der zu löschenden Resource Group
# --yes       : Bestätigt das Löschen ohne interaktive Rückfrage
# --no-wait   : Führt den Löschvorgang asynchron im Hintergrund aus

az group delete -n "$RG_KV" --yes --no-wait
