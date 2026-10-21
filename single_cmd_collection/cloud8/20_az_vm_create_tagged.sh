#!/usr/bin/env bash
# ==============================================================================
# 12. POLICY-KONFORME VM MIT PFLICHT-TAG BEREITSTELLEN
# ==============================================================================
# Erstellt eine weitere Ubuntu-VM ('test-tag-vm-cloud8') unter Angabe des durch
# die Policy geforderten Tags 'owner=<Subscription-ID>', um die erfolgreiche
# Bereitstellung unter aktiver Tag-Governance zu verifizieren.
# Parameter:
#   --resource-group $RG          : Ziel-Resource-Group (cloud8-lab-rg)
#   --name test-tag-vm-cloud8     : Name der Test-VM
#   --tags $TAG_NAME=$SUB         : Setzt das Pflicht-Tag (owner=<SUB>) auf die Ressource
#   --image Ubuntu2204            : Ubuntu Server 22.04 LTS Image
#   --size Standard_D2s_v6        : VM-Größe (2 vCPUs, 8 GB RAM)
#   --os-disk-caching ReadWrite   : Caching-Modus der OS-Disk
#   --storage-sku StandardSSD_LRS : Standard SSD (LRS) für die OS-Disk
#   --admin-username azureuser    : Name des Administrator-Benutzers
#   --generate-ssh-keys           : Nutzt vorhandene SSH-Keys (~/.ssh/id_rsa) oder erzeugt neue

az vm create \
  --resource-group $RG \
  --name test-tag-vm-cloud8 \
  --tags $TAG_NAME=$SUB \
  --image Ubuntu2204 \
  --size Standard_D2s_v6 \
  --os-disk-caching ReadWrite \
  --storage-sku StandardSSD_LRS \
  --admin-username azureuser \
  --generate-ssh-keys
