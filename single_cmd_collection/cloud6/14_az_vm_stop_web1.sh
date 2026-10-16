#!/usr/bin/env bash
# ==============================================================================
# 10. FAILOVER-TEST: VM WEB1 STOPPEN
# ==============================================================================
# Fährt die virtuelle Maschine 'web1' herunter, um den Ausfall eines Backend-Knotens
# zu simulieren (der Load Balancer leitet daraufhin allen Traffic an 'web2')
# Parameter:
#   --resource-group $RG : Ziel-Resource-Group
#   --name web1          : Name der zu stoppenden VM

echo "End web1"
az vm stop \
  --resource-group $RG \
  --name web1
