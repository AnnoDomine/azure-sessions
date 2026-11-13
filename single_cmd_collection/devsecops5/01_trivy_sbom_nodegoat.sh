#!/usr/bin/env bash
# ==============================================================================
# 1. SBOM MIT TRIVY ERSTELLEN & SCANNEN (OWASP NODEGOAT)
# ==============================================================================
# Klont eine flache Kopie von OWASP NodeGoat, erzeugt eine Software Bill of
# Materials (SBOM) im CycloneDX-Format (sbom.json) und scannt diese
# anschließend auf bekannte Schwachstellen in direkten und transitiven Paketen.

# Repository klonen und in das Verzeichnis wechseln
git clone --depth 1 https://github.com/OWASP/NodeGoat.git
cd NodeGoat

# SBOM im CycloneDX-Format erstellen
trivy fs --format cyclonedx --output sbom.json .

# Erstellte SBOM auf Schwachstellen scannen
trivy sbom sbom.json
