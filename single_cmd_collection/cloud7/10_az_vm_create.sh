#!/usr/bin/env bash
# ==============================================================================
# 5. VIRTUELLE MASCHINE FÜR MONITORING ERSTELLEN
# ==============================================================================
# Erstellt eine Ubuntu-VM in der zulässigen Region der Resource Group (germanywestcentral)
# als Zielressource für Azure Monitor Metriken, Alerts und Resource Health.
# Parameter:
#   --resource-group $RG          : Ziel-Resource-Group (cloud7-gov-rg)
#   --name cloud7-vm              : Name der virtuellen Maschine
#   --image Ubuntu2204            : Ubuntu Server 22.04 LTS Image
#   --size Standard_D2s_v6        : VM-Größe (2 vCPUs, 8 GB RAM)
#   --os-disk-caching ReadWrite   : Caching-Modus der OS-Disk
#   --storage-sku StandardSSD_LRS : Standard SSD (LRS) für die OS-Disk
#   --admin-username azureuser    : Name des Administrator-Benutzers
#   --generate-ssh-keys           : Nutzt vorhandene SSH-Keys (~/.ssh/id_rsa) oder erzeugt neue

az vm create \
  --resource-group $RG \
  --name cloud7-vm \
  --image Ubuntu2204 \
  --size Standard_D2s_v6 \
  --os-disk-caching ReadWrite \
  --storage-sku StandardSSD_LRS \
  --admin-username azureuser \
  --generate-ssh-keys
