#!/usr/bin/env bash
# ==============================================================================
# 7. LOAD BALANCER REGEL (LOAD BALANCING RULE) ERSTELLEN
# ==============================================================================
# Definiert, wie eingehender Traffic auf dem Frontend (Port 80) an den Backend-Pool verteilt wird
# Parameter:
#   -g / --resource-group $RG : Ziel-Resource-Group
#   --lb-name $LB             : Name des Load Balancers
#   -n / --name http          : Name der Lastverteilungsregel
#   --protocol Tcp            : Transportprotokoll (Layer 4 TCP)
#   --frontend-port 80        : Eingehender Port auf der Public IP
#   --backend-port 80         : Zielport auf den Backend-Instanzen
#   --frontend-ip-name fe     : Name der zu nutzenden Frontend-IP-Konfiguration
#   --backend-pool-name pool  : Name des Ziel-Backend-Pools
#   --probe-name health       : Verknüpfte Health Probe zur Überwachung der Knoten

az network lb rule create \
  -g $RG \
  --lb-name $LB \
  -n http \
  --protocol Tcp \
  --frontend-port 80 \
  --backend-port 80 \
  --frontend-ip-name fe \
  --backend-pool-name pool \
  --probe-name health
