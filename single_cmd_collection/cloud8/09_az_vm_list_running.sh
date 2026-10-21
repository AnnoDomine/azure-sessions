#!/usr/bin/env bash
# ==============================================================================
# 5. LAUFENDE VIRTUELLE MASCHINEN IDENTIFIZIEREN
# ==============================================================================
# Sucht nach allen aktuell laufenden VMs ('VM running'), die aktiv Compute-Kosten
# verursachen, und gibt Name, Resource Group und PowerState tabellarisch aus.
# Parameter:
#   --show-details : Ruft Laufzeitdetails wie PowerState und IP-Adressen ab
#   --query "..."  : JMESPath-Filter auf powerState=='VM running' mit Projektion
#   --output table : Formatierte Tabellenausgabe

az vm list \
  --show-details \
  --query "[?powerState=='VM running'].{name:name, rg:resourceGroup, power:powerState}" \
  --output table
