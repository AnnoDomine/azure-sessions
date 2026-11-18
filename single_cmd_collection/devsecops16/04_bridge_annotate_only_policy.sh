#!/usr/bin/env bash
# ==============================================================================
# 4. BRIDGE DEMO: DETECTED != BLOCKED (ANNOTATE-ONLY CONTENT POLICY)
# ==============================================================================
# Erstellt eine benutzerdefinierte Content-Policy, bei der die Jailbreak-
# Erkennung lediglich auf "Annotate-Only" (ohne Blockierung) konfiguriert ist,
# und wiederholt anschließend Demo 1 Attempt A unter Angabe des Headers
# `x-policy-id`.
#
# Beobachtung:
# - Die Antwort enthält `"jailbreak": {"detected": true, "filtered": false}`.
# - Der Angriff wird zwar erkannt und protokolliert, aber nicht mehr blockiert
#   und erreicht das Modell.
# - Zwar hält das Modell-Alignment in diesem Lauf stand, die Plattform-
#   Schutzschicht ist jedoch allein durch diese Konfigurationsentscheidung
#   ausgehebelt ("Detected != Blocked").

# Benutzerdefinierte Annotate-Only Content-Policy anlegen
./04-bridge-create-annotate-only-policy.sh

# Demo 1 Attempt A gegen die Annotate-Only-Policy erneut ausführen
./05-bridge-replay-with-annotate-only.sh
