#!/usr/bin/env bash
# ==============================================================================
# 26. ROLLING UPDATE AUF IMAGE-VERSION V2
# ==============================================================================
# Führt ein unterbrechungsfreies Rolling Update durch, indem das Container-Image
# auf Version v2 (docker.io/jocatalin/kubernetes-bootcamp:v2) aktualisiert wird.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"

kubectl set image deployments/$KUBERNETES_NAMESPACE \
  $KUBERNETES_NAMESPACE=docker.io/jocatalin/$KUBERNETES_NAMESPACE:v2

kubectl get pods
