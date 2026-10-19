#!/usr/bin/env bash
# ==============================================================================
# 6. PRINCIPAL-ID & PUBLIC-IP DER VM AUSLESEN
# ==============================================================================
# Liest die Principal-ID (Object-ID der System-Assigned Managed Identity) sowie
# die öffentliche IP-Adresse der erstellten VM aus und speichert sie in Variablen.
# Parameter:
#   -g $RG                        : Name der Resource Group
#   -n $VM                        : Name der virtuellen Maschine (mi-vm)
#   -d / --show-details           : Lädt Laufzeitdetails wie öffentliche/private IPs mit
#   --query identity.principalId  : Extrahiert die Entra-ID Principal-ID der Managed Identity
#   --query publicIps             : Extrahiert die zugewiesene öffentliche IPv4-Adresse
#   -o tsv                        : Gibt den reinen Wert als Text zurück

export PRINCIPAL_ID=$(az vm show \
  -g $RG \
  -n $VM \
  --query identity.principalId \
  -o tsv)

export VM_IP=$(az vm show \
  -d \
  -g $RG \
  -n $VM \
  --query publicIps \
  -o tsv)

echo "PRINCIPAL_ID: $PRINCIPAL_ID"
echo "VM_IP: $VM_IP"
