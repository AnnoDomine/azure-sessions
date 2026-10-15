#!/usr/bin/env bash
# ==============================================================================
# 3. VIRTUELLES NETZWERK & SUBNETZE ERSTELLEN
# ==============================================================================
# Erstellt das Subnetz für die Applikationsschicht
# Parameter:
#   --resource-group $RG            : Resource Group, in der sich das übergeordnete VNet befindet
#   --vnet-name $VNET               : Name des übergeordneten virtuellen Netzwerks
#   --name app-subnet               : Eindeutiger Name des neuen Subnetzes
#   --address-prefixes 10.10.2.0/24 : CIDR-Adressbereich für die App-Ebene (10.10.2.0 - 10.10.2.255)

az network vnet subnet create \
  --resource-group $RG \
  --vnet-name $VNET \
  --name app-subnet \
  --address-prefixes 10.10.2.0/24
