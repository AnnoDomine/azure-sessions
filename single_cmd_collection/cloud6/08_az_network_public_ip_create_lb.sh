#!/usr/bin/env bash
# ==============================================================================
# 4. PUBLIC IP FÜR DEN LOAD BALANCER ERSTELLEN
# ==============================================================================
# Erstellt eine öffentliche IPv4-Adresse (Standard SKU) für das Load-Balancer-Frontend
# Parameter:
#   -g / --resource-group $RG            : Ziel-Resource-Group
#   -n / --name $LOAD_BALANCER_IP_NAME   : Name der Public-IP-Ressource (lb-ip)
#   --sku Standard                       : Erforderlich für einen Standard Load Balancer (statische IP)

az network public-ip create \
  -g $RG \
  -n $LOAD_BALANCER_IP_NAME \
  --sku Standard
