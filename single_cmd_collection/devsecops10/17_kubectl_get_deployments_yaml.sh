#!/usr/bin/env bash
# ==============================================================================
# 18. DEPLOYMENT-MANIFESTE ALS YAML INSPICIEREN
# ==============================================================================
# Exportiert und visualisiert die vollständigen deklarativen Spezifikationen (YAML)
# beider Deployments.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"
export KUBERNETES_LAB_NAMESPACE="nginx"

kubectl get deployments $KUBERNETES_NAMESPACE -o yaml
kubectl get deployments $KUBERNETES_LAB_NAMESPACE -o yaml
