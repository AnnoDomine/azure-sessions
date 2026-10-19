#!/usr/bin/env bash
# ==============================================================================
# 5. VM MIT SYSTEM-ASSIGNED MANAGED IDENTITY ERSTELLEN
# ==============================================================================
# Erstellt eine Ubuntu-VM und aktiviert gleichzeitig eine System-Assigned Managed
# Identity (--assign-identity), sodass die VM eine eigene Identität in Entra ID erhält.
# Parameter:
#   --resource-group $RG          : Ziel-Resource-Group (cloud6-rbac-rg)
#   --name $VM                    : Name der virtuellen Maschine (mi-vm)
#   --image Ubuntu2204            : Ubuntu Server 22.04 LTS Image
#   --size Standard_D2s_v6        : VM-Größe (2 vCPUs, 8 GB RAM)
#   --storage-sku StandardSSD_LRS : Standard SSD (LRS) für die OS-Disk
#   --location $REGION            : Zielregion (germanywestcentral)
#   --public-ip-sku Standard      : Erstellt eine Standard Public-IP für direkten SSH-Zugang
#   --assign-identity             : Aktiviert die System-Assigned Managed Identity in Microsoft Entra ID
#   --admin-username azureuser    : Name des Administrator-Benutzers
#   --generate-ssh-keys           : Nutzt vorhandene SSH-Keys (~/.ssh/id_rsa) oder erzeugt neue

az vm create \
  --resource-group $RG \
  --name $VM \
  --image Ubuntu2204 \
  --size Standard_D2s_v6 \
  --storage-sku StandardSSD_LRS \
  --location $REGION \
  --public-ip-sku Standard \
  --assign-identity \
  --admin-username azureuser \
  --generate-ssh-keys
