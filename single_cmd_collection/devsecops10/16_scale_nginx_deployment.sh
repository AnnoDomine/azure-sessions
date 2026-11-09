#!/usr/bin/env bash
# ==============================================================================
# 17. NGINX-DEPLOYMENT SKALIEREN
# ==============================================================================
# Skaliert das Nginx-Deployment deklarativ auf 3 Replikate hoch.

export KUBERNETES_LAB_NAMESPACE="nginx"

kubectl scale deployment $KUBERNETES_LAB_NAMESPACE --replicas=3
