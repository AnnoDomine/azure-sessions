#!/usr/bin/env bash
# ==============================================================================
# 1. LOKALE CODE- & SECRET-SCANS VOR DEM PUSH (UBUNTU CLI)
# ==============================================================================
# Führt Gitleaks (Git-Historie & Arbeitsverzeichnis) sowie Trivy (Dateisystem)
# direkt lokal auf Ubuntu aus, bevor Code in die CI/CD-Pipeline gepusht wird.

# Gitleaks: gesamte Git-Historie auf versehentliche Secrets prüfen
gitleaks detect --source . --verbose

# Trivy: Dateisystem auf HIGH/CRITICAL-Schwachstellen & Fehlkonfigurationen prüfen
trivy fs --severity HIGH,CRITICAL --exit-code 1 .
