#!/usr/bin/env bash
# ==============================================================================
# 12. PUBLIC IP FÜR DAS APPLICATION GATEWAY ERSTELLEN
# ==============================================================================
# Erstellt eine statische öffentliche IPv4-Adresse (Standard SKU) für das Application Gateway
# Parameter:
#   --resource-group $RG : Ziel-Resource-Group
#   --name $GW_IP        : Name der Public-IP-Ressource (appgw-ip)
#   --sku Standard       : Erforderlich für Application Gateway v2 / WAF_v2

az network public-ip create \
  --resource-group $RG \
  --name $GW_IP \
  --sku Standard
