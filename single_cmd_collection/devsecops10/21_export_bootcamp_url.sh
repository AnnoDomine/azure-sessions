#!/usr/bin/env bash
# ==============================================================================
# 22. SERVICE-URL ERMITTELN & EXPORTIEREN
# ==============================================================================
# Extrahiert die Minikube-IP-Adresse und den dynamisch vergebenen NodePort des
# Bootcamp-Services und setzt die vollständige HTTP-URL zusammen.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"

export BOOTCAMP_URL="http://$(minikube ip):$(kubectl get service "$KUBERNETES_NAMESPACE" -o jsonpath='{.spec.ports[0].nodePort}')"
echo "Bootcamp URL: $BOOTCAMP_URL"

# Alternativer Minikube-Helper zur URL-Ermittlung:
# minikube service "$KUBERNETES_NAMESPACE" --url
