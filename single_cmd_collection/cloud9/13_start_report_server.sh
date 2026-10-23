#!/usr/bin/env bash
# ==============================================================================
# 14. LOKALEN BERICHTS-WEBSERVER STARTEN
# ==============================================================================
# Startet einen leichtgewichtigen Python-Webserver auf Port 8000 (typischerweise
# direkt im 'output'-Ordner ausgeführt), um den generierten interaktiven
# HTML-Sicherheitsbericht komfortabel im Browser betrachten zu können.
# Parameter:
#   -m http.server 8000 : Startet das integrierte HTTP-Servermodul auf Port 8000

python3 -m http.server 8000
