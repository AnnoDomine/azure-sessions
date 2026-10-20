#!/usr/bin/env bash
# ==============================================================================
# 7. AZURE MONITOR METRICS ALERT ERSTELLEN
# ==============================================================================
# Erstellt eine Metrik-Warnregel (Alert Rule), die jede Minute prüft, ob die
# durchschnittliche CPU-Last der VM über die letzten 5 Minuten 80 % überschreitet,
# und im Ernstfall die Action Group auslöst.
# Parameter:
#   --name high-cpu                        : Name der Alert Rule
#   --resource-group $RG                   : Ziel-Resource-Group (cloud7-gov-rg)
#   --scopes $VM_ID                        : Überwachte Zielressource (VM Resource-ID)
#   --condition "avg Percentage CPU > 80"  : Auslösebedingung (Durchschnitt CPU > 80 %)
#   --window-size 5m                       : Betrachtungszeitraum (5 Minuten)
#   --evaluation-frequency 1m              : Auswertungsintervall (1 Minute)
#   --action $AG_ID                        : Zu benachrichtigende Action Group
#   --description "VM CPU over 80 percent" : Beschreibung der Warnregel

az monitor metrics alert create \
  --name high-cpu \
  --resource-group $RG \
  --scopes $VM_ID \
  --condition "avg Percentage CPU > 80" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --action $AG_ID \
  --description "VM CPU over 80 percent"
