#!/usr/bin/env bash
# ==============================================================================
# 12. SYSTEM-ASSIGNED MANAGED IDENTITY ZUWEISEN & PRINCIPAL-ID EXTRAHIEREN
# ==============================================================================
# Aktiviert die systemweit zugewiesene verwaltete Identität für die VM
# und exportiert die daraus resultierende Principal-ID in die Variable VM_PRINCIPAL_ID.
# Dadurch erhält die VM eine eigene Identität in Microsoft Entra ID.
# Parameter:
#   --resource-group "$RG"          : Resource Group der VM
#   --name "$VM"                    : Name der Ziel-VM
#   --query systemAssignedIdentity  : Filtert nach der generierten Principal-ID
#   -o tsv                          : Reiner Textausgabewert

export VM_PRINCIPAL_ID=$(az vm identity assign \
  --resource-group "$RG" \
  --name "$VM" \
  --query systemAssignedIdentity -o tsv)

echo "VM_PRINCIPAL_ID: $VM_PRINCIPAL_ID"
