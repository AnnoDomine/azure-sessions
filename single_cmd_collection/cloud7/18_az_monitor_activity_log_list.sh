#!/usr/bin/env bash
# ==============================================================================
# 9. ACTIVITY LOG ABFRAGEN (CONTROL-PLANE AUDITING)
# ==============================================================================
# Listet die Control-Plane-Ereignisse (Erstellen, Ändern, Policy-Denies etc.)
# der letzten 30 Minuten innerhalb der Resource Group tabellarisch auf.
# Parameter:
#   --resource-group $RG : Filtert auf Ereignisse dieser Resource Group
#   --offset 30m         : Zeitraum rückwirkend ab jetzt (letzte 30 Minuten)
#   --query "..."        : Extrahiert Operationsname, Aufrufer (Caller) und Status
#   -o table             : Formatierte Tabellenausgabe

az monitor activity-log list \
  --resource-group $RG \
  --offset 30m \
  --query "[].{op:operationName.localizedValue, by:caller, status:status.value}" \
  -o table
