#!/usr/bin/env bash
# ==============================================================================
# 6. LOAD BALANCER HEALTH PROBE ERSTELLEN
# ==============================================================================
# Erstellt eine Integritätsprüfung (Health Probe), mit der der Load Balancer prüft,
# ob die Backend-VMs auf Port 80 erreichbar und funktionsfähig sind
# Parameter:
#   -g / --resource-group $RG : Ziel-Resource-Group
#   --lb-name $LB             : Name des zugehörigen Load Balancers
#   -n / --name health        : Name der Health Probe
#   --protocol Tcp            : Prüfprotokoll (TCP-Handshake)
#   --port 80                 : Zielport der Integritätsprüfung (HTTP)

az network lb probe create \
  -g $RG \
  --lb-name $LB \
  -n health \
  --protocol Tcp \
  --port 80
