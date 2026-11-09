#!/usr/bin/env bash
# ==============================================================================
# 1. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Alle Basis-Umgebungsvariablen für DevSecOps 10 (Kubernetes & Minikube Intro):

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"
export KUBERNETES_LAB_NAMESPACE="nginx"

# Dynamisch ermittelte Variablen (werden im Verlauf der Session gesetzt):
# export POD_NAME=$(kubectl get pods -l app=$KUBERNETES_NAMESPACE -o jsonpath='{.items[0].metadata.name}')
# export BOOTCAMP_URL="http://$(minikube ip):$(kubectl get service "$KUBERNETES_NAMESPACE" -o jsonpath='{.spec.ports[0].nodePort}')"
