#!/usr/bin/env bash
# ==============================================================================
# 4. HELLO WORLD: ZIP-PACKAGING & DEPLOYMENT
# ==============================================================================
# Packt den aktuellen Funktionscode (ohne .git-Historie) in ein ZIP-Archiv
# und lädt dieses per Kudu Zip-Deploy in die Azure Function App hoch.
# Voraussetzung: Aktuelles Arbeitsverzeichnis ist "azure-functions-demos/hello-world".
#
# Erklärung der Parameter:
# zip -r                   : Rekursives Erstellen des ZIP-Archivs
# -x "*.git*"              : Schließt das .git-Verzeichnis vom Archiv aus
# deployment source config-zip : Deployed das lokale ZIP-Paket in die Function App
# --src                    : Pfad zum lokalen ZIP-Archiv

zip -r /tmp/hello-world.zip . -x "*.git*"

az functionapp deployment source config-zip \
  -g "$RG_HELLO" \
  -n "$FUNCAPP_HELLO" \
  --src /tmp/hello-world.zip
