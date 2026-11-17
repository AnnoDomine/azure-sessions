#!/usr/bin/env bash
# ==============================================================================
# 11. KEY VAULT LAB: DEPENDENCIES VENDORING & ZIP-DEPLOYMENT
# ==============================================================================
# Installiert die Python-Abhängigkeiten lokal für die Zielplattform
# (Linux x86_64, Python 3.11) in das Verzeichnis .python_packages, packt den
# Code inkl. Dependencies in ein ZIP-Archiv und deployed es auf Azure.
# Voraussetzung: Aktuelles Arbeitsverzeichnis ist "azure-functions-demos/keyvault-secret-leak-demo".
#
# Erklärung der Parameter:
# --target                 : Zielordner für Azure Functions Python-Pakete
# --platform manylinux2014_x86_64 : Binärkompatibilität für Linux Azure Functions
# --implementation cp      : CPython-Implementierung
# --python-version 3.11    : Ziel-Python-Version auf dem Function-Host
# --only-binary=:all:      : Verwendet ausschließlich vorkompilierte Wheels
# zip -rq                  : Rekursives, stilles Erstellen des ZIP-Archivs

pip3 install \
  --target=.python_packages/lib/site-packages \
  --platform manylinux2014_x86_64 \
  --implementation cp \
  --python-version 3.11 \
  --only-binary=:all: \
  -r requirements.txt

zip -rq /tmp/kv-leak-demo.zip . -x "*.git*"

az functionapp deployment source config-zip \
  -g "$RG_KV" \
  -n "$FUNCAPP_KV" \
  --src /tmp/kv-leak-demo.zip
