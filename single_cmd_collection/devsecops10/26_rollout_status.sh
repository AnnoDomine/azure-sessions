#!/usr/bin/env bash
# ==============================================================================
# 27. ROLLOUT-STATUS ÜBERWACHEN
# ==============================================================================
# Beobachtet den Fortschritt des Rolling Updates bis alle neuen Pods erfolgreich
# den Status 'Ready' erreicht haben und alte Pods terminiert wurden.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"

kubectl rollout status deployments/$KUBERNETES_NAMESPACE
