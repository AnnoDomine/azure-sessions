#!/usr/bin/env bash
# ==============================================================================
# 28. SERVICE NACH ROLLOUT AUF V2 TESTEN
# ==============================================================================
# Verifiziert, dass der Service nun die neue Anwendungsversion v2 zurückliefert.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"
export BOOTCAMP_URL="http://$(minikube ip):$(kubectl get service "$KUBERNETES_NAMESPACE" -o jsonpath='{.spec.ports[0].nodePort}')"

curl "$BOOTCAMP_URL"
