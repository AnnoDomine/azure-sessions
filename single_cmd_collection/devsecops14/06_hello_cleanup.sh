#!/usr/bin/env bash
# ==============================================================================
# 6. HELLO WORLD: CLEANUP DER RESSOURCEN
# ==============================================================================
# Löscht die Resource Group der Hello-World-Demo inklusive aller darin
# enthaltenen Ressourcen (Storage Account, Consumption Plan, Function App).
#
# Erklärung der Parameter:
# -n / --name : Name der zu löschenden Resource Group
# --yes       : Bestätigt das Löschen ohne interaktive Rückfrage
# --no-wait   : Führt den Löschvorgang asynchron im Hintergrund aus

az group delete -n "$RG_HELLO" --yes --no-wait
