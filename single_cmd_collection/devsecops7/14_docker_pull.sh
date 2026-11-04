#!/usr/bin/env bash
# ==============================================================================
# 12. IMAGE AUS DER AZURE CONTAINER REGISTRY HERUNTERLADEN
# ==============================================================================
# Zieht (pulled) das Image direkt aus der Azure Container Registry herunter,
# um Verteilung und Berechtigungen zu verifizieren.
# Parameter:
#   "$CONTAINER_LINK" : Vollqualifizierter Image-Pfad in der ACR

docker pull "$CONTAINER_LINK"
