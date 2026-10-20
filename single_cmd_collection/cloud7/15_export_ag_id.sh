#!/usr/bin/env bash
# ==============================================================================
# 7. ACTION GROUP ID ABFRAGEN
# ==============================================================================
# Liest die Resource-ID der erstellten Action Group aus und speichert sie in AG_ID,
# um sie anschließend mit einer Metrik-Warnregel (Alert Rule) zu verknüpfen.
# Parameter:
#   -g / --resource-group $RG : Name der Resource Group (cloud7-gov-rg)
#   -n / --name cloud7-ag     : Name der Action Group
#   --query id                : Extrahiert die Resource-ID
#   -o tsv                    : Ausgabe als reiner Textwert

export AG_ID=$(az monitor action-group show -g $RG -n cloud7-ag --query id -o tsv)
echo "AG_ID: $AG_ID"
