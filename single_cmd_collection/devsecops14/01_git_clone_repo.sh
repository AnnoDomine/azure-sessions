#!/usr/bin/env bash
# ==============================================================================
# 1. DEMO-REPOSITORY KLONEN (GIT CLONE)
# ==============================================================================
# Lädt das offizielle Demo-Repository für Azure Functions (Hello World &
# Key Vault Secret Leak Lab) herunter und wechselt in das erste Lab-Verzeichnis.

git clone https://github.com/CyberstepsDE/azure-functions-demos.git
cd azure-functions-demos/hello-world || exit 1
