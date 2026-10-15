#!/usr/bin/env bash
# ==============================================================================
# 3. VIRTUELLES NETZWERK & SUBNETZE ERSTELLEN
# ==============================================================================
# Erstellt das VNet und direkt das erste Subnetz ("web-subnet")
# Parameter:
#   --resource-group $RG            : Ziel-Resource-Group, in der das VNet liegt
#   --name $VNET                    : Name des virtuellen Netzwerks
#   --address-prefixes 10.10.0.0/16 : Gesamter CIDR-Adressraum des VNets (65.536 IP-Adressen)
#   --subnet-name web-subnet        : Name des initial mit dem VNet erstellten Subnetzes
#   --subnet-prefixes 10.10.1.0/24  : CIDR-Adressbereich für das Web-Subnetz (256 Adressen, 251 nutzbar)

az network vnet create \
  --resource-group $RG \
  --name $VNET \
  --address-prefixes 10.10.0.0/16 \
  --subnet-name web-subnet \
  --subnet-prefixes 10.10.1.0/24
