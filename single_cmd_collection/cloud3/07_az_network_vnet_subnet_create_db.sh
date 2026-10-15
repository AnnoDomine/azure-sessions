#!/usr/bin/env bash
# ==============================================================================
# 3. VIRTUELLES NETZWERK & SUBNETZE ERSTELLEN
# ==============================================================================
# Erstellt das Subnetz für die Datenbankschicht
# Parameter:
#   --resource-group $RG            : Resource Group des Ziel-VNets
#   --vnet-name $VNET               : Name des übergeordneten virtuellen Netzwerks
#   --name db-subnet                : Eindeutiger Name des neuen Subnetzes
#   --address-prefixes 10.10.3.0/24 : CIDR-Adressbereich für die Datenbank-Ebene (10.10.3.0 - 10.10.3.255)

az network vnet subnet create \
  --resource-group $RG \
  --vnet-name $VNET \
  --name db-subnet \
  --address-prefixes 10.10.3.0/24
