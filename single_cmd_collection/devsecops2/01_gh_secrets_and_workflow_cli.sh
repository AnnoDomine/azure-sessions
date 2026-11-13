#!/usr/bin/env bash
# ==============================================================================
# 1. GITHUB ACTIONS SECRETS & WORKFLOW PER GH CLI STEUERN (UBUNTU)
# ==============================================================================
# Setzt ein verschlüsseltes Repository-Secret über die GitHub CLI (gh),
# startet den Workflow manuell (workflow_dispatch) und ruft die Laufzeit-Logs
# des letzten Runs ab, um die automatische Secret-Maskierung zu prüfen.

# Secret interaktiv oder aus stdin setzen (wird nicht in der Shell-Historie gespeichert)
gh secret set "$SECRET_NAME"

# Workflow manuell anstoßen
gh workflow run "$WORKFLOW_FILE"

# Letzte Run-ID dynamisch auslesen und Logs anzeigen
export RUN_ID=$(gh run list --workflow="$WORKFLOW_FILE" --limit 1 --json databaseId --jq '.[0].databaseId')
gh run watch "$RUN_ID"
gh run view "$RUN_ID" --log
