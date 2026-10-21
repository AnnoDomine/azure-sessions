#!/usr/bin/env bash
# ==============================================================================
# 7. AUTOMATISCHES HERUNTERFAHREN (AUTO-SHUTDOWN) KONFIGURIEREN
# ==============================================================================
# Richtet einen täglichen Auto-Shutdown-Zeitplan für die VM ein, um ungenutzte
# Laufzeitkosten (z. B. außerhalb der Arbeitszeiten in Test-/Dev-Umgebungen)
# automatisch zu vermeiden.
# Parameter:
#   --resource-group $RG : Name der Resource Group (cloud8-lab-rg)
#   --name $VM           : Name der VM (cloud8-vm)
#   --time 2100          : Uhrzeit für den täglichen Shutdown im 24h-Format (21:00 UTC)

az vm auto-shutdown \
  --resource-group $RG \
  --name $VM \
  --time 2100
