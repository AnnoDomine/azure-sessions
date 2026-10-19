#!/usr/bin/env bash
# ==============================================================================
# 9. LOAD BALANCER BACKEND-POOL ÜBERPRÜFEN
# ==============================================================================
# Listet die Ressourcen-IDs aller IP-Konfigurationen auf, die im Backend-Pool registriert sind
# Parameter:
#   -g / --resource-group $RG              : Ziel-Resource-Group
#   --lb-name $LB                          : Name des Load Balancers
#   -n / --name pool                       : Name des abgefragten Backend-Pools
#   --query "backendIPConfigurations[].id" : JMESPath-Filter auf die IDs der verknüpften NIC-IP-Configs
#   -o tsv                                 : Ausgabe im reinen Textformat (Tab-separated)

az network lb address-pool show \
  -g $RG \
  --lb-name $LB \
  -n pool \
  --query "backendIPConfigurations[].id" \
  -o tsv
