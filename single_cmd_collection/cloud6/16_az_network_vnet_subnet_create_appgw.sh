#!/usr/bin/env bash
# ==============================================================================
# 11. DEDIZIERTES SUBNETZ FÜR APPLICATION GATEWAY ERSTELLEN
# ==============================================================================
# Ein Azure Application Gateway benötigt zwingend ein eigenes, dediziertes Subnetz im VNet
# Parameter:
#   --resource-group $RG           : Ziel-Resource-Group
#   --vnet-name $VNET              : Name des bestehenden Virtual Networks
#   --name $GW_SUB                 : Name des Subnetzes (appgw-subnet)
#   --address-prefixes 10.20.2.0/24: IPv4-Adressbereich des Gateway-Subnetzes

az network vnet subnet create \
  --resource-group $RG \
  --vnet-name $VNET \
  --name $GW_SUB \
  --address-prefixes 10.20.2.0/24
