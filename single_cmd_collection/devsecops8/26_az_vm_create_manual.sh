#!/usr/bin/env bash
# ==============================================================================
# 9. RESSOURCEN-IMPORT: MANUELLES ERSTELLEN EINER AZURE VM
# ==============================================================================
# Erstellt eine Linux-VM manuell über die Azure CLI außerhalb von Terraform,
# um anschließend den automatisierten Import-Workflow zu demonstrieren.
# Parameter:
#   --resource-group $RG          : Ziel-Resource-Group (dev-sec-ops-8-lab-rg)
#   --name $VM                    : Name der VM (dev-sec-ops-8-lab-vm)
#   --image Ubuntu2204            : Betriebssystem-Image (Ubuntu 22.04 LTS)
#   --size Standard_D2s_v6        : VM-Größe / SKU
#   --os-disk-caching ReadWrite   : OS-Disk Caching-Modus
#   --storage-sku StandardSSD_LRS : Speichertyp der OS-Disk
#   --admin-username azureuser    : Admin-Benutzername
#   --generate-ssh-keys           : Generiert oder nutzt vorhandene SSH-Schlüssel

az vm create \
  --resource-group $RG \
  --name $VM \
  --image Ubuntu2204 \
  --size Standard_D2s_v6 \
  --os-disk-caching ReadWrite \
  --storage-sku StandardSSD_LRS \
  --admin-username azureuser \
  --generate-ssh-keys
