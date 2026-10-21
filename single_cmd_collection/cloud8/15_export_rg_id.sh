#!/usr/bin/env bash
# ==============================================================================
# 10. RESOURCE GROUP ID ABFRAGEN
# ==============================================================================
# Liest die vollständige Azure Resource ID der Resource Group aus und speichert sie
# in der Umgebungsvariable RG_ID (wird für das Tagging benötigt).
# Parameter:
#   -n / --name $RG : Name der Resource Group (cloud8-lab-rg)
#   --query id      : JMESPath-Filter auf die Ressourcen-ID
#   -o tsv          : Ausgabe als reiner Textwert (Tab-Separated Values)

export RG_ID=$(az group show -n $RG --query id -o tsv)
echo "RG_ID: $RG_ID"
