#!/usr/bin/env bash
# ==============================================================================
# 9. RESOURCE HEALTH STATUS VIA REST-API ABFRAGEN
# ==============================================================================
# Fragt den aktuellen Gesundheitszustand (Availability Status) der VM direkt über
# den Resource Provider 'Microsoft.ResourceHealth' via Azure REST API ab.
# Parameter:
#   --method get  : HTTP-GET-Anfrage
#   --url "..."   : ARM-Endpunkt für den aktuellen Availability Status (API-Version 2025-05-01)
#   --query "..." : Extrahiert den Status (availabilityState, z. B. Available) und die Zusammenfassung
#   -o table      : Formatierte Tabellenausgabe

az rest \
  --method get \
  --url "https://management.azure.com$VM_ID/providers/Microsoft.ResourceHealth/availabilityStatuses/current?api-version=2025-05-01" \
  --query "properties.{state:availabilityState, summary:summary}" \
  -o table
