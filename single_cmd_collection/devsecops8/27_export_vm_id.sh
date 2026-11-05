#!/usr/bin/env bash
# ==============================================================================
# 9. RESSOURCEN-IMPORT: AZURE VM RESSOURCEN-ID ERMITTELN
# ==============================================================================
# Fragt die vollständige Azure Resource ID der manuell erstellten VM ab
# und exportiert sie als VM_ID.

export VM_ID=$(az vm show --resource-group "$RG" --name "$VM" --query id -o tsv)
echo "VM_ID: $VM_ID"
