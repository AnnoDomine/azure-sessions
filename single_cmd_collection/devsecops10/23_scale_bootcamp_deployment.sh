#!/usr/bin/env bash
# ==============================================================================
# 24. BOOTCAMP-DEPLOYMENT HOCHSKALIEREN
# ==============================================================================
# Skaliert das Bootcamp-Deployment auf 4 Replikate hoch, um Lastverteilung
# (Load Balancing) zu ermöglichen.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"

kubectl scale deployments/$KUBERNETES_NAMESPACE --replicas=4
kubectl get pods
