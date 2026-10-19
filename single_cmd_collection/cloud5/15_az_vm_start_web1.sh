#!/usr/bin/env bash
# ==============================================================================
# 10. FAILOVER-TEST: VM WEB1 WIEDER STARTEN
# ==============================================================================
# Startet die virtuelle Maschine 'web1' wieder, sodass sie nach erfolgreicher Health Probe
# erneut in die Lastverteilung aufgenommen wird
# Parameter:
#   --resource-group $RG : Ziel-Resource-Group
#   --name web1          : Name der zu startenden VM

echo "Start web1"
az vm start \
  --resource-group $RG \
  --name web1
