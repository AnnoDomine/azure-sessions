#!/usr/bin/env bash
# ==============================================================================
# 3. VIRTUAL NETWORK (VNET) & BACKEND-SUBNETZ ERSTELLEN
# ==============================================================================
# Erstellt das virtuelle Netzwerk (VNet) inklusive des ersten Subnetzes für die Backend-VMs
# Parameter:
#   --resource-group $RG            : Ziel-Resource-Group
#   --name $VNET                    : Name des Virtual Networks
#   --address-prefixes 10.20.0.0/16 : Übergeordneter IPv4-Adressbereich (CIDR) des VNets
#   --subnet-name backend           : Name des ersten Subnetzes für die Backend-Server
#   --subnet-prefixes 10.20.1.0/24  : IPv4-Adressbereich (CIDR) des Backend-Subnetzes

az network vnet create \
  --resource-group $RG \
  --name $VNET \
  --address-prefixes 10.20.0.0/16 \
  --subnet-name backend \
  --subnet-prefixes 10.20.1.0/24
