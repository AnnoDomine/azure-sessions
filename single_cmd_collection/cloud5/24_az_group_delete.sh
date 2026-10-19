#!/usr/bin/env bash
# ==============================================================================
# 18. RESSOURCENGRUPPE BEREINIGEN (CLEANUP)
# ==============================================================================
# Löscht die gesamte Resource Group samt aller darin enthaltenen Ressourcen
# (Load Balancer, Application Gateway, WAF, VMs, Public IPs, VNet)
# Parameter:
#   -n / --name $RG : Name der zu löschenden Resource Group

az group delete \
  -n $RG
