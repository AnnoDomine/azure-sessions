#!/usr/bin/env bash
# ==============================================================================
# 21. NGINX-DEMO-MANIFESTE BEREITSTELLEN (APPLY)
# ==============================================================================
# Wendet die Kubernetes-Manifeste der Reihe nach an: Zuerst wird der Namespace
# angelegt, anschließend werden Deployment und Service bereitgestellt.

kubectl apply -f namespace.yaml
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
