#!/usr/bin/env bash
# ==============================================================================
# 14. CONTAINER STARTEN
# ==============================================================================
# Startet einen Container basierend auf dem aus der ACR bezogenen Image.
# Parameter:
#   -d                  : Detached Mode (Container läuft im Hintergrund)
#   -p 5050:5050        : Port-Mapping (Host-Port 5050 auf Container-Port 5050)
#   --name "$CONTAINER" : Name der Container-Instanz (dev-sec-ops-7)
#   "$CONTAINER_LINK"   : Verwendetes Image (<acr>.azurecr.io/dev-sec-ops-7:latest)

docker run -d -p 5050:5050 --name "$CONTAINER" "$CONTAINER_LINK"
