#!/usr/bin/env bash
# ==============================================================================
# 16. LOKALES CONTAINER-IMAGE ENTFERNEN
# ==============================================================================
# Löscht das lokale Docker-Image dev-sec-ops-7.
# Parameter:
#   "$CONTAINER" : Name / Tag des zu entfernenden Images

docker image remove "$CONTAINER"
