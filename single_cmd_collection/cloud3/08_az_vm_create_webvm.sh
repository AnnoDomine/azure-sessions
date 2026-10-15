#!/usr/bin/env bash
# ==============================================================================
# 4. VIRTUELLE MASCHINEN (VMS) ERSTELLEN
# ==============================================================================
# VM 1: Web-Schicht im "web-subnet"
# Parameter:
#   --resource-group $RG          : Ziel-Resource-Group
#   --name webvm                  : Name der VM-Instanz in Azure
#   --image Ubuntu2204            : Betriebssystem-Alias (Ubuntu Server 22.04 LTS)
#   --size Standard_D2s_v6        : Instanztyp / Rechenleistung (2 vCPUs, 8 GB RAM, neueste Generation v6)
#   --storage-sku StandardSSD_LRS : OS-Festplattentyp: Standard SSD mit lokaler Redundanz (LRS)
#   --vnet-name $VNET             : Ziel-VNet für die Netzwerkanbindung
#   --subnet web-subnet           : Ziel-Subnetz, aus dem die private IP vergeben wird
#   --public-ip-address ""        : "" = Keine öffentliche IP zuweisen (VM ist nur privat erreichbar)
#   --admin-username azureuser    : Benutzername für den initialen Linux-Administrator-Account
#   --generate-ssh-keys           : Verwendet vorhandene SSH-Keys (~/.ssh/id_rsa) oder generiert automatisch neue

az vm create \
  --resource-group $RG \
  --name webvm \
  --image Ubuntu2204 \
  --size Standard_D2s_v6 \
  --storage-sku StandardSSD_LRS \
  --vnet-name $VNET \
  --subnet web-subnet \
  --public-ip-address "" \
  --admin-username azureuser \
  --generate-ssh-keys
