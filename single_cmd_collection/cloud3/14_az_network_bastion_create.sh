#!/usr/bin/env bash
# ==============================================================================
# 6. AZURE BASTION (SICHERER REMOTE-ZUGRIFF OHNE PUBLIC IPS)
# ==============================================================================
# Erstellt den verwalteten Bastion-PaaS-Dienst
# Parameter:
#   --resource-group $RG            : Ziel-Resource-Group
#   --name cloud3-bastion           : Eindeutiger Name des Bastion-Dienstes
#   --vnet-name $VNET               : Zu verknüpfendes Ziel-VNet
#   --public-ip-address bastion-pip : Verknüpfte öffentliche IP-Adresse
#   --location $REGION              : Zielregion
#   --sku Standard                  : Bastion Standard-Tier (erforderlich für Tunneling & native Clients)
#   --enable-tunneling true         : Erlaubt direktes Tunneln über az cli (z. B. 'az network bastion tunnel')

az network bastion create \
  --resource-group $RG \
  --name cloud3-bastion \
  --vnet-name $VNET \
  --public-ip-address bastion-pip \
  --location $REGION \
  --sku Standard \
  --enable-tunneling true
