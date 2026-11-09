#!/usr/bin/env bash
# ==============================================================================
# 23. SERVICE VIA HTTP (CURL) TESTEN
# ==============================================================================
# Sendet einen HTTP-Request an den Service und überprüft die Antwort des Pods.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"
export BOOTCAMP_URL="http://$(minikube ip):$(kubectl get service "$KUBERNETES_NAMESPACE" -o jsonpath='{.spec.ports[0].nodePort}')"

curl "$BOOTCAMP_URL"
