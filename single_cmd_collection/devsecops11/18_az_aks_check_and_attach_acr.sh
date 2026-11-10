#!/usr/bin/env bash
# ==============================================================================
# 18. ACR-ANBINDUNG VALIDIEREN & AKS CLUSTER ATTACHEN
# ==============================================================================
# Prüft die Erreichbarkeit und Berechtigungen der ACR aus Sicht des AKS-Clusters
# und bindet die Registry über den Azure CLI Befehl '--attach-acr' nahtlos an.
# Parameter:
#   --resource-group / -g $RG : Name der Resource Group (rg-dev-aks)
#   --name / -n $CLUSTER      : Name des AKS-Clusters (aks-west-eu)
#   --acr "$ACR.azurecr.io"   : FQDN der Ziel-ACR für die Diagnose
#   --attach-acr $ACR         : Verknüpft die ACR nativ mit der AKS-Clusterkonfiguration

az aks check-acr \
  -g "$RG" \
  -n "$CLUSTER" \
  --acr "${ACR}.azurecr.io"

az aks update \
  --name "$CLUSTER" \
  --resource-group "$RG" \
  --attach-acr "$ACR"
