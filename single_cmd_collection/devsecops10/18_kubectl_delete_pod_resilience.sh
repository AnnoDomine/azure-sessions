#!/usr/bin/env bash
# ==============================================================================
# 19. POD-RESILIENZ & SELF-HEALING TESTEN
# ==============================================================================
# Löscht gezielt den aktiven Pod. Da das Deployment einen gewünschten Sollzustand
# (Desired State) von mindestens 1 Replikat vorgibt, provisioniert der
# Deployment/ReplicaSet-Controller unverzüglich automatisch einen neuen Pod.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"
export POD_NAME=$(kubectl get pods -l app=$KUBERNETES_NAMESPACE -o jsonpath='{.items[0].metadata.name}')

echo "Lösche Pod: $POD_NAME"
kubectl delete pod "$POD_NAME"

echo "Aktualisierte Pod-Liste (neuer Pod wird automatisch gestartet):"
kubectl get pods
