#!/usr/bin/env bash
# ==============================================================================
# 32. RESSOURCEN BEREINIGEN (CLEANUP)
# ==============================================================================
# Löscht alle im Rahmen der Session erstellten Deployments und Services rückstandsfrei.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"
export KUBERNETES_LAB_NAMESPACE="nginx"

# Bootcamp-Ressourcen entfernen
kubectl delete deployments/$KUBERNETES_NAMESPACE
kubectl delete services/$KUBERNETES_NAMESPACE

# Nginx-Ressourcen entfernen
kubectl delete deployments/$KUBERNETES_LAB_NAMESPACE
kubectl delete services/$KUBERNETES_LAB_NAMESPACE
