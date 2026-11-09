#!/usr/bin/env bash
# ==============================================================================
# 29. FEHLERHAFTEN ROLLOUT SIMULIEREN (VERSION V10)
# ==============================================================================
# Setzt absichtlich ein nicht existentes Image-Tag (v10), um ein fehlgeschlagenes
# Deployment und den Zustand 'ImagePullBackOff' zu provozieren.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"

kubectl set image deployments/$KUBERNETES_NAMESPACE \
  $KUBERNETES_NAMESPACE=gcr.io/google-samples/$KUBERNETES_NAMESPACE:v10

kubectl get pods
