#!/usr/bin/env bash
# ==============================================================================
# 11. CLEANUP DER RESSOURCEN (OPTIONAL)
# ==============================================================================
# Löscht die gesamte Resource Group inklusive Azure AI Foundry Account,
# Projekt, Modell-Deployments und Managed Identity, um laufende Kosten zu
# vermeiden.
#
# Erklärung der Parameter:
# -n / --name : Name der zu löschenden Resource Group ($RG)
# --yes       : Bestätigt das Löschen ohne interaktive Rückfrage
# --no-wait   : Führt den Löschvorgang asynchron im Hintergrund aus

az group delete -n "$RG" --yes --no-wait
