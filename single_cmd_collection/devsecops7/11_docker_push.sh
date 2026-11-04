#!/usr/bin/env bash
# ==============================================================================
# 9. DOCKER IMAGE IN DIE AZURE CONTAINER REGISTRY HOCHLADEN
# ==============================================================================
# Lädt (pushed) das zuvor gebaute Image in die private Azure Container Registry hoch.
# Parameter:
#   "$CONTAINER_LINK" : Vollqualifizierter Image-Name (<acr>.azurecr.io/dev-sec-ops-7:latest)

docker push "$CONTAINER_LINK"
