#!/usr/bin/env bash
# ==============================================================================
# 25. STATEFULSET-WORKLOAD & SPEICHER BEREITSTELLEN (APPLY)
# ==============================================================================
# Wendet die StatefulSet-Ressourcen in der richtigen Reihenfolge an:
# Namespace -> ConfigMap -> Service -> StatefulSet.
# Der AKS-Cluster löst über den CSI-Treiber automatisch die Erstellung einer
# Azure Managed Disk im Azure-Hintergrund für das PVC aus.

kubectl apply -f namespace.yaml
kubectl apply -f configmap.yaml
kubectl apply -f service.yaml
kubectl apply -f statefulset.yaml
