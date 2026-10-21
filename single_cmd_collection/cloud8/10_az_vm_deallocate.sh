#!/usr/bin/env bash
# ==============================================================================
# 6. VM DEALLOKIEREN (COMPUTE-KOSTEN STOPPEN)
# ==============================================================================
# Fährt die virtuelle Maschine herunter und gibt die zugewiesene Compute-Hardware
# im Azure-Rechenzentrum frei (Status: 'VM deallocated'), sodass keine vCPU-/RAM-
# Laufzeitkosten mehr anfallen (Storage-Kosten für Disks laufen weiter).
# Parameter:
#   --resource-group $RG : Name der Resource Group (cloud8-lab-rg)
#   --name $VM           : Name der zu deallokierenden VM (cloud8-vm)

az vm deallocate \
  --resource-group $RG \
  --name $VM
