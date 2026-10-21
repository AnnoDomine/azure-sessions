#!/usr/bin/env bash
# ==============================================================================
# 3. VM RESOURCE ID ABFRAGEN
# ==============================================================================
# Liest die vollständige Azure Resource ID der VM 'cloud8-vm' aus und speichert
# sie in der Umgebungsvariable VM_ID.
# Parameter:
#   -g / --resource-group $RG : Name der Resource Group (cloud8-lab-rg)
#   -n / --name cloud8-vm     : Name der VM
#   --query id                : Extrahiert das Feld 'id'
#   -o tsv                    : Ausgabe als reiner Textwert

export VM_ID=$(az vm show -g $RG -n cloud8-vm --query id -o tsv)
echo "VM_ID: $VM_ID"
