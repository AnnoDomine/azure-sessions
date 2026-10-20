#!/usr/bin/env bash
# ==============================================================================
# 5. VM RESOURCE ID ABFRAGEN
# ==============================================================================
# Liest die vollständige Azure Resource ID der VM 'cloud7-vm' aus und speichert
# sie in der Umgebungsvariable VM_ID (für Metrik-, Alert- und REST-Abfragen).
# Parameter:
#   -g / --resource-group $RG : Name der Resource Group (cloud7-gov-rg)
#   -n / --name cloud7-vm     : Name der VM
#   --query id                : Extrahiert das Feld 'id'
#   -o tsv                    : Ausgabe als reiner Textwert

export VM_ID=$(az vm show -g $RG -n cloud7-vm --query id -o tsv)
echo $VM_ID
