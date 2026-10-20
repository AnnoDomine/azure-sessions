#!/usr/bin/env bash
# ==============================================================================
# 2. RESOURCE GROUP ID ABFRAGEN
# ==============================================================================
# Liest die vollständige Azure Resource ID der Resource Group aus und speichert sie
# in der Umgebungsvariable RG_ID (wird später als Scope für Policy und Tags benötigt).
# Parameter:
#   -n / --name $RG : Name der Resource Group (cloud7-gov-rg)
#   --query id      : JMESPath-Filter auf die Ressourcen-ID
#   -o tsv          : Ausgabe als reiner Textwert (Tab-Separated Values)

export RG_ID=$(az group show -n $RG --query id -o tsv)
echo "RG_ID: $RG_ID"
