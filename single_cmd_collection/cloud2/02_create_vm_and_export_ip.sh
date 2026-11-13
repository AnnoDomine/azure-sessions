#!/usr/bin/env bash
# ==============================================================================
# 2. LINUX-VM ERSTELLEN & PUBLIC IP EXTRAHIEREN
# ==============================================================================
# Erstellt eine Ubuntu-VM inklusive OS-Disk, VNet/Subnetz, NIC, Public IP und
# Network Security Group (NSG mit automatischer Inbound-Regel für Port 22).
# Die zugewiesene Public IP wird per JMESPath direkt in $PUBLIC_IP gespeichert.

export PUBLIC_IP=$(az vm create \
  --resource-group "$RG" \
  --name "$VM_NAME" \
  --image "$VM_IMAGE" \
  --size "$VM_SIZE" \
  --admin-username "$ADMIN_USER" \
  --generate-ssh-keys \
  --query "publicIpAddress" \
  --output tsv)

echo "VM erstellt. Public IP: $PUBLIC_IP"
