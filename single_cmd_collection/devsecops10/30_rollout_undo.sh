#!/usr/bin/env bash
# ==============================================================================
# 31. ROLLOUT RÜCKGÄNGIG MACHEN (ROLLBACK)
# ==============================================================================
# Macht das fehlerhafte Update rückgängig und rollt das Deployment auf die
# letzte funktionierende Revision zurück.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"

kubectl rollout undo deployments/$KUBERNETES_NAMESPACE

echo "Pod-Status nach dem Rollback:"
kubectl get pods
