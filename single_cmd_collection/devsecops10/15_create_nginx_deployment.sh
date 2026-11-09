#!/usr/bin/env bash
# ==============================================================================
# 16. NGINX-DEPLOYMENT ERSTELLEN
# ==============================================================================
# Erstellt ein zweites Deployment auf Basis des offiziellen Nginx-Images.

export KUBERNETES_LAB_NAMESPACE="nginx"

kubectl create deployment $KUBERNETES_LAB_NAMESPACE --image=nginx
