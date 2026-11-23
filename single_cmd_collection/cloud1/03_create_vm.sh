#!/usr/bin/env bash
# ==============================================================================
# 3. VIRTUELLE MASCHINE ERSTELLEN
# ==============================================================================
# Erstellt eine Ubuntu-VM inklusive OS-Disk, VNet/Subnetz, NIC, Public IP und
# Network Security Group (NSG mit automatischer Inbound-Regel für Port 22) 
# innerhalb der zuvor angelegten Resource Group.
# Die zugewiesene Public IP wird per JMESPath direkt in $PUBLIC_IP gespeichert.

export PUBLIC_IP=$(az vm create \
  --resource-group "$RG" \
  --location "$LOCATION" \
  --zone "$ZONE" \
  --name "$VM_NAME" \
  --image "$VM_IMAGE" \
  --size "$VM_SIZE" \
  --public-ip-sku "$VM_IP_SKU" \
  --admin-username "$ADMIN_USER" \
  --ssh-key-value "$SSH_KEY_PUB" \
  --query "publicIpAddress" \
  --output tsv)

echo "VM erstellt. Public IP: $PUBLIC_IP"
