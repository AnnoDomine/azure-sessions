#!/usr/bin/env bash
# ==============================================================================
# 11. UBUNTU VIRTUAL MACHINE ERSTELLEN
# ==============================================================================
# Erstellt eine Ubuntu 22.04 LTS VM zur sicheren Workload-Ausführung und
# Identitätsauthentifizierung gegenüber Azure Key Vault.
# Parameter:
#   --resource-group $RG          : Name der Ziel-Resource-Group
#   --name $VM                    : Name der virtuellen Maschine (key-vault-vm)
#   --image Ubuntu2204            : Betriebssystem-Image (Ubuntu Server 22.04 LTS)
#   --size Standard_D2s_v6        : VM-Größe / Rechenleistung (2 vCPUs, 8 GiB RAM)
#   --os-disk-caching ReadWrite   : OS-Festplatten-Caching
#   --storage-sku StandardSSD_LRS : Speichertyp der OS-Disk (Standard SSD lokal redundant)
#   --admin-username azureuser    : Standardbenutzername für SSH-Zugriffe
#   --generate-ssh-keys           : Generiert SSH-Schlüssel unter ~/.ssh, falls nicht vorhanden

az vm create \
  --resource-group $RG \
  --name $VM \
  --image Ubuntu2204 \
  --size Standard_D2s_v6 \
  --os-disk-caching ReadWrite \
  --storage-sku StandardSSD_LRS \
  --admin-username azureuser \
  --generate-ssh-keys
