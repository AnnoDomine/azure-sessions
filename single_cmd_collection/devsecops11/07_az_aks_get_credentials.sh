#!/usr/bin/env bash
# ==============================================================================
# 7. AKS-ZUGANGSDATEN (KUBECONFIG) ABRUFEN
# ==============================================================================
# Lädt die Zugangsdaten und Zertifikate des AKS-Clusters in die lokale
# Kubeconfig-Datei (~/.kube/config) herunter und konfiguriert den aktuellen
# kubectl-Kontext auf den neu erstellten Cluster.
# Parameter:
#   --resource-group $RG : Name der Azure Resource Group (rg-dev-aks)
#   --name $CLUSTER      : Name des AKS-Clusters (aks-west-eu)

az aks get-credentials \
  --resource-group "$RG" \
  --name "$CLUSTER"
