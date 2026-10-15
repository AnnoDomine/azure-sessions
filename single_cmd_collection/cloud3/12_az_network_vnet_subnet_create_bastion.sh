#!/usr/bin/env bash
# ==============================================================================
# 6. AZURE BASTION (SICHERER REMOTE-ZUGRIFF OHNE PUBLIC IPS)
# ==============================================================================
# Erstellt das zwingend erforderliche Bastion-Subnetz
# Parameter:
#   --resource-group $RG              : Ziel-Resource-Group
#   --vnet-name $VNET                 : Übergeordnetes virtuelles Netzwerk
#   --name AzureBastionSubnet         : Strikt vorgegebener Systemname (Azure akzeptiert nur diesen Namen)
#   --address-prefixes 10.10.255.0/26 : CIDR-Bereich (Azure Bastion erfordert mindestens ein /26-Subnetz)

az network vnet subnet create \
  --resource-group $RG \
  --vnet-name $VNET \
  --name AzureBastionSubnet \
  --address-prefixes 10.10.255.0/26
