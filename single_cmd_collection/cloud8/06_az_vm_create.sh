#!/usr/bin/env bash
# ==============================================================================
# 3. VIRTUELLE MASCHINE BEREITSTELLEN
# ==============================================================================
# Erstellt eine Ubuntu-VM zur Demonstration von Laufzeitkosten, Deallokation
# und automatischem Herunterfahren (Auto-Shutdown).
# Parameter:
#   --resource-group $RG          : Ziel-Resource-Group (cloud8-lab-rg)
#   --name $VM                    : Name der virtuellen Maschine (cloud8-vm)
#   --image Ubuntu2204            : Ubuntu Server 22.04 LTS Image
#   --size Standard_D2s_v6        : VM-Größe (2 vCPUs, 8 GB RAM)
#   --os-disk-caching ReadWrite   : Caching-Modus der OS-Disk
#   --storage-sku StandardSSD_LRS : Standard SSD (LRS) für die OS-Disk
#   --admin-username azureuser    : Name des Administrator-Benutzers
#   --generate-ssh-keys           : Nutzt vorhandene SSH-Keys (~/.ssh/id_rsa) oder erzeugt neue

az vm create \
  --resource-group $RG \
  --name $VM \
  --image Ubuntu2204 \
  --size Standard_D2s_v6 \
  --os-disk-caching ReadWrite \
  --storage-sku StandardSSD_LRS \
  --admin-username azureuser \
  --generate-ssh-keys
