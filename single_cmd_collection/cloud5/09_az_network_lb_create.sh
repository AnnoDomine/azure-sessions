#!/usr/bin/env bash
# ==============================================================================
# 5. AZURE LOAD BALANCER ERSTELLEN (LAYER 4)
# ==============================================================================
# Erstellt einen öffentlichen Standard Load Balancer inklusive Frontend-IP und Backend-Pool
# Parameter:
#   -g / --resource-group $RG                       : Ziel-Resource-Group
#   -n / --name $LB                                 : Name des Load Balancers (myLB)
#   --sku Standard                                  : Standard-Tarif (unterstützt NSGs und Availability Zones)
#   --public-ip-address $LOAD_BALANCER_IP_NAME      : Verknüpft die zuvor erstellte Public IP
#   --frontend-ip-name fe                           : Name der Frontend-IP-Konfiguration
#   --backend-pool-name pool                        : Name des Backend-Adresspools für die Ziel-VMs

az network lb create \
  -g $RG \
  -n $LB \
  --sku Standard \
  --public-ip-address $LOAD_BALANCER_IP_NAME \
  --frontend-ip-name fe \
  --backend-pool-name pool
