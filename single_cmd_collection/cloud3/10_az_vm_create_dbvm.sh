#!/usr/bin/env bash
# ==============================================================================
# 4. VIRTUELLE MASCHINEN (VMS) ERSTELLEN
# ==============================================================================
# VM 3: Datenbank-Schicht im "db-subnet"
# Hinweis: In cloud3.sh stand '--name webvm'. In einer realen Umgebung
#          würde hier meist ein eindeutiger Name wie 'dbvm' verwendet werden.
# Parameter:
#   --resource-group $RG          : Ziel-Resource-Group
#   --name webvm                  : Name der VM-Instanz in Azure (wie in cloud3.sh definiert)
#   --image Ubuntu2204            : Betriebssystem-Alias (Ubuntu Server 22.04 LTS)
#   --size Standard_D2s_v6        : Instanztyp (2 vCPUs, 8 GB RAM)
#   --storage-sku StandardSSD_LRS : Festplattentyp: Standard SSD mit lokaler Redundanz
#   --vnet-name $VNET             : Ziel-VNet
#   --subnet db-subnet            : Ziel-Subnetz (db-subnet)
#   --public-ip-address ""        : Keine öffentliche IP-Adresse (maximaler Schutz)
#   --admin-username azureuser    : Administrator-Benutzername
#   --generate-ssh-keys           : SSH-Schlüsselpaar generieren bzw. hinterlegen

az vm create \
  --resource-group $RG \
  --name webvm \
  --image Ubuntu2204 \
  --size Standard_D2s_v6 \
  --storage-sku StandardSSD_LRS \
  --vnet-name $VNET \
  --subnet db-subnet \
  --public-ip-address "" \
  --admin-username azureuser \
  --generate-ssh-keys
