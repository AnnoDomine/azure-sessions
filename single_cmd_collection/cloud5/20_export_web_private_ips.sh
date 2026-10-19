#!/usr/bin/env bash
# ==============================================================================
# 15. PRIVATE IP-ADRESSEN DER BACKEND-VMs ERMITTELN
# ==============================================================================
# Liest die privaten IPv4-Adressen von web1 und web2 aus und speichert sie in Variablen,
# um sie anschließend als Backend-Server im Application Gateway zu hinterlegen
# Parameter:
#   -d / --show-details       : Lädt erweiterte Laufzeitdetails (inkl. IP-Adressen)
#   -g / --resource-group $RG : Ziel-Resource-Group
#   -n / --name web1 / web2   : Name der jeweiligen VM
#   --query privateIps        : Filtert auf die zugewiesene private IP-Adresse
#   -o tsv                    : Reiner Textwert ohne Anführungszeichen

export WEB1_IP=$(az vm show -d -g $RG -n web1 --query privateIps -o tsv)
export WEB2_IP=$(az vm show -d -g $RG -n web2 --query privateIps -o tsv)
