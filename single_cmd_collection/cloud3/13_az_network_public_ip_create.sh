#!/usr/bin/env bash
# ==============================================================================
# 6. AZURE BASTION (SICHERER REMOTE-ZUGRIFF OHNE PUBLIC IPS)
# ==============================================================================
# Erstellt die öffentliche IP-Adresse für den Bastion Host
# Parameter:
#   --resource-group $RG : Ziel-Resource-Group
#   --name bastion-pip   : Name der Public-IP-Ressource
#   --sku Standard       : Standard-SKU (für Bastion zwingend statisch & Standard vorgeschrieben)
#   --location $REGION   : Muss in derselben Region wie das VNet liegen

az network public-ip create \
  --resource-group $RG \
  --name bastion-pip \
  --sku Standard \
  --location $REGION
