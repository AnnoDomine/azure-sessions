#!/usr/bin/env bash
# ==============================================================================
# 6. AZURE MONITOR METRIKEN ABFRAGEN (PERCENTAGE CPU)
# ==============================================================================
# Fragt die CPU-Auslastung ('Percentage CPU') der VM im 1-Minuten-Intervall ab
# und stellt Zeitstempel sowie Durchschnittswert tabellarisch dar.
# Parameter:
#   --resource $VM_ID         : Resource-ID der überwachten VM
#   --metric "Percentage CPU" : Name der abzufragenden Plattform-Metrik
#   --interval PT1M           : Aggregationsintervall im ISO-8601-Format (1 Minute)
#   --query "..."             : JMESPath-Projektion auf Zeitstempel (timeStamp) und Durchschnitt (average)
#   -o table                  : Formatierte Tabellenausgabe

az monitor metrics list \
  --resource $VM_ID \
  --metric "Percentage CPU" \
  --interval PT1M \
  --query "value[].timeseries[].data[].{time:timeStamp, cpu:average}" \
  -o table
