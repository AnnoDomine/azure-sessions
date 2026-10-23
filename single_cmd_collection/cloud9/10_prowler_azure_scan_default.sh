#!/usr/bin/env bash
# ==============================================================================
# 11. PROWLER AZURE SCAN (STANDARD / CLI-AUTHENTIFIZIERUNG)
# ==============================================================================
# Führt einen standardmäßigen Sicherheits- und Compliance-Scan für Microsoft Azure
# durch. Die Authentifizierung erfolgt nahtlos über das bestehende Azure CLI Login.
# Parameter:
#   azure         : Wählt den Provider Microsoft Azure aus
#   --az-cli-auth : Verwendet die im Terminal via 'az login' gespeicherten Anmeldedaten

prowler azure \
  --az-cli-auth
