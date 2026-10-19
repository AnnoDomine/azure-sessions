#!/usr/bin/env bash
# ==============================================================================
# 7. BLOB-ZUGRIFF VIA SAS-TOKEN TESTEN
# ==============================================================================
# Ruft den geschützten Blob direkt über HTTP/HTTPS mit dem angehängten SAS-Token ab
# Parameter:
#   -s : Silent mode (unterdrückt Fortschrittsbalken)

curl -s "$URL?$SAS"
